import 'package:restaurant_app/data/model/theme/theme_setting.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeService {
  static const String _themeKey = "theme_mode";

  Future<void> saveSettingValue(ThemeSetting setting) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_themeKey, setting.isDarkMode);
  }

  Future<ThemeSetting> getSettingValue() async {
    final prefs = await SharedPreferences.getInstance();
    final isDarkMode = prefs.getBool(_themeKey) ?? false;
    return ThemeSetting(isDarkMode: isDarkMode);
  }
}
