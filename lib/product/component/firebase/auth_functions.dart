import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../../feature/login/model/login_model.dart';

class AuthFunctions {
  FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  User? user;

  Future<User?> signInEmailPassword(LoginModel? userModel, BuildContext context) async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: userModel?.email ?? '', password: userModel?.password ?? '');
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        if (context != null) {
        _sendSnacMessage(context, 'User Not Found');

        }
      }
    }
    return user;
  }


  void _sendSnacMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }
}
