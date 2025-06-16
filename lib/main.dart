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

import 'package:classmate/features/news_univer/cubit/news_cubit.dart';
import 'package:classmate/features/schedule/cubit/grid_schedule_cubit/grid_schedule_cubit.dart';
import 'package:classmate/features/schedule/cubit/schedule_cubit.dart';
import 'package:classmate/features/schedule/cubit/switch_cubit/switch_type_calendar_cubit.dart';
import 'package:classmate/features/selectedGroup/cubit/selected_group_cubit.dart';
import 'package:classmate/features/setting/cubit/setting_cubit.dart';
import 'package:classmate/notification/saved_notification_cubit/saved_notification_cubit.dart';
import 'package:classmate/repository/rep/news_dio_pars/news_dio_pars_repository.dart';
import 'package:classmate/repository/rep/schedule_dio/schedule_dio_repository.dart';
import 'package:classmate/repository/rep/search_group_dio/search_group_dio_repository.dart';
import 'package:classmate/router/auto_route.dart';
import 'package:classmate/storage/group_id_storage/group_id_storage_repository.dart';
import 'package:classmate/storage/group_storage/group_storage_repository.dart';
import 'package:classmate/theme/cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'features/splash/cubit/splash_cubit.dart';
import 'library/easy_date_timeline.dart';
import 'notification/repository/notification_repository.dart';
import 'notification/saved_notification/saved_notification_repository.dart';
import 'notification/timezone_helper.dart';
import 'storage/schedule_storage/schedule_storage_repository.dart';
import 'theme/repository/theme_repository.dart';
import 'theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await TimezoneHelper.init();
  final prefs = await SharedPreferences.getInstance();
  final themeRepository = ThemeRepository(preferences: prefs);
  final savedNotification = SavedNotificationRepository(prefs: prefs);
  final notificationRepository = NotificationRepository();
  notificationRepository.init();
  final groupIdRepository = GroupIdStorageRepository(prefs: prefs);
  final groupStorageRepository = GroupStorageRepository(preferences: prefs);
  final scheduleStorageRepository = ScheduleStorageRepository(
    preferences: prefs,
  );
  final newsDioParsRepository = NewsDioParsRepository();
  final scheduleDioRepository = ScheduleDioRepository();
  final searchGroupRepository = SearchGroupDioRepository();

  if (await savedNotification.getSavedNotification()) {
    debugPrint('Уведомления включены!');
    await notificationRepository.scheduleDailyNotification(
      id: 1,
      title: 'Расписание на завтра',
      body: 'Проверь расписание на завтра!',
      hour: 19,
      minute: 35,
    );
  }

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ThemeCubit(themeInterface: themeRepository),
        ),
        BlocProvider(
          create:
              (context) => SavedNotificationCubit(
                savedNotificationInterface: savedNotification,
              ),
        ),
        BlocProvider(
          create:
              (context) => SplashCubit(
                groupIDStorage: groupIdRepository,
                groupStorage: groupStorageRepository,
              ),
        ),
        BlocProvider(
          create: (context) => NewsCubit(newsDio: newsDioParsRepository),
        ),
        BlocProvider(create: (context) => SwitchTypeCalendarCubit()),
        BlocProvider(
          create:
              (context) => GridScheduleCubit(
                scheduleDio: scheduleDioRepository,
                groupID: groupIdRepository,
                scheduleStorage: scheduleStorageRepository,
              ),
        ),
        BlocProvider(
          create:
              (context) => ScheduleCubit(
                scheduleDio: scheduleDioRepository,
                groupID: groupIdRepository,
                scheduleStorage: scheduleStorageRepository,
              ),
        ),
        BlocProvider(
          create:
              (context) => SelectedGroupCubit(
                searchModel: searchGroupRepository,
                groupStorageInterface: groupStorageRepository,
                groupIdStorage: groupIdRepository,
              ),
        ),
        BlocProvider(create: (context) => SettingCubit()),
      ],
      child: const ClassmateApp(),
    ),
  );
}

class ClassmateApp extends StatefulWidget {
  const ClassmateApp({super.key});

  @override
  State<ClassmateApp> createState() => _ClassmateAppState();
}

class _ClassmateAppState extends State<ClassmateApp> {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return MaterialApp.router(
          localizationsDelegates: const [
            EasyDateTimelineLocalizations.delegate,
          ],
          routerConfig: _appRouter.config(),
          theme: state.isDark ? lightTheme : darkTheme,
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
