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

import 'package:classmate/features/schedule/cubit/grid_schedule_cubit/grid_schedule_cubit.dart';
import 'package:classmate/features/schedule/widget/widgetModel/step_widget_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgetModel/column_name.dart';
import 'widgetModel/element_grid_model.dart';
import 'widgetModel/the_cell_with_the_date_and_day_of_the_week.dart';

class GridScreen extends StatefulWidget {
  const GridScreen({super.key});

  @override
  State<GridScreen> createState() => _GridScreenState();
}

class _GridScreenState extends State<GridScreen> {
  @override
  void initState() {
    super.initState();
    context.read<GridScheduleCubit>().getScheduleGrid(
      start: context.read<GridScheduleCubit>().selectedDate,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Расписание')),
      body: BlocBuilder<GridScheduleCubit, GridScheduleState>(
        builder: (context, state) {
          return state.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error) => Center(child: Text('Ошибка: $error')),
            loaded: (models) {
              final semesterDays = context
                  .read<GridScheduleCubit>()
                  .getSemesterDates(
                    context.read<GridScheduleCubit>().selectedDate,
                  );

              return InteractiveViewer(
                maxScale: 3.0,
                minScale: 0.5,
                constrained: false,
                child: Scrollbar(
                  thumbVisibility: true,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: [
                          ColumnName(
                            lessonsCount:
                                context.read<GridScheduleCubit>().lessonsCount,
                          ),

                          ...List.generate(semesterDays.length, (rowIdx) {
                            final day = semesterDays[rowIdx];
                            return Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TheCellWithTheDateAndDayOfTheWeek(
                                  rowIdx: rowIdx,
                                  day: day,
                                ),

                                ...List.generate(
                                  context
                                      .read<GridScheduleCubit>()
                                      .lessonsCount,
                                  (colIdx) {
                                    final lessonNum = colIdx + 1;
                                    final todayLessons =
                                        models.where((m) {
                                          final mDate = DateTime.parse(m.date);
                                          return mDate.year == day.year &&
                                              mDate.month == day.month &&
                                              mDate.day == day.day &&
                                              m.lessonNumberStart <=
                                                  lessonNum &&
                                              m.lessonNumberEnd >= lessonNum;
                                        }).toList();

                                    return ElementGridModel(
                                      rowIdx: rowIdx,
                                      todayLessons: todayLessons,
                                    );
                                  },
                                ),
                              ],
                            );
                          }),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
            initial: () => const Center(child: Text('Куку')),
            step1:
                () => StepWidgetModel(
                  textDescript:
                      'Это может занять время, мы загружаем все расписание на весь семестр, прошу, проявите терпение',
                  stepNumber: 'Этап 1',
                ),
            step2:
                () => StepWidgetModel(
                  textDescript:
                      'Хм, как дела? У айпишки ограничения, поэтому так долго, извините (-_-)',
                  stepNumber: 'Этап 2',
                ),

            step3:
                () => StepWidgetModel(
                  textDescript: 'Еще немного!',
                  stepNumber: 'Этап 3',
                ),

            step4:
                () => StepWidgetModel(
                  textDescript: 'Это последний этап, спасибо!',
                  stepNumber: 'Этап 4',
                ),
          );
        },
      ),
    );
  }
}
