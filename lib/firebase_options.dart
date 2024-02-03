// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
    apiKey: 'AIzaSyAv2Jle-WckCguWJ8Yf_o1T7CzVKfMwcjQ',
    appId: '1:275351030230:web:519eaed49ad963af1ebc77',
    messagingSenderId: '275351030230',
    projectId: 'todo-app-405db',
    authDomain: 'todo-app-405db.firebaseapp.com',
    storageBucket: 'todo-app-405db.appspot.com',
    measurementId: 'G-DKMX49S52H',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBTDEWhyg-xCibDsTseZjUwfAFXPy304f4',
    appId: '1:275351030230:android:8c27f6acf20b653d1ebc77',
    messagingSenderId: '275351030230',
    projectId: 'todo-app-405db',
    storageBucket: 'todo-app-405db.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCNQvVBXTTzZwX1tQjEFxlmBIauWt9I1ns',
    appId: '1:275351030230:ios:2db74239a288da571ebc77',
    messagingSenderId: '275351030230',
    projectId: 'todo-app-405db',
    storageBucket: 'todo-app-405db.appspot.com',
    iosBundleId: 'com.example.todoApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCNQvVBXTTzZwX1tQjEFxlmBIauWt9I1ns',
    appId: '1:275351030230:ios:835622c71c3e173e1ebc77',
    messagingSenderId: '275351030230',
    projectId: 'todo-app-405db',
    storageBucket: 'todo-app-405db.appspot.com',
    iosBundleId: 'com.example.todoApp.RunnerTests',
  );
}
