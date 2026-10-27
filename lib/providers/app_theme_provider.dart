import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppThemeProvider extends ChangeNotifier {
  ThemeMode appTheme = ThemeMode.light;

  Future<void> loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final isDark = prefs.getBool('isDarkMode') ?? false;

    appTheme = isDark ? ThemeMode.dark : ThemeMode.light;
  }

  Future<void> changeThemeLanguage(ThemeMode newTheme) async {
    if (appTheme == newTheme) return;

    appTheme = newTheme;
    notifyListeners();

    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(
      'isDarkMode',
      newTheme == ThemeMode.dark,
    );
  }

  bool isDarkMode() => appTheme == ThemeMode.dark;
}