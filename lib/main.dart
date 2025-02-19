// // import 'dart:developer';

// // import 'package:firebase_messaging/firebase_messaging.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// // import 'package:timezone/data/latest_all.dart' as tz;
// // import 'package:timezone/timezone.dart' as tz;
// // import 'package:permission_handler/permission_handler.dart';
// // import 'dart:io';

// // import 'package:firebase_core/firebase_core.dart';
// // import 'package:todo_with_bloc/view/pages/fnotify.dart';
// // import 'firebase_options.dart';

// // // ...

// // import 'package:firebase_messaging/firebase_messaging.dart';

// // Future<void> getFCMToken() async {
// //   String? token = await FirebaseMessaging.instance.getToken();
// //   print("FCM Token: $token");
// // }

// // void main() async {
// //   WidgetsFlutterBinding.ensureInitialized();

// //   await Firebase.initializeApp(
// //     options: DefaultFirebaseOptions.currentPlatform,
// //   );
// //   await requestNotificationPermission();
// //   tz.initializeTimeZones(); // Timezone'ni boshlash
// //   await _requestPermissions();
// //   await _requestPermissions2(); // Ruxsat olish
// //   runApp(const MyApp());
// // }

// // Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
// //   await Firebase.initializeApp();
// //   print("FONDA KELGAN XABAR: ${message.notification?.title}");
// // }

// // Future<void> requestNotificationPermission() async {
// //   FirebaseMessaging messaging = FirebaseMessaging.instance;
// //   NotificationSettings settings = await messaging.requestPermission(
// //     alert: true,
// //     badge: true,
// //     sound: true,
// //   );

// //   if (settings.authorizationStatus == AuthorizationStatus.authorized) {
// //     print('Notification permission granted');
// //   } else {
// //     print('Notification permission denied');
// //   }
// // }

// // Future<void> checkAndRequestExactAlarmPermission(BuildContext context) async {
// //   if (await Permission.scheduleExactAlarm.isDenied) {
// //     showDialog(
// //       context: context,
// //       builder: (context) => AlertDialog(
// //         title: const Text("Ruxsat talab qilinadi"),
// //         content: const Text(
// //             "Kechiktirilgan bildirishnomalarni yuborish uchun, iltimos, Exact Alarm ruxsatini yoqing."),
// //         actions: [
// //           TextButton(
// //             onPressed: () async {
// //               await openAppSettings(); // Sozlamalar sahifasini ochish
// //             },
// //             child: const Text("Sozlamalarga o‘tish"),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// // Future<void> _requestPermissions2() async {
// //   // Android 13 (API 33) dan boshlab bildirishnoma ruxsatini so‘rash
// //   if (await Permission.notification.isDenied) {
// //     await Permission.notification.request();
// //   }
// // }

// // Future<void> _requestPermissions() async {
// //   if (Platform.isAndroid) {
// //     FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
// //         FlutterLocalNotificationsPlugin();
// //     final AndroidFlutterLocalNotificationsPlugin? androidImplementation =
// //         flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<
// //             AndroidFlutterLocalNotificationsPlugin>();

// //     if (androidImplementation != null) {
// //       await androidImplementation.requestNotificationsPermission();
// //     }
// //   }
// // }

// // class MyApp extends StatelessWidget {
// //   const MyApp({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       debugShowCheckedModeBanner: false,
// //       home: NotificationScreen(),
// //     );
// //   }
// // }

// // class NotificationScreen extends StatefulWidget {
// //   @override
// //   _NotificationScreenState createState() => _NotificationScreenState();
// // }

// // class _NotificationScreenState extends State<NotificationScreen> {
// //   late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
// //   final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
// //   //final token= FirebaseMessaging.instance.getToken();

// //   final FlutterLocalNotificationsPlugin _localNotifications =
// //       FlutterLocalNotificationsPlugin();
// //   @override
// //   void initState() {
// //     super.initState();
// //     checkAndRequestExactAlarmPermission(context);
// //     _initNotifications();
// //     _initializeFirebaseMessaging();
// //     _initializeLocalNotifications();
// //     getFCMToken();
// //     setupFirebaseMessaging();
// //   }

// //   void setupFirebaseMessaging() {
// //     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
// //       print("FCM Message received: ${message.notification?.title}");

// //       // Agar xabar kelsa, local notification orqali ko‘rsatish
// //       showLocalNotification(message);
// //     });

// //     FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
// //       print("User tapped on notification: ${message.notification?.title}");
// //     });
// //   }

// //   void _initializeFirebaseMessaging() async {
// //     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
// //       print("Foreground Notification: ${message.notification?.title}");
// //       _showNotification(
// //           message.notification?.title, message.notification?.body);
// //     });

// //     FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
// //       print("Notification clicked!");
// //     });

// //     FirebaseMessaging.instance.getToken().then((token) {
// //       print("Firebase Token: $token");
// //     });
// //   }

// //   void _initializeLocalNotifications() {
// //     const AndroidInitializationSettings initializationSettingsAndroid =
// //         AndroidInitializationSettings('@mipmap/ic_launcher');

