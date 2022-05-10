import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import '../localStorage/storage.dart';

class ApplicationProvider {
  final List<SingleChildWidget> items = [
    Provider.value(value: LocaleManager()),

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
