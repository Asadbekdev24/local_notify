
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:permission_handler/permission_handler.dart';
import 'dart:io';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  tz.initializeTimeZones(); // Timezone'ni boshlash
  await _requestPermissions();
  await _requestPermissions2(); // Ruxsat olish
  runApp(const MyApp());
}

Future<void> checkAndRequestExactAlarmPermission(BuildContext context) async {
  if (await Permission.scheduleExactAlarm.isDenied) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Ruxsat talab qilinadi"),
        content: const Text(
            "Kechiktirilgan bildirishnomalarni yuborish uchun, iltimos, Exact Alarm ruxsatini yoqing."),
        actions: [
          TextButton(
            onPressed: () async {
              await openAppSettings(); // Sozlamalar sahifasini ochish
            },
            child: const Text("Sozlamalarga o‘tish"),
          ),
        ],
      ),
    );
  }
}

Future<void> _requestPermissions2() async {
  // Android 13 (API 33) dan boshlab bildirishnoma ruxsatini so‘rash
  if (await Permission.notification.isDenied) {
    await Permission.notification.request();
  }
}

Future<void> _requestPermissions() async {
  if (Platform.isAndroid) {
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();
    final AndroidFlutterLocalNotificationsPlugin? androidImplementation =
        flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>();

    if (androidImplementation != null) {
      await androidImplementation.requestNotificationsPermission();
    }
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NotificationScreen(),
    );
  }
}

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  @override
  void initState() {
    super.initState();
    checkAndRequestExactAlarmPermission(context);
    _initNotifications();
  }

  Future<void> _initNotifications() async {
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
    );

    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  /// **Oddiy bildirishnoma**
  Future<void> _showNotification() async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'your_channel_id',
      'your_channel_name',
      channelDescription: 'This is a test notification',
      importance: Importance.max,
      priority: Priority.high,
    );

    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.show(
      0, // Notification ID
      'Salom!', // Title
      'Bu oddiy bildirishnoma!', // Body
      platformChannelSpecifics,
    );
  }

  /// **Kechiktirilgan bildirishnoma (5 soniya keyin)**
  Future<void> _scheduleNotification() async {
    try {
      tz.TZDateTime scheduledDate =
          tz.TZDateTime.now(tz.local).add(const Duration(seconds: 5));

      await flutterLocalNotificationsPlugin.zonedSchedule(
        1,
        'Kechiktirilgan Notification',
        'Bu xabar 5 soniyadan keyin chiqadi!',
        scheduledDate,
        const NotificationDetails(
          android: AndroidNotificationDetails(
            'your_channel_id',
            'your_channel_name',
            channelDescription: 'This is a test notification',
            importance: Importance.max,
            priority: Priority.high,
          ),
        ),
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
      );
    } catch (e) {
      print("Xatolik yuz berdi: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Local Notifications')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _showNotification,
              child: const Text('Oddiy Notification Yuborish'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _scheduleNotification,
              child: const Text('5 soniyadan keyin Notification'),
            ),
          ],
        ),
      ),
    );
  }
}
