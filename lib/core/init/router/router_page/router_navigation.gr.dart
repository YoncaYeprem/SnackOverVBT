// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;
import 'package:snack_over_vbt/feature/home/nav_bar.dart' as _i4;
import 'package:snack_over_vbt/feature/login/view/login.dart' as _i3;
import 'package:snack_over_vbt/feature/onboard/view/onboard_view.dart' as _i2;
import 'package:snack_over_vbt/feature/splash/view/splash_view.dart' as _i1;

class FlutterRouter extends _i5.RootStackRouter {
  FlutterRouter([_i6.GlobalKey<_i6.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    SplashViewRoute.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.SplashView());
    },
    OnboardViewRoute.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i2.OnboardView());
    },
    LoginViewRoute.name: (routeData) {
      final args = routeData.argsAs<LoginViewRouteArgs>(
          orElse: () => const LoginViewRouteArgs());
      return _i5.AdaptivePage<dynamic>(
          routeData: routeData, child: _i3.LoginView(key: args.key));
    },
    BottomNavBarRoute.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i4.BottomNavBar());
    }
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(SplashViewRoute.name, path: '/'),
        _i5.RouteConfig(OnboardViewRoute.name, path: '/onboard-view'),
        _i5.RouteConfig(LoginViewRoute.name, path: '/login-view'),
        _i5.RouteConfig(BottomNavBarRoute.name, path: '/bottom-nav-bar')
      ];
}

/// generated route for
/// [_i1.SplashView]
class SplashViewRoute extends _i5.PageRouteInfo<void> {
  const SplashViewRoute() : super(SplashViewRoute.name, path: '/');

  static const String name = 'SplashViewRoute';
}

/// generated route for
/// [_i2.OnboardView]
class OnboardViewRoute extends _i5.PageRouteInfo<void> {
  const OnboardViewRoute()
      : super(OnboardViewRoute.name, path: '/onboard-view');

  static const String name = 'OnboardViewRoute';
}

/// generated route for
/// [_i3.LoginView]
class LoginViewRoute extends _i5.PageRouteInfo<LoginViewRouteArgs> {
  LoginViewRoute({_i6.Key? key})
      : super(LoginViewRoute.name,
            path: '/login-view', args: LoginViewRouteArgs(key: key));

  static const String name = 'LoginViewRoute';
}

class LoginViewRouteArgs {
  const LoginViewRouteArgs({this.key});

  final _i6.Key? key;

  @override
  String toString() {
    return 'LoginViewRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i4.BottomNavBar]
class BottomNavBarRoute extends _i5.PageRouteInfo<void> {
  const BottomNavBarRoute()
      : super(BottomNavBarRoute.name, path: '/bottom-nav-bar');

  static const String name = 'BottomNavBarRoute';
}
