import 'package:auto_route/annotations.dart';
import '../../../../feature/home/nav_bar.dart';
import '../../../../feature/login/view/login.dart';
import '../../../../feature/onboard/view/onboard_view.dart';
import '../../../../feature/profile/view/modules/profile_settings/view/profile_settings_view.dart';
import '../../../../feature/splash/view/splash_view.dart';

@AdaptiveAutoRouter(routes: <AutoRoute>[
  AutoRoute(page: SplashView, initial: true),
  AutoRoute(page: OnboardView),
  AutoRoute(page: LoginView),
  AutoRoute(page: BottomNavBar),
  AutoRoute(page: ProfileSettingsView),
])
class $FlutterRouter {}
