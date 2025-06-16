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
import 'package:classmate/notification/saved_notification_cubit/saved_notification_cubit.dart';
import 'package:classmate/theme/cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Настройки')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BlocBuilder<ThemeCubit, ThemeState>(
              builder: (context, themeState) {
                return ListTile(
                  leading:
                      themeState.isDark
                          ? const Icon(Icons.light_mode)
                          : const Icon(Icons.dark_mode),
                  title: const Text('Тема'),
                  onTap: () {
                    // Navigate to update screen
                  },
                  trailing: Switch(
                    value: themeState.isDark,
                    onChanged: (value) => _setTheme(context, value),
                  ),
                );
              },
            ),
            BlocBuilder<SavedNotificationCubit, SavedNotificationState>(
              builder: (context, state) {
                return ListTile(
                  leading:
                      state.isEnabled
                          ? Icon(Icons.notifications_off)
                          : Icon(Icons.notification_add),
                  title: const Text('Уведомления'),
                  trailing: Switch(
                    value: state.isEnabled,
                    onChanged: (value) => _setNotification(context, value),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void _setTheme(BuildContext context, bool value) {
    context.read<ThemeCubit>().setThemeBrightness(
      value ? Brightness.dark : Brightness.light,
    );
  }

  void _setNotification(BuildContext context, bool value) {
    context.read<SavedNotificationCubit>().setNotificationState(value);
  }
}
