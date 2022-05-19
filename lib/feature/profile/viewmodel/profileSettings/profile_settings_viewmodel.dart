import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/init/locale/locale_manager.dart';

import '../../../login/model/user_model.dart';

class ProfileSettingsCubit extends Cubit<ProfileSettingsState> {
  ProfileSettingsCubit(this.myContext) : super(ProfileSettingsInitial()) {
  }

  Locale? appLocale = LanguageManager.instance!.trLocale;
  BuildContext myContext;
  UserModel? userModel;

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
