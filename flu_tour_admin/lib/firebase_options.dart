// PLACEHOLDER — replace with real values after Firebase Console setup.
//
// HOW TO GENERATE:
//   1. Install FlutterFire CLI:  dart pub global activate flutterfire_cli
//   2. Run from this app folder: flutterfire configure --project=YOUR_FIREBASE_PROJECT_ID
//   3. This file will be overwritten with the real keys from your Firebase project.
//
// Until then, the app will crash on startup — that is expected.

import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  // Stub for Android — admin app is web-first. Real values needed from Firebase Console.
  // Demo mode works without real Firebase.
  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA0ZUWCJuocRUiMN-JVJ2Y65kiqVJpBpLU',
    appId: '1:343412601794:android:000000000000000000000000',
    messagingSenderId: '343412601794',
    projectId: 'flutour-admin',
    storageBucket: 'flutour-admin.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'REPLACE_WITH_IOS_API_KEY',
    appId: 'REPLACE_WITH_IOS_APP_ID',
    messagingSenderId: 'REPLACE_WITH_SENDER_ID',
    projectId: 'REPLACE_WITH_PROJECT_ID',
    storageBucket: 'REPLACE_WITH_PROJECT_ID.appspot.com',
    iosBundleId: 'com.flutour.admin',
  );

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBj3OCRQZ8-iBGze3g9_p7ugG33ku7QH8k',
    appId: '1:1032687895242:web:6e458d6d15b8b41dabaa33',
    messagingSenderId: '1032687895242',
    projectId: 'flutour-dev',
    authDomain: 'flutour-dev.firebaseapp.com',
    databaseURL: 'https://flutour-dev-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'flutour-dev.firebasestorage.app',
  );
}
