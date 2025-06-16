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

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:classmate/repository/model/group_model.dart';

import 'search_group_dio_interface.dart';

class SearchGroupDioRepository implements SearchGroupDioInterface {
  final Dio _dio = Dio();

  @override
  Future<List<GroupModel>> search(String query) async {
    try {
      final response = await _dio.get(
        "https://ruz.mstuca.ru/api/search",
        queryParameters: {"term": query, "type": "group"},
      );

      if (response.statusCode == 200) {
        final data = response.data;
        if (data is List) {
          return data.map((item) => GroupModel.fromJson(item)).toList();
        } else {
          throw Exception("Unexpected response format");
        }
      } else {
        throw Exception("Failed to load groups: ${response.statusCode}");
      }
    } catch (e) {
      debugPrint("Произошла ошибка: $e");
      rethrow;
    }
  }
}
