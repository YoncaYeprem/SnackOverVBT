import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../../../feature/profile/viewmodel/profileSettings/profile_setting_viewmodel.dart';
import '../localStorage/storage.dart';

class ApplicationProvider {
  final List<SingleChildWidget> items = [
    Provider.value(
      value: LocaleManager(),
    ),
    ChangeNotifierProvider(create: (context) => ThemeNotifier(), lazy: true),
    // Provider<INavigationService>(create: (context) => NavigationService()),
  ];
}

// class AuthService extends ChangeNotifier {
//   bool _isAuthenticated = false;

//   bool get isAuthenticated => _isAuthenticated;

//   set isAuthenticated(bool value) {
//     _isAuthenticated = value;
//     notifyListeners();
//   }
// }
