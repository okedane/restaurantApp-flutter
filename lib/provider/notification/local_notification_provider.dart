import 'package:flutter/material.dart';
import 'package:restaurant_app/data/service/notification/local_notification_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalNotificationProvider extends ChangeNotifier {
  final LocalNotificationService flutterNotificationService;
  int _notificationId = 1;
  bool _isScheduled = false;

  LocalNotificationProvider(this.flutterNotificationService) {
    _loadReminderStatus();
  }

  bool get isScheduled => _isScheduled;

  Future<void> _loadReminderStatus() async {
    final prefs = await SharedPreferences.getInstance();
    _isScheduled = prefs.getBool('daily_reminder') ?? false;
    if (_isScheduled) {
      checkPendingNotificationRequests();
    }
    notifyListeners();
  }

  Future<void> _saveReminderStatus(bool status) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('daily_reminder', status);
  }

  Future<void> requestPermissions() async {
    final permissionGranted =
        await flutterNotificationService.requestPermissions();
    if (permissionGranted == true) {
      notifyListeners();
    }
  }

  void scheduleDailyElevenAMNotification() {
    flutterNotificationService.scheduleDailyElevenAMNotification(
      id: _notificationId,
    );
    _isScheduled = true;
    _saveReminderStatus(true);
    notifyListeners();
  }

  Future<void> checkPendingNotificationRequests() async {
    final pendingNotifications =
        await flutterNotificationService.pendingNotificationRequests();
    _isScheduled = pendingNotifications.isNotEmpty;
    notifyListeners();
  }

  Future<void> cancelNotification() async {
    await flutterNotificationService.cancelNotification(_notificationId);
    _isScheduled = false;
    _saveReminderStatus(false);
    notifyListeners();
  }
}
