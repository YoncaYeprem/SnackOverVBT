import 'package:flutter/material.dart';
import '../../../../core/init/theme/app_theme.dart';
import '../../../../product/utils/enums/theme_info_enum.dart';

import '../../../../core/init/locale_storage_manager.dart';

class ThemeNotifier extends ChangeNotifier {

  LocaleStorageManager localeStorageManager = LocaleStorageManager.instance;
  // Theme

  bool get isLightTheme => currentTheme == ThemeInfo.LIGHT;
  ITheme get theme {
    switch (currentTheme) {
      case ThemeInfo.DARK:
        return DarkThemeLight();
      case  ThemeInfo.LIGHT:
      default:
        return AppThemeLight();
    }
  }

  ThemeInfo get currentTheme {
    
    return ThemeInfo.values[localeStorageManager.getIntegerValue(StorageKeys.theme)];
  }

  Future<void> changeAppTheme(ThemeInfo themes) async {
    final _themeIndex = localeStorageManager.getIntegerValue(StorageKeys.theme);

    switch (ThemeInfo.values[_themeIndex]) {
      case ThemeInfo.DARK:
        await localeStorageManager.setTheme(ThemeInfo.LIGHT);
        break;
      case ThemeInfo.LIGHT:
        await localeStorageManager.setTheme(ThemeInfo.DARK);
        break;
      default:
    }
    await localeStorageManager.reload();

    notifyListeners();
  }
}