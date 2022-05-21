import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/init/locale_storage_manager.dart';
import 'profile_settings_state.dart';
import '../../../../../core/init/locale/locale_manager.dart';
import '../../../../../core/init/router/router_page/router_navigation.gr.dart';
import '../../../../../product/component/firebase/auth_functions.dart';

class ProfileSettingsCubit extends Cubit<ProfileSettingsState> {
  ProfileSettingsCubit(this.myContext) : super(ProfileSettingsInitial());

  LocaleStorageManager localeStorageManager = LocaleStorageManager.instance;

  Locale? appLocale = LanguageManager.instance!.trLocale;
  BuildContext myContext;

  void changeLanguage(Locale? locale) {
    if (locale != null) {
      myContext.setLocale(locale);
      emit(ProfileChangeLanguage());
    }
  }

  Future<void> resetPassword() async {
    AuthFunctions().resetPassword();
    LocaleStorageManager.instance.removeKey(StorageKeys.token);
    await myContext.router.push(const SplashViewRoute());
  }

  Future<void> logout(BuildContext context) async {
    await AuthFunctions().logoutUser();
    await LocaleStorageManager.instance.removeKey(StorageKeys.token);
    context.router.replace(LoginViewRoute());
  }
}
