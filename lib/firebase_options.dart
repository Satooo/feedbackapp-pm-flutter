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
      apiKey: "AIzaSyDNnQoqR-7Re0ELSuvSbr6-Ood1LrPbIIc",
      authDomain: "feedbackapp-96832.firebaseapp.com",
      projectId: "feedbackapp-96832",
      storageBucket: "feedbackapp-96832.appspot.com",
      messagingSenderId: "733388694064",
      appId: "1:733388694064:web:8b2f92818cbb5c200003f5",
      measurementId: "G-R6LRSP48ZY");

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCcJxrc5ASUb3vvl9-DIRIifMogo1G39Bw',
    appId: '1:733388694064:android:1b42268c22ea4e240003f5',
    messagingSenderId: '733388694064',
    projectId: 'feedbackapp-96832',
    databaseURL: 'https://feedbackapp-96832-default-rtdb.firebaseio.com/',
    storageBucket: 'gs://feedbackapp-96832.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCcJxrc5ASUb3vvl9-DIRIifMogo1G39Bw',
    appId: '1:733388694064:android:1b42268c22ea4e240003f5',
    messagingSenderId: '956646036975',
    projectId: 'feedbackapp-96832',
    databaseURL: 'https://feedbackapp-96832-default-rtdb.firebaseio.com/',
    storageBucket: 'gs://feedbackapp-96832.appspot.com',
    iosClientId:
        '956646036975-bclgg3apaqa01spn1r9eqbqouod1mn3h.apps.googleusercontent.com',
    iosBundleId: 'com.example.feedbackapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA-SiTG4MLpxrEeANCZeHj-Tw-78PhvYvE',
    appId: '1:956646036975:ios:b9b802863ea3a2131c921a',
    messagingSenderId: '956646036975',
    projectId: 'alertaperuapp-403c9',
    databaseURL: 'https://alertaperuapp-403c9-default-rtdb.firebaseio.com',
    storageBucket: 'alertaperuapp-403c9.appspot.com',
    iosClientId:
        '956646036975-7gm2205k621iiqet1uk7o717vulhr262.apps.googleusercontent.com',
    iosBundleId: 'com.example.feedbackapp.RunnerTests',
  );
}
