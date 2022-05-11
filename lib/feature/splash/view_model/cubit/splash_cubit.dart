import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import '../../../../core/init/router/router_page/router_navigation.gr.dart';
import '../../../../core/init/locale_storage_manager.dart';
import '../../../../firebase_options.dart';
import '../../../home/view/home_view.dart';
import '../../../login/view/login.dart';
import '../../../onboard/view/onboard_view.dart';
import 'package:auto_route/auto_route.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit(this.context) : super(SplashInitial()) {
    init();
  }

  BuildContext context;
  late Timer timer;
  final storage = LocaleStorageManager.instance;

  Future<void> init() async {
    timer = Timer(const Duration(seconds: 2), () async {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      await checkUserForRouting();
    });
  }

  checkUserForRouting() async {
    if (!storage.contains(StorageKeys.token) && storage.contains(StorageKeys.firstLoginApp)) {
      await context.router.push(OnboardViewRoute());
    } else if (!storage.contains(StorageKeys.token) && !storage.contains(StorageKeys.firstLoginApp)) {
      await context.router.push(LoginViewRoute());
    } else {
      await context.router.push(BottomNavBarRoute());
    }
  }
}
