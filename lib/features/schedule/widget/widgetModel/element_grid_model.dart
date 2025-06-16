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
import 'package:flutter/material.dart';

class ElementGridModel extends StatelessWidget {
  const ElementGridModel({
    super.key,
    required this.rowIdx,
    required this.todayLessons,
  });

  final int rowIdx;
  final List<ScheduleModel> todayLessons;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 160,
      margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
      decoration: BoxDecoration(
        color: rowIdx.isEven ? Colors.white : Colors.grey.shade50,
        borderRadius: BorderRadius.circular(12),
        boxShadow:
            todayLessons.isNotEmpty
                ? [
                  BoxShadow(
                    color: Colors.indigo.shade100,
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ]
                : null,
      ),
      child:
          todayLessons.isNotEmpty
              ? Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      todayLessons.first.discipline,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.indigo,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "${todayLessons.first.beginLesson} - ${todayLessons.first.endLesson}",
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      todayLessons.first.kindOfWork,
                      style: TextStyle(
                        color: Colors.deepPurple.shade700,
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    const SizedBox(height: 6),
                    Text(
                      "📍 ${todayLessons.first.building}, ${todayLessons.first.auditorium}",
                      style: TextStyle(
                        color: Colors.grey.shade700,
                        fontSize: 12,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    Text(
                      "👨‍🏫 ${todayLessons.first.lecturer}, ${todayLessons.first.lecturer_title}",
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 12,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ],
                ),
              )
              : null,
    );
  }
}
