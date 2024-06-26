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
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
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
    apiKey: 'AIzaSyCLWR4qQtuxdZ-LaUHUAmEQrc1kztRrM7w',
    appId: '1:780680143892:web:3965f830917a696340b301',
    messagingSenderId: '780680143892',
    projectId: 'flutter-chat-241df',
    authDomain: 'flutter-chat-241df.firebaseapp.com',
    storageBucket: 'flutter-chat-241df.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDvIswWt81Ionp9AwzcvkLl6QdT4wnA9ls',
    appId: '1:780680143892:android:859866b3d5f4ee6d40b301',
    messagingSenderId: '780680143892',
    projectId: 'flutter-chat-241df',
    storageBucket: 'flutter-chat-241df.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBhWwmAHhFFRErXvCCx1wW9kz3ymjfSUJM',
    appId: '1:780680143892:ios:65d5a4fc583ecea940b301',
    messagingSenderId: '780680143892',
    projectId: 'flutter-chat-241df',
    storageBucket: 'flutter-chat-241df.appspot.com',
    iosBundleId: 'com.example.flutterChat',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBhWwmAHhFFRErXvCCx1wW9kz3ymjfSUJM',
    appId: '1:780680143892:ios:65d5a4fc583ecea940b301',
    messagingSenderId: '780680143892',
    projectId: 'flutter-chat-241df',
    storageBucket: 'flutter-chat-241df.appspot.com',
    iosBundleId: 'com.example.flutterChat',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCLWR4qQtuxdZ-LaUHUAmEQrc1kztRrM7w',
    appId: '1:780680143892:web:0d736eacff07481940b301',
    messagingSenderId: '780680143892',
    projectId: 'flutter-chat-241df',
    authDomain: 'flutter-chat-241df.firebaseapp.com',
    storageBucket: 'flutter-chat-241df.appspot.com',
  );
}
