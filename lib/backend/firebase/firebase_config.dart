import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyDS5MRWphNIhCjC9xeHVhIiW2rY2Fd8dxU",
            authDomain: "cardapiointerativo-a81f0.firebaseapp.com",
            projectId: "cardapiointerativo-a81f0",
            storageBucket: "cardapiointerativo-a81f0.appspot.com",
            messagingSenderId: "407951136698",
            appId: "1:407951136698:web:6c4ebb0838c80d1e56ef83",
            measurementId: "G-HG5M7F53KS"));
  } else {
    await Firebase.initializeApp();
  }
}
