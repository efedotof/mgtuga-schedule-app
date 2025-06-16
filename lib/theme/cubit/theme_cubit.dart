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
import 'package:classmate/theme/repository/theme_interface.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'theme_state.dart';
part 'theme_cubit.freezed.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit({required ThemeInterface themeInterface})
    : _themeInterface = themeInterface,
      super(ThemeState(brightness: Brightness.light)) {
    _initializeTheme();
  }

  final ThemeInterface _themeInterface;

  Future<void> setThemeBrightness(Brightness brightness) async {
    try {
      emit(ThemeState(brightness: brightness));
      await _themeInterface.setDarkThemeSelected(brightness == Brightness.dark);
    } catch (e) {
      debugPrint('Error setting theme: \$e');
    }
  }

  void _initializeTheme() {
    try {
      final isDark = _themeInterface.isDarkTheme();
      final brightness = isDark ? Brightness.dark : Brightness.light;
      emit(ThemeState(brightness: brightness));
    } catch (e) {
      debugPrint('Error initializing theme: \$e');
    }
  }
}
