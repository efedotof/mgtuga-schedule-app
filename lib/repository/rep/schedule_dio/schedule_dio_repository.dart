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

import 'package:classmate/repository/model/schedule_model.dart';
import 'package:flutter/material.dart';
import 'schedule_dio_interface.dart';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';

class ScheduleDioRepository implements ScheduleDioInterface {
  final Dio _dio = Dio();

  @override
  Future<List<ScheduleModel>> getSchedule({
    required String groupID,
    required DateTime startDate,
    required DateTime finishDate,
  }) async {
    final dateFormat = DateFormat('yyyy.MM.dd');
    final start = dateFormat.format(startDate);
    final finish = dateFormat.format(finishDate);

    debugPrint("$start - $finish");

    final response = await _dio.get(
      'https://ruz.mstuca.ru/api/schedule/group/$groupID',
      queryParameters: {'start': start, 'finish': finish, 'lng': 1},
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = response.data;
      return data.map((json) => ScheduleModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load schedule: ${response.statusCode}');
    }
  }
}
