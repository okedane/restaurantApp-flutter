import 'package:flutter/material.dart';
import 'package:restaurant_app/data/service/notification/local_notification_service.dart';

class LocalNotificationProvider extends ChangeNotifier {
  final LocalNotificationService flutterNotificationService;

  LocalNotificationProvider(this.flutterNotificationService);

  int _notificationId = 0;
  bool _isScheduled = false;

  bool get isScheduled => _isScheduled;

  Future<void> requestPermissions() async {
    final permissionGranted =
        await flutterNotificationService.requestPermissions();
    if (permissionGranted == true) {
      notifyListeners();
    }
  }

  void scheduleDailyElevenAMNotification() {
    _notificationId += 1;
    flutterNotificationService.scheduleDailyElevenAMNotification(
      id: _notificationId,
    );
    _isScheduled = true;
    notifyListeners();
  }

  Future<void> checkPendingNotificationRequests() async {
    final pendingNotifications =
        await flutterNotificationService.pendingNotificationRequests();
    _isScheduled = pendingNotifications.isNotEmpty;
    notifyListeners();
  }

  Future<void> cancelNotification(int id) async {
    await flutterNotificationService.cancelNotification(id);
    _isScheduled = false;
    notifyListeners();
  }
}