// //     final InitializationSettings initializationSettings =
// //         InitializationSettings(android: initializationSettingsAndroid);

// //     _localNotifications.initialize(initializationSettings);
// //   }

// //   Future<void> _initNotifications() async {
// //     flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

// //     const AndroidInitializationSettings initializationSettingsAndroid =
// //         AndroidInitializationSettings('@mipmap/ic_launcher');

// //     const InitializationSettings initializationSettings =
// //         InitializationSettings(
// //       android: initializationSettingsAndroid,
// //     );

// //     await flutterLocalNotificationsPlugin.initialize(initializationSettings);
// //   }

// //   void _showNotification(String? title, String? body) async {
// //     const AndroidNotificationDetails androidPlatformChannelSpecifics =
// //         AndroidNotificationDetails(
// //       'high_importance_channel',
// //       'High Importance Notifications',
// //       importance: Importance.max,
// //       priority: Priority.high,
// //     );

// //     const NotificationDetails platformChannelSpecifics =
// //         NotificationDetails(android: androidPlatformChannelSpecifics);

// //     await _localNotifications.show(
// //       0,
// //       title,
// //       body,
// //       platformChannelSpecifics,
// //     );
// //   }

// //   Future<void> showLocalNotification(RemoteMessage message) async {
// //     const AndroidNotificationDetails androidDetails =
// //         AndroidNotificationDetails(
// //             'high_importance_channel', 'High Importance Notifications',
// //             importance: Importance.max, priority: Priority.high);

// //     const NotificationDetails notificationDetails =
// //         NotificationDetails(android: androidDetails);

// //     await flutterLocalNotificationsPlugin.show(0, message.notification?.title,
// //         message.notification?.body, notificationDetails);
// //   }

// //   // /// **Oddiy bildirishnoma**
// //   // Future<void> _showNotification() async {
// //   //   const AndroidNotificationDetails androidPlatformChannelSpecifics =
// //   //       AndroidNotificationDetails(
// //   //     'your_channel_id',
// //   //     'your_channel_name',
// //   //     channelDescription: 'This is a test notification',
// //   //     importance: Importance.max,
// //   //     priority: Priority.high,
// //   //   );

// //   //   const NotificationDetails platformChannelSpecifics =
// //   //       NotificationDetails(android: androidPlatformChannelSpecifics);

// //   //   await flutterLocalNotificationsPlugin.show(
// //   //     0, // Notification ID
// //   //     'Salom!', // Title
// //   //     'Bu oddiy bildirishnoma!', // Body
// //   //     platformChannelSpecifics,
// //   //   );
// //   // }

// //   /// **Kechiktirilgan bildirishnoma (5 soniya keyin)**
// //   Future<void> _scheduleNotification() async {
// //     try {
// //       tz.TZDateTime scheduledDate =
// //           tz.TZDateTime.now(tz.local).add(const Duration(seconds: 5));

// //       await flutterLocalNotificationsPlugin.zonedSchedule(
// //         1,
// //         'Kechiktirilgan Notification',
// //         'Bu xabar 5 soniyadan keyin chiqadi!',
// //         scheduledDate,
// //         const NotificationDetails(
// //           android: AndroidNotificationDetails(
// //             'your_channel_id',
// //             'your_channel_name',
// //             channelDescription: 'This is a test notification',
// //             importance: Importance.max,
// //             priority: Priority.high,
// //           ),
// //         ),
// //         androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
// //         uiLocalNotificationDateInterpretation:
// //             UILocalNotificationDateInterpretation.absoluteTime,
// //       );
// //     } catch (e) {
// //       print("Xatolik yuz berdi: $e");
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(title: const Text('Flutter Local Notifications')),
// //       body: Center(
// //         child: Column(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: [
// //             ElevatedButton(
// //               onPressed: () => _showNotification("test", "local"),
// //               child: const Text('Oddiy Notification Yuborish'),
// //             ),
// //             const SizedBox(height: 10),
// //             ElevatedButton(
// //               onPressed: _scheduleNotification,
// //               child: const Text('5 soniyadan keyin Notification'),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }


// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(); // Firebase-ni boshlash
//   runApp(MyApp());
// }

// class MyApp extends StatefulWidget {
//   const MyApp({super.key});

//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
//   final FlutterLocalNotificationsPlugin _localNotificationsPlugin =
//       FlutterLocalNotificationsPlugin();

//   @override
//   void initState() {
//     super.initState();
//     _initializeFirebase();
//     _requestNotificationPermission();
//     _setupLocalNotifications();
//     _getFCMToken();
//   }

//   /// Firebase va FCM-ni sozlash
//   void _initializeFirebase() {
//     // FCM xabarlarini qabul qilish
//     FirebaseMessaging.onMessage.listen(_onMessageReceived);
//     FirebaseMessaging.onMessageOpenedApp.listen(_onMessageOpenedApp);
//   }

//   /// Android 13 va undan yuqori versiyalar uchun bildirishnoma ruxsati
//   Future<void> _requestNotificationPermission() async {
//     NotificationSettings settings = await _firebaseMessaging.requestPermission(
//       alert: true,
//       badge: true,
//       sound: true,
//     );
//     print('Notification permission status: ${settings.authorizationStatus}');
//   }

