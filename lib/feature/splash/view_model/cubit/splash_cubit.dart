import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/init/localStorage/storage.dart';
import '../../../../core/init/router/router_page/router_navigation.gr.dart';
import '../../../../core/init/locale_storage_manager.dart';
import '../../../../firebase_options.dart';

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
      _initCache();
      await checkUserForRouting();
    });
  }

  Future<void> _initCache() async {
    await LocaleStorageManager.prefrencesInit();
  }

  checkUserForRouting() async {
    if (!storage.contains(StorageKeys.token) && storage.contains(StorageKeys.firstLoginApp)) {
      await context.router.push(const OnboardViewRoute());
    } else if (!storage.contains(StorageKeys.token) && !storage.contains(StorageKeys.firstLoginApp)) {
      await context.router.push(LoginViewRoute());
    } else {
      context.read<LocaleManager>().saveToken(LocaleStorageManager.instance.getStringValue(StorageKeys.token));

      await context.router.push(const BottomNavBarRoute());
    }
  }
}
