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
import 'package:auto_route/annotations.dart';
import 'package:classmate/features/news_univer/cubit/news_cubit.dart';
import 'package:classmate/features/news_univer/widget/widget.dart';
import 'package:classmate/repository/model/news_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class NewsUniverScreen extends StatefulWidget {
  const NewsUniverScreen({super.key});

  @override
  State<NewsUniverScreen> createState() => _NewsUniverScreenState();
}

class _NewsUniverScreenState extends State<NewsUniverScreen> {
  int currentPage = 1;
  final int totalPages = 75;
  final int visiblePages = 5;

  @override
  void initState() {
    super.initState();
    context.read<NewsCubit>().getNewsPage(page: currentPage);
  }

  List<int> _getVisiblePageNumbers() {
    int startPage;
    if (currentPage <= visiblePages ~/ 2 + 1) {
      startPage = 1;
    } else if (currentPage >= totalPages - visiblePages ~/ 2) {
      startPage = totalPages - visiblePages + 1;
    } else {
      startPage = currentPage - visiblePages ~/ 2;
    }

    return List.generate(
      visiblePages,
      (i) => startPage + i,
    ).where((p) => p >= 1 && p <= totalPages).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Новости")),
      body: BlocBuilder<NewsCubit, NewsState>(
        builder: (context, state) {
          return state.when(
            initial: () => const Center(child: Text('Привет!')),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (String error) => Center(child: Text(error)),
            emptyNews:
                () => const Center(child: Text("Ни**я себе, эт че? Ошибка ?!")),
            loaded: (List<News> news) {
              final cubit = context.read<NewsCubit>();

              return RefreshIndicator(
                onRefresh: () => cubit.refres(requiredPage: currentPage),
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Column(
                    children: [
                      ...List.generate(
                        news.length,
                        (index) => NewsItemModel(news: news[index]),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (currentPage > 1)
                            IconButton(
                              icon: const Icon(Icons.chevron_left),
                              onPressed: () {
                                setState(() {
                                  currentPage--;
                                });
                                cubit.getNewsPage(page: currentPage);
                              },
                            ),
                          ..._getVisiblePageNumbers().map(
                            (pageNumber) => Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 4,
                              ),
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    currentPage = pageNumber;
                                  });
                                  cubit.getNewsPage(page: pageNumber);
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color:
                                        pageNumber == currentPage
                                            ? Theme.of(context).primaryColor
                                            : Colors.transparent,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text(
                                    '$pageNumber',
                                    style: TextStyle(
                                      color:
                                          pageNumber == currentPage
                                              ? Theme.of(
                                                context,
                                              ).colorScheme.onPrimary
                                              : Theme.of(
                                                context,
                                              ).textTheme.bodyMedium?.color,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          if (currentPage < totalPages)
                            IconButton(
                              icon: const Icon(Icons.chevron_right),
                              onPressed: () {
                                setState(() {
                                  currentPage++;
                                });
                                cubit.getNewsPage(page: currentPage);
                              },
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
