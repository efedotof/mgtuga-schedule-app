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

import 'package:flutter/material.dart';

class ColumnName extends StatelessWidget {
  const ColumnName({super.key, required this.lessonsCount});

  final int lessonsCount;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 120),
        ...List.generate(lessonsCount, (index) {
          return Container(
            width: 300,
            height: 160,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.indigo.shade100,
              border: Border(
                top: BorderSide(color: Colors.indigo.shade300, width: 2),
                right: BorderSide(color: Colors.indigo.shade300, width: 1),
                bottom: BorderSide(color: Colors.indigo.shade300, width: 2),
              ),
              borderRadius: BorderRadius.only(topRight: Radius.circular(8)),
            ),
            child: Text(
              'Пара ${index + 1}',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.indigo,
              ),
            ),
          );
        }),
      ],
    );
  }
}
