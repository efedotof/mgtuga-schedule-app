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

class EasyDateTimeLinePickerBuilder extends StatefulWidget {
  const EasyDateTimeLinePickerBuilder({
    required this.isSelected,
    required this.isDisabled,
    required this.onTap,
    required this.bgColor,
    required this.day,
    required this.weekDay,
    super.key,
    required this.textColor,
  });

  final bool isSelected;
  final bool isDisabled;
  final Function() onTap;
  final Color bgColor;
  final String day;
  final String weekDay;
  final Color textColor;

  @override
  State<EasyDateTimeLinePickerBuilder> createState() =>
      _EasyDateTimeLinePickerBuilderState();
}

class _EasyDateTimeLinePickerBuilderState
    extends State<EasyDateTimeLinePickerBuilder> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: widget.isDisabled ? null : widget.onTap,
      child: Container(
        width: 52,
        margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 6),
        decoration: BoxDecoration(
          color: widget.bgColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: widget.isSelected ? Colors.deepPurple : Colors.grey.shade300,
            width: widget.isSelected ? 2 : 1,
          ),
          boxShadow:
              widget.isSelected
                  ? [
                    BoxShadow(
                      color: Colors.deepPurple.shade400,
                      blurRadius: 6,
                      offset: const Offset(0, 3),
                    ),
                  ]
                  : [],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.day,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: widget.textColor,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              widget.weekDay,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: widget.textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
