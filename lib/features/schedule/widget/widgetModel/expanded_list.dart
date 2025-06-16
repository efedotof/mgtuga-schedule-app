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

import 'package:classmate/features/schedule/cubit/schedule_cubit.dart';
import 'package:classmate/repository/model/schedule_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'element_list.dart';

class ExpandedList extends StatelessWidget {
  const ExpandedList({required this.selectedDate, super.key});

  final DateTime selectedDate;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<ScheduleCubit, ScheduleState>(
        builder: (context, state) {
          return state.when(
            initial: () => const Center(child: CircularProgressIndicator()),
            loading: () => const Center(child: CircularProgressIndicator()),
            noData:
                () => const Center(
                  child: Text('Выходной!', style: TextStyle(fontSize: 18)),
                ),
            data: (List<ScheduleModel> schedules) {
              final filteredSchedules =
                  schedules.where((schedule) {
                    final scheduleDate = DateTime.parse(schedule.date);
                    return scheduleDate.year == selectedDate.year &&
                        scheduleDate.month == selectedDate.month &&
                        scheduleDate.day == selectedDate.day;
                  }).toList();

              if (filteredSchedules.isEmpty) {
                return const Center(
                  child: Text("Выходной!", style: TextStyle(fontSize: 16)),
                );
              }
              return ListView.builder(
                itemCount: filteredSchedules.length,
                itemBuilder: (context, index) {
                  final item = filteredSchedules[index];

                  return ElementList(item: item);
                },
              );
            },
            error: (String error) => Center(child: Text("Ошибка: $error")),
          );
        },
      ),
    );
  }
}
