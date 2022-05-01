import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import '../localStorage/storage.dart';

class ApplicationProvider {
  final List<SingleChildWidget> items = [
    Provider.value(value: LocaleManager()),

    // Provider<INavigationService>(create: (context) => NavigationService()),
  ];
}
