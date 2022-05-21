import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snack_over_vbt/core/init/locale_storage_manager.dart';
import 'package:snack_over_vbt/core/init/router/router_page/router_navigation.gr.dart';
import 'package:snack_over_vbt/feature/profile/viewmodel/profileSettings/cubit/profile_settings_state.dart';
import 'package:snack_over_vbt/feature/splash/view/splash_view.dart';
import 'package:snack_over_vbt/product/utils/extension/theme_info_extension.dart';
import '../../../../../core/init/locale/locale_manager.dart';
import '../../../../../product/component/firebase/auth_functions.dart';
import '../../../../../product/utils/enums/theme_info_enum.dart';
import '../../../../login/model/user_model.dart';

class ProfileSettingsCubit extends Cubit<ProfileSettingsState> {
  ProfileSettingsCubit(this.myContext) : super(ProfileSettingsInitial()) {
    init();
  }

  LocaleStorageManager localeStorageManager = LocaleStorageManager.instance;
  Locale? appLocale = LanguageManager.instance!.trLocale;
  BuildContext myContext;
  UserModel? userModel;
  bool? isLightTheme = true;

  void changeLanguage(Locale? locale) {
    if (locale != null) {
      myContext.setLocale(locale);
      emit(ProfileChangeLanguage());
    }
  }

  Future<void> changeTheme(String? value) async {
    if (value == ThemeInfo.LIGHT.rawValue()) {
      await localeStorageManager.setBooleanValue(StorageKeys.themeLight, true);
    } else {
      await localeStorageManager.setBooleanValue(StorageKeys.themeLight, false);
    }
    init();
  }

  Future<void> resetPassword() async {
    AuthFunctions().resetPassword();
    LocaleStorageManager.instance.removeKey(StorageKeys.token);
    await myContext.router.push(const SplashViewRoute());
  }

  Future<void> logout(BuildContext contextim) async {
    AuthFunctions().logoutUser();
    LocaleStorageManager.instance.removeKey(StorageKeys.token);
    await contextim.navigateToPage(SplashView());
  }

  void init() {
    isLightTheme = localeStorageManager.getBoolValue(StorageKeys.themeLight);
    emit(ThemeState());
  }
}
