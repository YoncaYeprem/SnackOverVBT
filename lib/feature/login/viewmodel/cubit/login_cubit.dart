import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/image_constants.dart';
import '../../../../core/init/localStorage/storage.dart';
import '../../../../core/init/locale_storage_manager.dart';
import '../../../../product/component/firebase/auth_functions.dart';
import '../../../../product/component/firebase/storage_functions.dart';
import '../../../home/nav_bar.dart';
import '../../../home/view/home_view.dart';
import '../../model/login_model.dart';
import '../../model/user_model.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.context) : super(LoginInitial());

  final TextEditingController emailLoginController = TextEditingController();
  final TextEditingController passwordLoginController = TextEditingController();

  final FocusNode emailLoginNode = FocusNode();
  final FocusNode passwordLoginNode = FocusNode();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();
  final TextEditingController emailRegisterController = TextEditingController();
  final TextEditingController passwordRegisterController = TextEditingController();

  LoginModel? userModel;
  User? response;
  BuildContext context;
  String? userId;
  UserModel? user;
  bool isloading = false;

  void changeLoading() {
    isloading = !isloading;
    emit(LoginLoading());
  }

  Future signUpWithEmailPassword() async {
    UserCredential credential = await AuthFunctions()
        .signUpUserWithEmail(email: emailRegisterController.text, password: passwordRegisterController.text);
    if (credential != null) {
      userId = credential.user!.uid;
    }

    user = UserModel(
        userId: userId,
        name: nameController.text,
        surname: surnameController.text,
        email: emailRegisterController.text,
        password: passwordRegisterController.text,
        photoUrl: ImageConstants.instance.person);

    if (user != null) {
      await FirebaseStorageFunctions().saveUserToFirestore(userModel: user!).then((value) {
        context.navigateToPage(const BottomNavBar());
      }).catchError((onError) {});
    }

    emit(SaveUser());
  }

  Future signInWithEmailPassword() async {
    changeLoading();
    userModel = LoginModel(emailLoginController.text, passwordLoginController.text);
    User? response = await AuthFunctions().signInEmailPassword(userModel, context);
    if (response != null) {
      keepTokenData(response.uid);
      changeLoading();
      if (response.uid.isNotEmpty) {
        context.navigateToPage(const BottomNavBar());
      } else {}
    } else {
      changeLoading();
      emit(LoginError());
    }
  }

  Future signInWithGoogle() async {
    User? user = await AuthFunctions().signInGoogle(context);
    if (user != null) {
      keepTokenData(user.uid);
      if (user.uid.isNotEmpty) {
        context.navigateToPage(const HomeView());
      } else {
        //TODO: Giriş başarısız yönlendirmesi
      }
    }
  }

  Future keepTokenData(String token) async {
    await LocaleStorageManager.instance.setStringValue(StorageKeys.token, token);
    context.read<LocaleManager>().saveToken(token);
  }
}
