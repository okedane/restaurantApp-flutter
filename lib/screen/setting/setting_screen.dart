import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/provider/notification/local_notification_provider.dart';
import 'package:restaurant_app/provider/theme/theme_provider.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final notificationProvider = Provider.of<LocalNotificationProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pengaturan'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // 🔹 Switch untuk mengubah tema (Dark / Light)
          ListTile(
            title: const Text('Tema Aplikasi'),
            trailing: Switch(
              value: themeProvider.isDarkMode,
              onChanged: (value) {
                themeProvider.toggleTheme(value);
              },
            ),
          ),

          // 🔹 Switch untuk mengaktifkan / menonaktifkan Reminder Makan Siang
          ListTile(
            title: const Text("Pengingat Makan Siang"),
            subtitle: const Text("Notifikasi akan muncul setiap pukul 11:00 AM"),
            trailing: Switch(
              value: notificationProvider.isScheduled,
              onChanged: (value) {
                if (value) {
                  notificationProvider.scheduleDailyElevenAMNotification();
                } else {
                  notificationProvider.cancelNotification(1);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
