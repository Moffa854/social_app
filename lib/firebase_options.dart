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
    apiKey: 'AIzaSyAfW3QdV2Vj2nS2zjLm1wY9XSmgG13U_kk',
    appId: '1:497456724030:web:33be50ae4d2d26b2dab96f',
    messagingSenderId: '497456724030',
    projectId: 'social-app-5be87',
    authDomain: 'social-app-5be87.firebaseapp.com',
    storageBucket: 'social-app-5be87.appspot.com',
    measurementId: 'G-WW8M4F2338',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA4etJkL5dumUP1RbCnGdjmnPgsBSMpRjA',
    appId: '1:497456724030:android:61f600b952473460dab96f',
    messagingSenderId: '497456724030',
    projectId: 'social-app-5be87',
    storageBucket: 'social-app-5be87.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCd_rE918QPmuRqFznVgAngbhPT8BdS0zk',
    appId: '1:497456724030:ios:6b7a15ef8a5a3193dab96f',
    messagingSenderId: '497456724030',
    projectId: 'social-app-5be87',
    storageBucket: 'social-app-5be87.appspot.com',
    iosBundleId: 'com.example.socialApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCd_rE918QPmuRqFznVgAngbhPT8BdS0zk',
    appId: '1:497456724030:ios:6b7a15ef8a5a3193dab96f',
    messagingSenderId: '497456724030',
    projectId: 'social-app-5be87',
    storageBucket: 'social-app-5be87.appspot.com',
    iosBundleId: 'com.example.socialApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAfW3QdV2Vj2nS2zjLm1wY9XSmgG13U_kk',
    appId: '1:497456724030:web:d9a385d3a6edd8c9dab96f',
    messagingSenderId: '497456724030',
    projectId: 'social-app-5be87',
    authDomain: 'social-app-5be87.firebaseapp.com',
    storageBucket: 'social-app-5be87.appspot.com',
    measurementId: 'G-PQSPMJVFD0',
  );
}
