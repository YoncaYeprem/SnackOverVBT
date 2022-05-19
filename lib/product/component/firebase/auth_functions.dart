import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../feature/login/model/login_model.dart';

class AuthFunctions {
  FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  User? user;

  Future signUpUserWithEmail({required String email,required String password}) async{
    try {
      UserCredential credential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password);
    return credential;
    } on FirebaseAuthException catch (e) {
      //TODO: make some error 
      print(e.code);
    }
  }

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

  Future<User?> signInGoogle(BuildContext context) async {
    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();

    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      try {
        final UserCredential userCredential =
            await auth.signInWithCredential(credential);

        user = userCredential.user;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'account-exists-with-different-credential') {
          // handle the error here
        }
        else if (e.code == 'invalid-credential') {
          // handle the error here
        }
      } catch (e) {
        // handle the error here
      }
    }

    return user;
  }

  void _sendSnacMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }
}
