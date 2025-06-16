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

class StepWidgetModel extends StatelessWidget {
  const StepWidgetModel({
    super.key,
    required this.textDescript,
    required this.stepNumber,
  });

  final String textDescript;
  final String stepNumber;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          SizedBox(height: 16),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Text(textDescript, textAlign: TextAlign.center),
          ),
          SizedBox(height: 8),
          Text(stepNumber),
        ],
      ),
    );
  }
}

// 'Это может занять время, мы загружаем все расписание на весь семестр, прошу, проявите терпение',
