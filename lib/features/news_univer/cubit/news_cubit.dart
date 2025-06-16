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
import 'package:classmate/repository/model/news_model.dart';
import 'package:classmate/repository/rep/news_dio_pars/news_dio_pars_interface.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'news_state.dart';
part 'news_cubit.freezed.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit({required this.newsDio}) : super(NewsState.initial()) {
    getNewsPage(page: 0);
  }

  final NewsDioParsInterface newsDio;

  int currentPage = 0;

  Future<void> getNewsPage({required int page}) async {
    try {
      emit(NewsState.loading());
      final list = await newsDio.parseNewsPage(page);
      if (list.isEmpty) {
        emit(NewsState.emptyNews());
      } else {
        emit(NewsState.loaded(news: list));
      }
    } catch (e) {
      emit(NewsState.error(error: e.toString()));
    }
  }

  Future<void> getAllNews() async {
    try {
      emit(NewsState.loading());
      final list = await newsDio.getAllNews();
      if (list.isEmpty) {
        emit(NewsState.emptyNews());
      } else {
        emit(NewsState.loaded(news: list));
      }
    } catch (e) {
      emit(NewsState.error(error: e.toString()));
    }
  }

  Future<void> refres({required int requiredPage}) async {
    await getNewsPage(page: requiredPage);
  }
}
