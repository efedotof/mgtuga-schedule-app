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

import 'dart:convert';

import 'package:classmate/repository/model/schedule_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'schedule_storage_interface.dart';

class ScheduleStorageRepository implements ScheduleStorageInterface {
  final SharedPreferences _preferences;

  ScheduleStorageRepository({required SharedPreferences preferences})
    : _preferences = preferences;

  static const String savedScheduleKey = "saved_schedule";
  @override
  Future<void> setSavedSchedule(List<ScheduleModel> schedule) async {
    final jsonList = schedule.map((model) => model.toJson()).toList();
    final jsonString = json.encode(jsonList);
    await _preferences.setString(savedScheduleKey, jsonString);
  }

  @override
  Future<List<ScheduleModel>> getSavedSchedule() async {
    final jsonString = _preferences.getString(savedScheduleKey);
    if (jsonString == null || jsonString.isEmpty) {
      return [];
    }

    final List<dynamic> jsonList = json.decode(jsonString);
    return jsonList
        .map((jsonItem) => ScheduleModel.fromJson(jsonItem))
        .toList();
  }
}
