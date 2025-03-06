import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  final SharedPreferences _preferences;

  SharedPreferencesService(this._preferences);

  static const String themeKey = 'isDarkMode';

  Future<void> saveTheme(bool isDarkMode) async {
    await _preferences.setBool(themeKey, isDarkMode);
  }

  bool getTheme() {
    return _preferences.getBool(themeKey) ?? false;
  }
}
