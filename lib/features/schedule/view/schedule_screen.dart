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

import 'package:auto_route/annotations.dart';
import 'package:classmate/features/schedule/cubit/switch_cubit/switch_type_calendar_cubit.dart';
import 'package:classmate/features/schedule/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class ScheduleScreen extends StatelessWidget {
  const ScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Расписание"),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
        // actions: [IconButton(onPressed: () {}, icon: Icon(Icons.settings))],
        // leading: IconButton(
        //   onPressed: () => context.read<SwitchTypeCalendarCubit>().switchTo(),
        //   icon: Icon(Icons.swap_horiz),
        // ),
      ),
      body: BlocBuilder<SwitchTypeCalendarCubit, SwitchTypeCalendarState>(
        builder: (context, state) {
          return state.when(list: () => ListScreen(), grid: () => GridScreen());
        },
      ),
    );
  }
}
