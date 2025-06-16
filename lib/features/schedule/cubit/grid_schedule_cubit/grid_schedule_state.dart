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
part of 'grid_schedule_cubit.dart';

@freezed
class GridScheduleState with _$GridScheduleState {
  const factory GridScheduleState.initial() = _Initial;
  const factory GridScheduleState.error({required String error}) = _Error;
  const factory GridScheduleState.loading() = _Loading;
  const factory GridScheduleState.loaded({
    required List<ScheduleModel> models,
  }) = _Loaded;
  const factory GridScheduleState.step1() = _Step1;
  const factory GridScheduleState.step2() = _Step2;
  const factory GridScheduleState.step3() = _Step3;
  const factory GridScheduleState.step4() = _Step4;
}
