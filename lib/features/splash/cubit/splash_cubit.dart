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

import 'package:auto_route/auto_route.dart';
import 'package:bloc/bloc.dart';
import 'package:classmate/router/auto_route.dart';
import 'package:classmate/storage/group_id_storage/group_id_storage_interface.dart';
import 'package:classmate/storage/group_storage/group_storage_interface.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'splash_state.dart';
part 'splash_cubit.freezed.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit({
    required GroupIdStorageInterface groupIDStorage,
    required GroupStorageInterface groupStorage,
  }) : _groupStorage = groupStorage,
       _groupIDStorage = groupIDStorage,
       super(SplashState.initial());

  final GroupIdStorageInterface _groupIDStorage;
  final GroupStorageInterface _groupStorage;

  Future<void> loading({required BuildContext context}) async {
    try {
      String groupId = await _groupIDStorage.getGroupID();
      String group = await _groupStorage.getGroup();

      debugPrint("$groupId + $group");

      if (groupId.isNotEmpty && group.isNotEmpty && context.mounted) {
        context.replaceRoute(const MainHomeRoute());
      } else {
        if (context.mounted) {
          context.replaceRoute(const SelectedGroupRoute());
        }
      }
    } catch (e) {
      if (context.mounted) {
        context.replaceRoute(const SelectedGroupRoute());
      }
      debugPrint('Navigation error: $e');
    }
  }
}
