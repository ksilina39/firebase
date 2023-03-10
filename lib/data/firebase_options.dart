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
    apiKey: 'AIzaSyDuqh78zJis8kMmUPvn2oLWzR17fWqOpdM',
    appId: '1:898064354743:web:42f888e6f7e9cf6722ac32',
    messagingSenderId: '898064354743',
    projectId: 'fir-28e1e',
    authDomain: 'fir-28e1e.firebaseapp.com',
    storageBucket: 'fir-28e1e.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCh_s9ZKzMJAeq8GYYMbDUg8R813QmUNzc',
    appId: '1:898064354743:android:0596fcdd70a747b822ac32',
    messagingSenderId: '898064354743',
    projectId: 'fir-28e1e',
    storageBucket: 'fir-28e1e.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCG_i8RD3agomWNv93aD-PvcHBXpwgor4g',
    appId: '1:898064354743:ios:48c6dbe456b97d7922ac32',
    messagingSenderId: '898064354743',
    projectId: 'fir-28e1e',
    storageBucket: 'fir-28e1e.appspot.com',
    iosClientId: '898064354743-8r89vk1qdd5c4foio3v0nmciqu2aa6b7.apps.googleusercontent.com',
    iosBundleId: 'com.example.firebase',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCG_i8RD3agomWNv93aD-PvcHBXpwgor4g',
    appId: '1:898064354743:ios:48c6dbe456b97d7922ac32',
    messagingSenderId: '898064354743',
    projectId: 'fir-28e1e',
    storageBucket: 'fir-28e1e.appspot.com',
    iosClientId: '898064354743-8r89vk1qdd5c4foio3v0nmciqu2aa6b7.apps.googleusercontent.com',
    iosBundleId: 'com.example.firebase',
  );
}
