// Copyright 2025 Федотов Егор Станиславович

// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at

//      http://www.apache.org/licenses/LICENSE-2.0

// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
import 'package:bloc/bloc.dart';
import 'package:classmate/repository/model/schedule_model.dart';
import 'package:classmate/repository/rep/schedule_dio/schedule_dio_interface.dart';
import 'package:classmate/storage/group_id_storage/group_id_storage_interface.dart';
import 'package:classmate/storage/schedule_storage/schedule_storage_interface.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'grid_schedule_state.dart';
part 'grid_schedule_cubit.freezed.dart';

class GridScheduleCubit extends Cubit<GridScheduleState> {
  GridScheduleCubit({
    required ScheduleStorageInterface scheduleStorage,
    required GroupIdStorageInterface groupID,
    required ScheduleDioInterface scheduleDio,
  }) : _scheduleStorage = scheduleStorage,
       _scheduleDio = scheduleDio,
       _groupID = groupID,
       super(GridScheduleState.initial());

  final GroupIdStorageInterface _groupID;
  final ScheduleDioInterface _scheduleDio;
  final ScheduleStorageInterface _scheduleStorage;

  Future<void> getScheduleGrid({required DateTime start}) async {
    emit(const GridScheduleState.loading());
    final listToStart = await _scheduleStorage.getSavedSchedule();
    if (listToStart.isNotEmpty) {
      emit(GridScheduleState.loaded(models: listToStart));
      debugPrint('Не пустой !');
    }
    try {
      final DateTime now = start;
      late DateTime semesterStart;
      late DateTime semesterEnd;

      if (now.month >= 1 && now.month <= 8) {
        semesterStart = DateTime(now.year, 1, 1);
        semesterEnd = DateTime(now.year, 8, 31);
      } else {
        semesterStart = DateTime(now.year, 9, 1);
        semesterEnd = DateTime(now.year + 1, 1, 31);
      }

      final id = await _groupID.getGroupID();
      if (id.isEmpty) {
        emit(const GridScheduleState.error(error: "Группа не найдена"));
        return;
      }

      List<ScheduleModel> allSchedules = [];

      DateTime chunkStart = semesterStart;
      bool afterJune = false;

      while (chunkStart.isBefore(semesterEnd) ||
          chunkStart.isAtSameMomentAs(semesterEnd)) {
        DateTime maxAllowedFinish;

        if (!afterJune && chunkStart.month >= 1 && chunkStart.month <= 6) {
          final maxFinishLimit = DateTime(now.year, 6, 30);
          maxAllowedFinish =
              semesterEnd.isBefore(maxFinishLimit)
                  ? semesterEnd
                  : maxFinishLimit;
        } else {
          maxAllowedFinish = semesterEnd;
          afterJune = true;
        }

        final chunkEndCandidate = chunkStart.add(const Duration(days: 6));
        final chunkEnd =
            chunkEndCandidate.isBefore(maxAllowedFinish)
                ? chunkEndCandidate
                : maxAllowedFinish;

        if (chunkStart.isBefore(DateTime(now.year, 3, 1))) {
          emit(const GridScheduleState.step1());
        } else if (chunkStart.isBefore(DateTime(now.year, 5, 1))) {
          emit(const GridScheduleState.step2());
        } else if (chunkStart.isBefore(DateTime(now.year, 7, 1))) {
          emit(const GridScheduleState.step3());
        } else {
          emit(const GridScheduleState.step4());
        }

        final chunkResult = await _scheduleDio.getSchedule(
          groupID: id,
          startDate: chunkStart,
          finishDate: chunkEnd,
        );
        allSchedules.addAll(chunkResult);

        chunkStart = chunkEnd.add(const Duration(days: 1));
        await Future.delayed(const Duration(seconds: 3));
      }

      final list = await _scheduleStorage.getSavedSchedule();
      if (list.isEmpty) {
        debugPrint("Сохраняем !");
        await _scheduleStorage.setSavedSchedule(allSchedules);
      }
      emit(GridScheduleState.loaded(models: allSchedules));
    } catch (e) {
      debugPrint("$e");
      emit(GridScheduleState.error(error: e.toString()));
    }
  }

  DateTime selectedDate = DateTime.now();
  final int lessonsCount = 7;

  List<DateTime> getSemesterDates(DateTime selected) {
    late DateTime semesterStart;
    late DateTime semesterEnd;

    if (selected.month >= 1 && selected.month <= 8) {
      semesterStart = DateTime(selected.year, 1, 1);
      semesterEnd = DateTime(selected.year, 8, 31);
    } else {
      semesterStart = DateTime(selected.year, 9, 1);
      semesterEnd = DateTime(selected.year + 1, 1, 31);
    }

    final totalDays = semesterEnd.difference(semesterStart).inDays + 1;

    return List.generate(totalDays, (i) => semesterStart.add(Duration(days: i)))
        .where((d) => d.weekday >= 1 && d.weekday <= 6) // исключаем воскресенья
        .toList();
  }
}
