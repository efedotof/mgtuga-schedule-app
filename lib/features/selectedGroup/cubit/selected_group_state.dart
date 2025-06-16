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

part of 'selected_group_cubit.dart';

@freezed
class SelectedGroupState with _$SelectedGroupState {
  const factory SelectedGroupState.initial() = _Initial;
  const factory SelectedGroupState.noFound() = _NoFound;
  const factory SelectedGroupState.errorFound() = _ErrorFound;
  const factory SelectedGroupState.found({required List<GroupModel> group}) =
      _Found;
  const factory SelectedGroupState.loading() = _Loading;
}
