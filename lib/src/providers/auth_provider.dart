import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:movilies/firebase_options.dart';
import 'package:movilies/src/components/loading_indicator.dart';

class AuthProvider extends ChangeNotifier {
  void signup(context, email, password) async {
    final loadingContext = loading(context);

    await Firebase.initializeApp(options: DefaultFirebaseOptions.android);

    final res = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);

    Navigator.pop(loadingContext);

    if (res.user == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Failed!")));
    }

    Navigator.pushNamedAndRemoveUntil(context, "/home", (route) => false);
  }

  void signin(context, email, password) async {
    final loadingContext = loading(context);

    await Firebase.initializeApp(options: DefaultFirebaseOptions.android);

    final res = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);

    Navigator.pop(loadingContext);

    if (res.user == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Faile")));
    }

    Navigator.pushNamedAndRemoveUntil(context, "/home", (route) => false);
  }
}
