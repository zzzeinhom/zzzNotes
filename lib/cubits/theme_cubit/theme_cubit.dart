import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zzznotes/themes/themes.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  static final ThemeData _lightTheme = lightTheme;
  static final ThemeData _darkTheme = darkTheme;

  ThemeCubit() : super(ThemeState(themeData: _darkTheme));

  Future<void> _saveTheme(bool isDark) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDark', isDark);
  }

  void toggleTheme(bool isDark) {
    emit(ThemeState(themeData: isDark ? _darkTheme : _lightTheme));
    _saveTheme(isDark);
  }

  Future<void> loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final isDark = prefs.getBool('isDark');
    emit(ThemeState(themeData: isDark == true ? _darkTheme : _lightTheme));
  }

  Future<void> setInitialTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final isDark = prefs.getBool('isDark');
    if (isDark == null) {
      await _saveTheme(true);
      emit(ThemeState(themeData: _darkTheme));
    } else {
      emit(ThemeState(themeData: isDark == true ? _darkTheme : _lightTheme));
    }
  }
}
