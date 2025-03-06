import 'package:flutter/material.dart';
import 'package:restaurant_app/data/service/theme/shared_preferences_service.dart';
import 'package:restaurant_app/style/theme/restaurant_theme.dart';

class ThemeProvider extends ChangeNotifier {
  final SharedPreferencesService _preferencesService;
  bool _isDarkMode = false;

  ThemeProvider(this._preferencesService) {
    _isDarkMode = _preferencesService.getTheme();
  }

  bool get isDarkMode => _isDarkMode;

  ThemeData get themeData =>
      _isDarkMode ? RestaurantTheme.drakMode : RestaurantTheme.lightTheme;

  void toggleTheme(bool isDark) {
    _isDarkMode = isDark;
    _preferencesService.saveTheme(isDark);
    notifyListeners();
  }
}
