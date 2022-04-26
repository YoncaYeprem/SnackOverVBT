import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snack_over_vbt/core/init/locale_storage_manager.dart';
import 'package:snack_over_vbt/core/init/providerState/provider_init.dart';

import 'core/constants/app_constants.dart';
import 'core/init/locale/locale_manager.dart';
import 'feature/login/view/login.dart';
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

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      locale: context.locale,
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      theme: ThemeData(
          // primarySwatch: Colors.blue,
          ),
      home: LoginView(),
    );
  }
}
