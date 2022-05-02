import 'package:kartal/kartal.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:snack_over_vbt/core/init/locale_storage_manager.dart';
import 'package:snack_over_vbt/product/component/firebase/auth_functions.dart';

import '../../../home/view/home_view.dart';
import '../../model/login_model.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.context) : super(LoginInitial());

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginModel? userModel;
  User? response;
  BuildContext context;

  Future signInWithEmailPassword() async {
    userModel = LoginModel(emailController.text,passwordController.text);
    User? response = await AuthFunctions().signInEmailPassword(userModel,context);
    if(response != null){
      keepTokenData(response.uid);
      if(response.uid.isNotEmpty){
        context.navigateToPage(HomeView());
      }else{
        //TODO: Giriş başarısız yönlendirmesi
      }
    }
  }

  Future signInWithGoogle() async{
    User? user = await AuthFunctions().signInGoogle(context);
    if(user != null){
      keepTokenData(user.uid);
      if(user.uid.isNotEmpty){
        context.navigateToPage(HomeView());
      }else{
        //TODO: Giriş başarısız yönlendirmesi
      }
    }
  }

  Future keepTokenData(String token) async{
    await LocaleStorageManager.instance.setStringValue(StorageKeys.token, token);
  }

}
