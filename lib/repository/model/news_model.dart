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

import "package:freezed_annotation/freezed_annotation.dart";

part 'news_model.freezed.dart';

@freezed
class News with _$News {
  const factory News({
    required String date,
    required String title,
    required String link,
    required String? imageUrl,
    required String description,
  }) = _News;
}
