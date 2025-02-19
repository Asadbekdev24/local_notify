// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBcbaNku6naAqkQ1pqj5PUT0dbA-YvTk6s',
    appId: '1:457909076308:web:b3bc9e2956528cc0e748c1',
    messagingSenderId: '457909076308',
    projectId: 'fir-notifi-54676',
    authDomain: 'fir-notifi-54676.firebaseapp.com',
    storageBucket: 'fir-notifi-54676.firebasestorage.app',
    measurementId: 'G-E5VKP1DQYR',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCdWfiuhZ_FH6pqQOsTPQ9B7jCMsE5AiHg',
    appId: '1:457909076308:android:7c3ac65d40d8b5dfe748c1',
    messagingSenderId: '457909076308',
    projectId: 'fir-notifi-54676',
    storageBucket: 'fir-notifi-54676.firebasestorage.app',
  );
}
