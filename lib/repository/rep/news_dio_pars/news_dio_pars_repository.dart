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

import 'package:classmate/repository/model/news_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:html/parser.dart' as parser;
import 'dart:io';
import 'news_dio_pars_interface.dart';

class NewsDioParsRepository implements NewsDioParsInterface {
  final Dio _dio = Dio();
  final String baseUrl = 'https://www.mstuca.ru';

  NewsDioParsRepository() {
    _dio.options = BaseOptions(
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
      headers: {
        'User-Agent':
            'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36',
        'Accept':
            'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8',
        'Accept-Language': 'ru-RU,ru;q=0.9,en-US;q=0.8,en;q=0.7',
      },
      validateStatus: (status) => status! < 500,
    );

    _dio.interceptors.add(
      LogInterceptor(
        requestHeader: false,
        responseHeader: false,
        requestBody: false,
      ),
    );
  }

  @override
  Future<List<News>> parseNewsPage(int page) async {
    final url =
        page == 1
            ? '$baseUrl/about_the_university/news/'
            : '$baseUrl/about_the_university/news/?PAGEN_1=$page';

    try {
      final response = await _dio.get(url);
      if (response.statusCode != HttpStatus.ok) {
        throw DioException(
          requestOptions: RequestOptions(path: url),
          response: response,
          error: 'HTTP Status ${response.statusCode}',
        );
      }

      final document = parser.parse(response.data);
      final newsItems = <News>[];

      for (var element in document.querySelectorAll('.news-item')) {
        try {
          final date =
              element.querySelector('.news-item-date')?.text.trim() ?? '';
          final titleElement = element.querySelector('.news-item-header a');
          final title = titleElement?.text.trim() ?? '';
          final relativeLink = titleElement?.attributes['href'] ?? '';
          final link = '$baseUrl$relativeLink';

          final imageElement = element.querySelector('.news-item-image img');
          final imageUrl =
              imageElement != null && imageElement.attributes['src'] != null
                  ? '$baseUrl${imageElement.attributes['src']}'
                  : null;

          // Удаляем заголовок из текста новости
          final textElement = element.querySelector('.news-item-text');
          final descriptionHtml = textElement?.innerHtml ?? '';
          final description = descriptionHtml
              .replaceFirst(
                RegExp(r'<h3.*?>.*?</h3>', caseSensitive: false),
                '',
              )
              .replaceAll(RegExp(r'<[^>]+>|&nbsp;'), ' ')
              .trim()
              .replaceAll(RegExp(r'\s{2,}'), ' ');
          debugPrint(imageUrl);
          newsItems.add(
            News(
              date: date,
              title: title,
              link: link,
              imageUrl: imageUrl,
              description: description,
            ),
          );
        } catch (e) {
          debugPrint('Ошибка парсинга элемента: $e');
        }
      }

      return newsItems;
    } on DioException catch (e) {
      if (e.response?.statusCode == HttpStatus.notFound) {
        debugPrint('Страница $page не найдена (404)');
        return [];
      }
      rethrow;
    }
  }

  @override
  Future<List<News>> getAllNews({int maxPages = 20}) async {
    final allNews = <News>[];
    int currentPage = 1;
    int consecutiveEmpty = 0;

    while (currentPage <= maxPages && consecutiveEmpty < 3) {
      try {
        debugPrint('[Dio] Загрузка страницы $currentPage...');
        final pageNews = await parseNewsPage(currentPage);

        if (pageNews.isEmpty) {
          consecutiveEmpty++;
          debugPrint('Страница $currentPage пуста (empty $consecutiveEmpty/3)');
        } else {
          allNews.addAll(pageNews);
          consecutiveEmpty = 0;
          debugPrint(
            'Добавлено ${pageNews.length} новостей (всего: ${allNews.length})',
          );
        }

        // Адаптивная задержка
        final delay = Duration(milliseconds: 800 + consecutiveEmpty * 200);
        await Future.delayed(delay);

        currentPage++;
      } on DioException catch (e) {
        debugPrint('Ошибка Dio на странице $currentPage: ${e.message}');
        if (e.type == DioExceptionType.connectionTimeout ||
            e.type == DioExceptionType.receiveTimeout) {
          await Future.delayed(const Duration(seconds: 5));
          continue;
        }
        break;
      } catch (e) {
        debugPrint('Критическая ошибка на странице $currentPage: $e');
        break;
      }
    }

    return allNews;
  }
}
