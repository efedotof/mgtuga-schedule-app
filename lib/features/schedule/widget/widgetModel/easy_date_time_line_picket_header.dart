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

class EasyDateTimeLinePicketHeader extends StatefulWidget {
  const EasyDateTimeLinePicketHeader({
    required this.formattedMonth,
    required this.goToToday,
    required this.onTap,
    super.key,
  });
  final void Function()? goToToday;
  final void Function()? onTap;
  final String formattedMonth;

  @override
  State<EasyDateTimeLinePicketHeader> createState() =>
      _EasyDateTimeLinePicketHeaderState();
}

class _EasyDateTimeLinePicketHeaderState
    extends State<EasyDateTimeLinePicketHeader> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton.icon(
          onPressed: widget.goToToday,
          icon: Icon(Icons.today, color: Colors.white),
          label: Text('На сегодня', style: TextStyle(color: Colors.white)),
          style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple),
        ),

        const SizedBox(width: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(),
              GestureDetector(
                onTap: widget.onTap,
                child: Text(
                  widget.formattedMonth,
                  style: const TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