//   /// Local Notifications sozlash
//   void _setupLocalNotifications() {
//     const AndroidInitializationSettings androidSettings =
//         AndroidInitializationSettings('@mipmap/ic_launcher');

//     const InitializationSettings initializationSettings =
//         InitializationSettings(android: androidSettings);

//     _localNotificationsPlugin.initialize(initializationSettings);
//   }

//   /// FCM tokenni olish
//   Future<void> _getFCMToken() async {
//     String? token = await _firebaseMessaging.getToken();
//     print("FCM Token: $token");
//   }

//   /// FCM xabarini qabul qilish
//   void _onMessageReceived(RemoteMessage message) {
//     print("Xabar keldi: ${message.notification?.title}");
//     _showLocalNotification(message);
//   }

//   /// Bildirishnoma bosilganda
//   void _onMessageOpenedApp(RemoteMessage message) {
//     print("User tapped on notification: ${message.notification?.title}");
//   }

//   /// Local bildirishnoma ko‘rsatish
//   Future<void> _showLocalNotification(RemoteMessage message) async {
//     const AndroidNotificationDetails androidDetails =
//         AndroidNotificationDetails(
//       'high_importance_channel',
//       'High Importance Notifications',
//       importance: Importance.max,
//       priority: Priority.high,
//     );

//     const NotificationDetails notificationDetails =
//         NotificationDetails(android: androidDetails);

//     await _localNotificationsPlugin.show(
//       0,
//       message.notification?.title ?? 'Xabar',
//       message.notification?.body ?? 'Matn yo‘q',
//       notificationDetails,
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'FCM & Local Notifications',
//       home: Scaffold(
//         appBar: AppBar(title: Text('FCM Notifications')),
//         body: Center(
//           child: ElevatedButton(
//             onPressed: () async {
//               await _localNotificationsPlugin.show(
//                 0,
//                 'Test Notification',
//                 'This is a local notification',
//                 const NotificationDetails(
//                   android: AndroidNotificationDetails(
//                     'high_importance_channel',
//                     'High Importance Notifications',
//                     importance: Importance.max,
//                     priority: Priority.high,
//                   ),
//                 ),
//               );
//             },
//             child: Text('Show Local Notification'),
//           ),
//         ),
//       ),
//     );
//   }
// }




import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print("FONDA KELGAN XABAR: ${message.notification?.title}");
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _localNotifications =
      FlutterLocalNotificationsPlugin();
  String? fcmToken = "";

  @override
  void initState() {
    super.initState();
    setupLocalNotifications();
    requestNotificationPermission();
    getFCMToken();
    setupFirebaseMessaging();
  }

  /// 📱 FCM tokenni olish
  Future<void> getFCMToken() async {
    String? token = await _firebaseMessaging.getToken();
    setState(() {
      fcmToken = token;
    });
    print("FCM Token: $token");
  }

  /// ✅ Local notifications ni sozlash
  void setupLocalNotifications() {
    const AndroidInitializationSettings androidSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings initSettings =
        InitializationSettings(android: androidSettings);

    _localNotifications.initialize(initSettings);
  }

  /// 📲 FCM bildirishnomalarini sozlash
  void setupFirebaseMessaging() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print("Xabar keldi: ${message.notification?.title}");
      showLocalNotification(message);
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print("Xabar ochildi: ${message.notification?.title}");
    });
  }

  /// 📡 Local notification ko'rsatish
  Future<void> showLocalNotification(RemoteMessage message) async {
    const AndroidNotificationDetails androidDetails =
        AndroidNotificationDetails(
      'high_importance_channel',
      'High Importance Notifications',
      importance: Importance.max,
      priority: Priority.high,
    );

    const NotificationDetails notificationDetails =
        NotificationDetails(android: androidDetails);

    await _localNotifications.show(
      0,
      message.notification?.title,
      message.notification?.body,
      notificationDetails,
    );
  }

  /// 📡 Local notification ko'rsatish (test uchun)
  Future<void> showTestNotification() async {
    const AndroidNotificationDetails androidDetails =
        AndroidNotificationDetails(
      'test_channel',
      'Test Notifications',
      importance: Importance.max,
      priority: Priority.high,
    );

    const NotificationDetails notificationDetails =
        NotificationDetails(android: androidDetails);

    await _localNotifications.show(
      0,
      'Test Notification',
      'This is a test notification!',
      notificationDetails,
    );
  }

  /// 📡 Notification ruxsatini so'rash (Android 13 uchun kerak)
  Future<void> requestNotificationPermission() async {
    NotificationSettings settings =
        await _firebaseMessaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('Notification permission granted');
    } else {
      print('Notification permission denied');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Firebase Notifications')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Firebase & Local Notifications',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: showTestNotification,
              child: const Text('Show Local Notification'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: getFCMToken,
              child: const Text('Get FCM Token'),
            ),
            const SizedBox(height: 20),
            Text(
              'FCM Token:\n$fcmToken',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
