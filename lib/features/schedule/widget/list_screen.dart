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
import 'package:classmate/features/schedule/widget/widgetModel/easy_date_time_line_picker_builder.dart';
import 'package:classmate/features/schedule/widget/widgetModel/easy_date_time_line_picket_header.dart';
import 'package:classmate/library/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'widgetModel/expanded_list.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  DateTime selectedDate = DateTime.now();
  DateTime? _loadedStartDate;
  DateTime? _loadedEndDate;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadScheduleIfNeeded(selectedDate);
    });
  }

  void _loadScheduleIfNeeded(DateTime date) {
    final weekStart = date.subtract(Duration(days: date.weekday - 1));
    final weekEnd = weekStart.add(const Duration(days: 6));

    final alreadyLoaded =
        _loadedStartDate != null &&
        _loadedEndDate != null &&
        weekStart.isAfter(
          _loadedStartDate!.subtract(const Duration(days: 1)),
        ) &&
        weekEnd.isBefore(_loadedEndDate!.add(const Duration(days: 1)));

    if (alreadyLoaded) return;

    context.read<ScheduleCubit>().searchPara(startDate: weekStart);
    _loadedStartDate = weekStart;
    _loadedEndDate = weekEnd;
  }

  void goToToday() {
    final now = DateTime.now();
    setState(() {
      selectedDate = now;
    });
    _loadScheduleIfNeeded(now);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            EasyDateTimeLinePicker.itemBuilder(
              locale: const Locale("ru"),
              firstDate: DateTime(2024, 1, 1),
              headerOptions: HeaderOptions(
                headerBuilder: (context, date, onTap) {
                  final formattedMonth = DateFormat.yMMMM('ru').format(date);

                  return EasyDateTimeLinePicketHeader(
                    formattedMonth: formattedMonth,
                    goToToday: goToToday,
                    onTap: onTap,
                  );
                },
              ),
              lastDate: DateTime(2026, 8, 29),
              focusedDate: selectedDate,
              itemExtent: 60.0,
              timelineOptions: const TimelineOptions(height: 80.0),
              onDateChange: (DateTime date) {
                setState(() {
                  selectedDate = date;
                });
                _loadScheduleIfNeeded(date);
              },
              itemBuilder: (
                BuildContext context,
                DateTime date,
                bool isSelected,
                bool isDisabled,
                bool isToday,
                void Function() onTap,
              ) {
                final weekDay = DateFormat.E('ru').format(date);
                final day = date.day.toString();

                final Color bgColor =
                    isSelected
                        ? Colors.deepPurple
                        : isToday
                        ? Colors.deepPurple.shade100
                        : Colors.white;

                final Color textColor =
                    isSelected
                        ? Colors.white
                        : isToday
                        ? Colors.deepPurple
                        : Colors.black87;

                return EasyDateTimeLinePickerBuilder(
                  isSelected: isSelected,
                  isDisabled: isDisabled,
                  onTap: onTap,
                  bgColor: bgColor,
                  day: day,
                  weekDay: weekDay,
                  textColor: textColor,
                );
              },
            ),

            const SizedBox(height: 10),
            ExpandedList(selectedDate: selectedDate),
          ],
        ),
      ),
    );
  }
}
