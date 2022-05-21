import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:snack_over_vbt/product/utils/enums/theme_info_enum.dart';
import 'package:snack_over_vbt/product/utils/extension/theme_info_extension.dart';
import '../../../../viewmodel/profileSettings/cubit/profile_settings_cubit.dart';
import '../../../../../../core/init/lang/locale_keys.g.dart';
import '../../../../../../core/init/locale/locale_manager.dart';

class ProfileSettingsView extends StatelessWidget {
  const ProfileSettingsView({Key? key}) : super(key: key);

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
          _languageChangeCard(context),
          _themeChangeCard(context),
          _resetPassCard(context),
          _logoutCard(context),
        ],
      ),
    );
  }

  Card _languageChangeCard(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(LocaleKeys.profileSettings_languageChangeTitle.tr()),
        trailing: DropdownButton<Locale>(
          items: [
            DropdownMenuItem(
                child: Text(LanguageManager.instance!.trLocale.countryCode!.toUpperCase()),
                value: LanguageManager.instance!.trLocale),
            DropdownMenuItem(
                child: Text(LanguageManager.instance!.enLocale.countryCode!.toUpperCase()),
                value: LanguageManager.instance!.enLocale),
          ],
          onChanged: (value) {
            context.read<ProfileSettingsCubit>().changeLanguage(value);
          },
          value: context.locale,
        ),
        subtitle: Text(LocaleKeys.profileSettings_languageChangeSubtitle.tr(),
            style: context.textTheme.headline6?.copyWith(fontWeight: FontWeight.w100, color: Colors.black54)),
      ),
    );
  }

  Card _themeChangeCard(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(LocaleKeys.profileSettings_themeChangeTitle.tr()),
        trailing: DropdownButton<String>(
          items: [
            DropdownMenuItem(child: Text(LocaleKeys.profileSettings_themeDark.tr()), value: ThemeInfo.DARK.rawValue()),
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
        subtitle: Text(LocaleKeys.profileSettings_themeChangeSubtitle.tr(),
            style: context.textTheme.headline6?.copyWith(fontWeight: FontWeight.w100, color: Colors.black54)),
      ),
    );
  }

  Card _resetPassCard(BuildContext context) {
    return Card(
        child: ListTile(
      onTap: () {},
      title: Text(LocaleKeys.profileSettings_forgetPassword.tr()),
      subtitle: Text(LocaleKeys.profileSettings_forgetPasswordExplain.tr(),
          style: context.textTheme.headline6?.copyWith(fontWeight: FontWeight.w100, color: Colors.black54)),
      trailing: const Icon(
        Icons.change_circle,
        size: 35,
      ),
    ));
  }

  Card _logoutCard(BuildContext context) {
    return Card(
        child: ListTile(
      onTap: () {
        context.read<ProfileSettingsCubit>().logout(context);
      },
      title: Text(
        LocaleKeys.profileSettings_logout.tr(),
      ),
      trailing: Icon(
        Icons.logout_rounded,
        color: context.appTheme.errorColor,
        size: 35,
      ),
    ));
  }
}
