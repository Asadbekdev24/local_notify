// import 'dart:developer';

// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// class NotificationScreen2 extends StatefulWidget {
//   const NotificationScreen2({super.key});

//   @override
//   _NotificationScreen2State createState() => _NotificationScreen2State();
// }

// class _NotificationScreen2State extends State<NotificationScreen2> {
//   final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
//   final token= FirebaseMessaging.instance.getToken();

//   final FlutterLocalNotificationsPlugin _localNotifications =
//       FlutterLocalNotificationsPlugin();

//   @override
//   void initState() {
//     super.initState();
//     _initializeFirebaseMessaging();
//     _initializeLocalNotifications();
//     log(token.toString());
//   }

//   void _initializeFirebaseMessaging() async {
//     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//       print("Foreground Notification: ${message.notification?.title}");
//       _showNotification(message.notification?.title, message.notification?.body);
//     });

//     FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
//       print("Notification clicked!");
//     });

//     FirebaseMessaging.instance.getToken().then((token) {
//       print("Firebase Token: $token");
//     });
//   }

//   void _initializeLocalNotifications() {
//     const AndroidInitializationSettings initializationSettingsAndroid =
//         AndroidInitializationSettings('@mipmap/ic_launcher');

//     final InitializationSettings initializationSettings =
//         InitializationSettings(android: initializationSettingsAndroid);

//     _localNotifications.initialize(initializationSettings);
//   }

//   void _showNotification(String? title, String? body) async {
//     const AndroidNotificationDetails androidPlatformChannelSpecifics =
//         AndroidNotificationDetails(
//       'high_importance_channel',
//       'High Importance Notifications',
//       importance: Importance.max,
//       priority: Priority.high,
//     );

//     const NotificationDetails platformChannelSpecifics =
//         NotificationDetails(android: androidPlatformChannelSpecifics);

//     await _localNotifications.show(
//       0,
//       title,
//       body,
//       platformChannelSpecifics,
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Firebase Notifications')),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ElevatedButton(
//               onPressed: () => _showNotification("Test", "Local Notification"),
//               child: Text("Show Local Notification"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
