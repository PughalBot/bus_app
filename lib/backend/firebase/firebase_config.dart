import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBueE183jRZUenZL_XINU2TKqgWo7-ij68",
            authDomain: "mobappsairambus.firebaseapp.com",
            projectId: "mobappsairambus",
            storageBucket: "mobappsairambus.appspot.com",
            messagingSenderId: "148964649748",
            appId: "1:148964649748:web:77e4507ccace9bb805f001",
            measurementId: "G-LHZ57HVF2S"));
  } else {
    await Firebase.initializeApp();
  }
}
