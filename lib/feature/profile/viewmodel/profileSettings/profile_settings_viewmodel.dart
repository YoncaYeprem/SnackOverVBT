import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snack_over_vbt/core/init/locale/locale_manager.dart';

class ProfileSettingsCubit extends Cubit<ProfileSettingsState> {
  ProfileSettingsCubit(this.myContext) : super(ProfileSettingsInitial());

  Locale? appLocale = LanguageManager.instance!.trLocale;
  BuildContext myContext;

  void changeLanguage(Locale? locale) {
    if (locale != null) {
      myContext.setLocale(locale);
      emit(ProfileChangeLanguage());
    }
  }
}

abstract class ProfileSettingsState {}

class ProfileSettingsInitial extends ProfileSettingsState {}

class ProfileChangeLanguage extends ProfileSettingsState {}
