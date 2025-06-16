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
import 'package:classmate/features/schedule/schedule.dart';
import 'package:classmate/features/selectedGroup/selected_group.dart';
import 'package:classmate/features/setting/setting.dart';
import 'package:classmate/features/splash/splash.dart';

import '../features/main_home/main_home.dart';
import '../features/news_univer/news_univer.dart';

part 'auto_route.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: SplashRoute.page, path: '/'),
    AutoRoute(page: SelectedGroupRoute.page, path: '/selected_group'),

    AutoRoute(
      page: MainHomeRoute.page,
      path: '/main_home',
      children: [
        AutoRoute(page: NewsUniverRoute.page, path: 'news'),
        AutoRoute(page: ScheduleRoute.page, path: 'schedule'),
        AutoRoute(page: SettingRoute.page, path: 'setting'),
      ],
    ),
  ];
}
