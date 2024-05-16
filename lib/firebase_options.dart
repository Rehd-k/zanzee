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
    apiKey: 'AIzaSyCi6Yqbpqri8VXr37DGOsGzw1nwmEPBCww',
    appId: '1:510269203018:web:c2030ae6c20cb23bcb3cb3',
    messagingSenderId: '510269203018',
    projectId: 'zanzee-5d894',
    authDomain: 'zanzee-5d894.firebaseapp.com',
    storageBucket: 'zanzee-5d894.appspot.com',
    measurementId: 'G-ZZC8FG429G',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDlIEGG8fsd-vclUNT6DFcBR5e7wnseF0Q',
    appId: '1:510269203018:android:279a5d14954babb0cb3cb3',
    messagingSenderId: '510269203018',
    projectId: 'zanzee-5d894',
    storageBucket: 'zanzee-5d894.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC1EE4wOEO2yxuPBdPSd1Yd1z79QXcxpj0',
    appId: '1:510269203018:ios:5c260cd7a497bdedcb3cb3',
    messagingSenderId: '510269203018',
    projectId: 'zanzee-5d894',
    storageBucket: 'zanzee-5d894.appspot.com',
    iosBundleId: 'com.example.zanzeeapp',
  );

}