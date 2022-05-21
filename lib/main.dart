import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'feature/profile/viewmodel/profileSettings/cubit/profile_settings_cubit.dart';
import 'feature/profile/viewmodel/profileSettings/profile_setting_viewmodel.dart';
import 'core/constants/app_constants.dart';
import 'core/init/locale/locale_manager.dart';
import 'core/init/locale_storage_manager.dart';
import 'core/init/providerState/provider_init.dart';
import 'core/init/router/router_page/router_navigation.gr.dart';
import 'core/init/theme/app_theme.dart';
import 'feature/profile/viewmodel/profileSettings/cubit/profile_settings_state.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await LocaleStorageManager.prefrencesInit();
  await EasyLocalization.ensureInitialized();

  runApp(
    MultiProvider(
      providers: ApplicationProvider().items,
      child: EasyLocalization(
        child: const MyApp(),
        supportedLocales: LanguageManager.instance!.supportedLocales,
        path: ApplicationConstants.LANGUAGE_ASSETS_PATH,
        startLocale: LanguageManager.instance!.trLocale,
      ),
    ),
  );
}

final _rootRouter = FlutterRouter();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      // builder: (context, router) => router!,
      routerDelegate: _rootRouter.delegate(),
      routeInformationParser: _rootRouter.defaultRouteParser(),
      debugShowCheckedModeBanner: false,
      theme: ThemeManager.createTheme(Provider.of<ThemeNotifier>(context).theme),
      locale: context.locale,
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
    );
  }
}
/**context.read<ProfileSettingsCubit>().isLightTheme == true
                  ? ThemeManager.createTheme(AppThemeLight())
                  : ThemeManager.createTheme(DarkThemeLight()), */

                 // 