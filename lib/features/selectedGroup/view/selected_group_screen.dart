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
import 'package:classmate/features/selectedGroup/cubit/selected_group_cubit.dart';
import 'package:classmate/features/selectedGroup/widget/widget.dart';
import 'package:classmate/repository/model/group_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class SelectedGroupScreen extends StatelessWidget {
  const SelectedGroupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Выбор группы"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: BlocBuilder<SelectedGroupCubit, SelectedGroupState>(
          builder: (context, state) {
            return Column(
              children: [
                const SizedBox(height: 20),
                TextField(
                  onChanged: (query) {
                    context.read<SelectedGroupCubit>().search(query: query);
                  },
                  decoration: InputDecoration(
                    hintText: "Введите группу...",
                    prefixIcon: const Icon(Icons.search),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                    filled: true,

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: Colors.deepPurple,
                        width: 1,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: state.when(
                    initial:
                        () => const Center(child: Text('Начните поиск...')),
                    noFound:
                        () =>
                            const Center(child: Text('Мы ничего не нашли...')),
                    errorFound:
                        () =>
                            const Center(child: Text('Мы ничего не нашли...')),
                    loading:
                        () => const Center(child: CircularProgressIndicator()),
                    found:
                        (List<GroupModel> groups) => ListView.separated(
                          itemCount: groups.length,
                          separatorBuilder:
                              (_, __) => const SizedBox(height: 12),
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                context.read<SelectedGroupCubit>().saveGroup(
                                  model: groups[index],
                                  context: context,
                                );
                              },
                              child: GroupmodelUI(group: groups[index]),
                            );
                          },
                        ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
