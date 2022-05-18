import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:snack_over_vbt/feature/profile/view/profile_view.dart';
import 'package:snack_over_vbt/feature/profile/viewmodel/profileSettings/profile_settings_viewmodel.dart';
import '../../../../../../core/init/lang/locale_keys.g.dart';
import '../../../../../../core/init/locale/locale_manager.dart';

class ProfileSettingsView extends StatelessWidget {
  ProfileSettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
              color: Colors.red,
            )),
      ),
      body: Column(
        children: [
          Card(
            child: ListTile(
              title: Text(LocaleKeys.profileSettings_languageChangeTitle.tr()),
              trailing: BlocProvider(
                  create: (context) => ProfileSettingsCubit(context),
                  child:
                      BlocConsumer<ProfileSettingsCubit, ProfileSettingsState>(
                    listener: (context, state) {
                      // TODO: implement listener
                    },
                    builder: (context, state) {
                      return DropdownButton<Locale>(
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
                          context
                              .read<ProfileSettingsCubit>()
                              .changeLanguage(value);
                        },
                        value: context.locale,
                      );
                    },
                  )),
              subtitle: Text(
                  LocaleKeys.profileSettings_languageChangeSubtitle.tr(),
                  style: context.textTheme.headline6?.copyWith(
                      fontWeight: FontWeight.w100, color: Colors.black54)),
            ),
          ),
        ],
      ),
    );
  }
}
/**
 * 
 * Card(
            child: ListTile(
              title: Text(LocaleKeys.profileSettings_languageChangeTitle.tr()),
              trailing: Observer(builder: (_) {
                return DropdownButton<Locale>(
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
                    viewModel.changeAppLocalization(value, context);
                  },
                  value: viewModel.appLocale,
                );
              }),
              subtitle: Text(
                  LocaleKeys.profileSettings_languageChangeSubtitle.tr(),
                  style: context.textTheme.headline6?.copyWith(
                      fontWeight: FontWeight.w100, color: Colors.black54)),
            ),
          ),
 */