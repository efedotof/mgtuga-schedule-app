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

import 'package:classmate/repository/model/schedule_model.dart';
import 'package:classmate/repository/rep/schedule_dio/schedule_dio_interface.dart';
import 'package:classmate/storage/group_id_storage/group_id_storage_interface.dart';
import 'package:classmate/storage/schedule_storage/schedule_storage_interface.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'schedule_state.dart';
part 'schedule_cubit.freezed.dart';

class ScheduleCubit extends Cubit<ScheduleState> {
  ScheduleCubit({
    required this.scheduleStorage,
    required ScheduleDioInterface scheduleDio,
    required GroupIdStorageInterface groupID,
  }) : _scheduleDio = scheduleDio,
       _groupID = groupID,
       super(ScheduleState.initial());

  final GroupIdStorageInterface _groupID;
  final ScheduleDioInterface _scheduleDio;
  final ScheduleStorageInterface scheduleStorage;

  Future<void> searchPara({required DateTime startDate}) async {
    try {
      emit(ScheduleState.loading());
      final scheduleStorageList = await scheduleStorage.getSavedSchedule();

      final finishDate = startDate.add(const Duration(days: 6));

      bool isInRange(String dateString) {
        final date = DateTime.tryParse(dateString);
        if (date == null) return false;

        final start = DateTime(startDate.year, startDate.month, startDate.day);
        final finish = DateTime(
          finishDate.year,
          finishDate.month,
          finishDate.day,
        );
        final scheduleDate = DateTime(date.year, date.month, date.day);

        return !scheduleDate.isBefore(start) && !scheduleDate.isAfter(finish);
      }

      final filteredLocalSchedules =
          scheduleStorageList.where((model) => isInRange(model.date)).toList();

      if (filteredLocalSchedules.isNotEmpty) {
        emit(ScheduleState.data(schedule: filteredLocalSchedules));
        return;
      }

      String groupId = await _groupID.getGroupID();
      if (groupId.isNotEmpty) {
        debugPrint("поиск данных по api");
        List<ScheduleModel> schedules = await _scheduleDio.getSchedule(
          groupID: groupId,
          startDate: startDate,
          finishDate: finishDate,
        );

        if (schedules.isEmpty) {
          emit(ScheduleState.noData());
        } else {
          emit(ScheduleState.data(schedule: schedules));
        }
      } else {
        emit(ScheduleState.error(error: "Ошибка кэширования ((-_-))"));
      }
    } catch (e) {
      emit(ScheduleState.error(error: "Неизвестная ошибка ((-_-))"));
    }
  }

  DateTime selectedDate = DateTime.now();
  DateTime? loadedStartDate;
  DateTime? loadedEndDate;

  void loadScheduleIfNeeded({
    required BuildContext context,
    required DateTime date,
  }) {
    final weekStart = date.subtract(Duration(days: date.weekday - 1));
    final weekEnd = weekStart.add(const Duration(days: 6));

    final alreadyLoaded =
        loadedStartDate != null &&
        loadedEndDate != null &&
        weekStart.isAfter(loadedStartDate!.subtract(const Duration(days: 1))) &&
        weekEnd.isBefore(loadedEndDate!.add(const Duration(days: 1)));

    if (alreadyLoaded) return;

    context.read<ScheduleCubit>().searchPara(startDate: weekStart);
    loadedStartDate = weekStart;
    loadedEndDate = weekEnd;
  }

  void Function()? goToToday({required BuildContext context}) {
    final now = DateTime.now();
    selectedDate = now;
    loadScheduleIfNeeded(context: context, date: now);
    return null;
  }

  void changeDate({required BuildContext context, required DateTime date}) {
    selectedDate = date;
    loadScheduleIfNeeded(context: context, date: date);
  }
}
