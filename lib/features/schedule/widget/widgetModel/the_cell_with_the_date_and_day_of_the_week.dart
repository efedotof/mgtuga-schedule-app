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
import 'package:intl/intl.dart';

class TheCellWithTheDateAndDayOfTheWeek extends StatelessWidget {
  const TheCellWithTheDateAndDayOfTheWeek({
    super.key,
    required this.rowIdx,
    required this.day,
  });

  final int rowIdx;
  final DateTime day;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 160,
      margin: const EdgeInsets.symmetric(vertical: 2),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: rowIdx.isEven ? Colors.indigo.shade50 : Colors.indigo.shade50,
        border: Border(
          left: BorderSide(color: Colors.indigo.shade300, width: 2),
          top: BorderSide(color: Colors.indigo.shade300, width: 1),
          bottom: BorderSide(color: Colors.indigo.shade300, width: 1),
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        "${DateFormat.E('ru_RU').format(day)}\n${DateFormat('dd.MM').format(day)}",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 14,
          color: Colors.indigo.shade700,
        ),
      ),
    );
  }
}
