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

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'switch_type_calendar_state.dart';
part 'switch_type_calendar_cubit.freezed.dart';

class SwitchTypeCalendarCubit extends Cubit<SwitchTypeCalendarState> {
  SwitchTypeCalendarCubit() : super(SwitchTypeCalendarState.list());

  void switchTo() {
    state.maybeWhen(
      list: () => emit(SwitchTypeCalendarState.grid()),
      grid: () => emit(SwitchTypeCalendarState.list()),
      orElse: () {},
    );
  }
}
