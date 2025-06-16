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

import 'package:shared_preferences/shared_preferences.dart';

import 'group_storage_interface.dart';

class GroupStorageRepository implements GroupStorageInterface {
  final SharedPreferences _preferences;

  GroupStorageRepository({required SharedPreferences preferences})
    : _preferences = preferences;

  static const String groupKey = "group_string";

  @override
  Future<void> setGroup(String group) async {
    await _preferences.setString(groupKey, group);
  }

  @override
  Future<String> getGroup() async {
    return _preferences.getString(groupKey) ?? "";
  }
}
