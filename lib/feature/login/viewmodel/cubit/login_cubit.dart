import 'package:kartal/kartal.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snack_over_vbt/core/init/localStorage/storage.dart';
import '../../../../core/init/locale_storage_manager.dart';
import '../../../home/nav_bar.dart';
import '../../model/user_model.dart';
import '../../../../product/component/firebase/auth_functions.dart';

import '../../../../core/constants/image_constants.dart';
import '../../../../product/component/firebase/storage_functions.dart';
import '../../../home/view/home_view.dart';
import '../../model/login_model.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.context) : super(LoginInitial());

  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginModel? userModel;
  User? response;
  BuildContext context;
  String? userId;
  UserModel? user;

  Future signUpWithEmailPassword() async {
    UserCredential credential = await AuthFunctions().signUpUserWithEmail(
        email: emailController.text, password: passwordController.text);
    if (credential != null) {
      userId = credential.user!.uid;
    }

    user = UserModel(
        userId: userId,
        name: nameController.text,
        surname: surnameController.text,
        email: emailController.text,
        password: passwordController.text,
        photoUrl: "");

    if (user != null) {
      await FirebaseStorageFunctions()
          .saveUserToFirestore(userModel: user!)
          .then((value) {
        context.navigateToPage(BottomNavBar());
        keepUserData(user!);
      }).catchError((onError) {
        print("hata");
      });
    }

    emit(SaveUser());
  }

  Future signInWithEmailPassword() async {
    userModel = LoginModel(emailController.text, passwordController.text);
    User? response =
        await AuthFunctions().signInEmailPassword(userModel, context);
    if (response != null) {
      keepTokenData(response.uid);
      if (response.uid.isNotEmpty) {
        context.navigateToPage(BottomNavBar());
      } else {
        //TODO: Giriş başarısız yönlendirmesi
      }
    }
  }

  Future signInWithGoogle() async {
    User? user = await AuthFunctions().signInGoogle(context);
    if (user != null) {
      keepTokenData(user.uid);

      if (user.uid.isNotEmpty) {
        context.navigateToPage(HomeView());
      } else {
        //TODO: Giriş başarısız yönlendirmesi
      }
    }
  }
}

extension _LoginCache on LoginCubit {
  Future keepUserData(UserModel user) async {
    await LocaleStorageManager.instance.setDynamicJson(StorageKeys.user, user);
    context.read<LocaleManager>().saveUser(user);
  }

  Future keepTokenData(String token) async {
    await LocaleStorageManager.instance
        .setStringValue(StorageKeys.token, token);
    context.read<LocaleManager>().saveToken(token);
  }
}
