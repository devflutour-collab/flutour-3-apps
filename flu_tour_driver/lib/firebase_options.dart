import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBQQW7o6djL2SHOYAbbYLOOVSoc3dKi17U',
    appId: '1:1032687895242:android:aa805c8928853d8eabaa33',
    messagingSenderId: '1032687895242',
    projectId: 'flutour-dev',
    databaseURL: 'https://flutour-dev-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'flutour-dev.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBQQW7o6djL2SHOYAbbYLOOVSoc3dKi17U',
    appId: '1:1032687895242:android:aa805c8928853d8eabaa33',
    messagingSenderId: '1032687895242',
    projectId: 'flutour-dev',
    databaseURL: 'https://flutour-dev-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'flutour-dev.firebasestorage.app',
    iosBundleId: 'com.flutour.driver',
  );
}
