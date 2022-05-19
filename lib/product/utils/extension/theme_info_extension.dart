import '../enums/theme_info_enum.dart';

extension ThemeInfoExtension on ThemeInfo {
  String rawValue() {
    switch (this) {
      case ThemeInfo.LIGHT:
        return "Light";
      case ThemeInfo.DARK:
        return "Dark";
    }
  }
}
