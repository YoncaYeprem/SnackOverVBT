import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:snack_over_vbt/core/init/localStorage/storage.dart';
import 'package:snack_over_vbt/core/init/locale_storage_manager.dart';

class ApplicationProvider {
  final List<SingleChildWidget> items = [
    Provider.value(value: LocaleManager()),

    // Provider<INavigationService>(create: (context) => NavigationService()),
  ];
}
