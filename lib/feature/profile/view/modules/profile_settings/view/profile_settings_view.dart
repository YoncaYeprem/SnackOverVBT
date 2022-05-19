import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:snack_over_vbt/product/utils/enums/theme_info_enum.dart';
import 'package:snack_over_vbt/product/utils/extension/theme_info_extension.dart';
import '../../../profile_view.dart';
import '../../../../viewmodel/profileSettings/cubit/profile_settings_cubit.dart';
import '../../../../../../core/init/lang/locale_keys.g.dart';
import '../../../../../../core/init/locale/locale_manager.dart';

class ProfileSettingsView extends StatelessWidget {
  ProfileSettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.colorScheme.onBackground,
        title: Text(
          LocaleKeys.profileSettings_settings.tr(),
          style: context.textTheme.headline4,
        ),
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: context.colorScheme.background,
            )),
      ),
      body: Column(
        children: [
          Card(
            child: ListTile(
              title: Text(LocaleKeys.profileSettings_languageChangeTitle.tr()),
              trailing: DropdownButton<Locale>(
                items: [
                  DropdownMenuItem(
                      child: Text(LanguageManager
                          .instance!.trLocale.countryCode!
                          .toUpperCase()),
                      value: LanguageManager.instance!.trLocale),
                  DropdownMenuItem(
                      child: Text(LanguageManager
                          .instance!.enLocale.countryCode!
                          .toUpperCase()),
                      value: LanguageManager.instance!.enLocale),
                ],
                onChanged: (value) {
                  context.read<ProfileSettingsCubit>().changeLanguage(value);
                },
                value: context.locale,
              ),
              subtitle: Text(
                  LocaleKeys.profileSettings_languageChangeSubtitle.tr(),
                  style: context.textTheme.headline6?.copyWith(
                      fontWeight: FontWeight.w100, color: Colors.black54)),
            ),
          ),
          Card(
            child: ListTile(
              title: Text(LocaleKeys.profileSettings_themeChangeTitle.tr()),
              trailing: DropdownButton<String>(
                items: [
                  DropdownMenuItem(
                      child: Text(LocaleKeys.profileSettings_themeDark.tr()),
                      value: ThemeInfo.DARK.rawValue()),
                  DropdownMenuItem(
                    child: Text(LocaleKeys.profileSettings_themeLight.tr()),
                    value: ThemeInfo.LIGHT.rawValue(),
                  ),
                ],
                onChanged: (value) {
                  context.read<ProfileSettingsCubit>().changeTheme(value);
                },
                value: context.read<ProfileSettingsCubit>().isLightTheme == true
                    ? ThemeInfo.LIGHT.rawValue()
                    : ThemeInfo.DARK.rawValue(),
              ),
              subtitle: Text(
                  LocaleKeys.profileSettings_themeChangeSubtitle.tr(),
                  style: context.textTheme.headline6?.copyWith(
                      fontWeight: FontWeight.w100, color: Colors.black54)),
            ),
          ),
        ],
      ),
    );
  }
}
