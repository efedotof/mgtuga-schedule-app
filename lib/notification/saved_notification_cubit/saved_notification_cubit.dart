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
import 'package:classmate/notification/saved_notification/saved_notification_interface.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'saved_notification_state.dart';
part 'saved_notification_cubit.freezed.dart';

class SavedNotificationCubit extends Cubit<SavedNotificationState> {
  final SavedNotificationInterface _savedNotificationInterface;

  SavedNotificationCubit({
    required SavedNotificationInterface savedNotificationInterface,
  }) : _savedNotificationInterface = savedNotificationInterface,
       super(const SavedNotificationState(isEnabled: false)) {
    _loadNotificationState();
  }

  Future<void> _loadNotificationState() async {
    try {
      final saved = await _savedNotificationInterface.getSavedNotification();
      emit(SavedNotificationState(isEnabled: saved));
    } catch (e) {
      // Можно добавить лог
    }
  }

  Future<void> setNotificationState(bool isEnabled) async {
    try {
      _savedNotificationInterface.setSavednotification(isEnabled);
      emit(SavedNotificationState(isEnabled: isEnabled));
    } catch (e) {
      // Можно добавить лог
    }
  }
}
