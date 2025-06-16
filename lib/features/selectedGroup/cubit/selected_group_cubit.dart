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
import 'package:classmate/repository/model/group_model.dart';
import 'package:classmate/repository/rep/search_group_dio/search_group_dio_interface.dart';
import 'package:classmate/repository/rep/search_group_dio/search_group_dio_repository.dart';
import 'package:classmate/router/auto_route.dart';
import 'package:classmate/storage/group_id_storage/group_id_storage_interface.dart';
import 'package:classmate/storage/group_storage/group_storage_interface.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'selected_group_state.dart';
part 'selected_group_cubit.freezed.dart';

class SelectedGroupCubit extends Cubit<SelectedGroupState> {
  SelectedGroupCubit({
    required GroupIdStorageInterface groupIdStorage,
    required GroupStorageInterface groupStorageInterface,
    required SearchGroupDioRepository searchModel,
  }) : _groupIdStorage = groupIdStorage,
       _groupStorageInterface = groupStorageInterface,
       _searchModel = searchModel,
       super(SelectedGroupState.initial());

  final SearchGroupDioInterface _searchModel;
  final GroupStorageInterface _groupStorageInterface;
  final GroupIdStorageInterface _groupIdStorage;

  Future<void> saveGroup({
    required BuildContext context,
    required GroupModel model,
  }) async {
    try {
      _groupStorageInterface.setGroup(model.label);
      _groupIdStorage.setGroupID(model.id);
      context.replaceRoute(MainHomeRoute());
    } catch (e) {
      debugPrint('error to save Group');
    }
  }

  Future<void> search({required String query}) async {
    if (query.isNotEmpty) {
      emit(SelectedGroupState.initial());
    }
    try {
      emit(SelectedGroupState.loading());
      List<GroupModel> groups = await _searchModel.search(query);

      if (groups.isNotEmpty) {
        emit(SelectedGroupState.found(group: groups));
      } else {
        emit(SelectedGroupState.noFound());
      }
    } catch (e) {
      emit(SelectedGroupState.errorFound());
    }
  }
}
