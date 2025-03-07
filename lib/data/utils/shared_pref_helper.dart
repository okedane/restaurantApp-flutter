import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefHelper {
  final SharedPreferences _prefs;

  SharedPrefHelper(this._prefs);

  
  static const String _dailyReminderKey = "daily_reminder";

  
  Future<void> setDailyReminder(bool value) async {
    await _prefs.setBool(_dailyReminderKey, value);
  }

  
  bool getDailyReminder() {
    return _prefs.getBool(_dailyReminderKey) ?? false;
  }
}
