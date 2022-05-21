import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/init/locale_storage_manager.dart';
import 'profile_settings_state.dart';
import '../../../../../core/init/locale/locale_manager.dart';

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
}
