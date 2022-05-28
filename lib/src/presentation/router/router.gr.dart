// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;

import '../pages/cook_now/cook_now_page.dart' as _i4;
import '../pages/home/home_page.dart' as _i2;
import '../pages/my_recipes/my_recipes_page.dart' as _i3;
import '../pages/root/root.dart' as _i1;
import '../pages/settings/settings_page.dart' as _i5;

class AppRouter extends _i6.RootStackRouter {
  AppRouter([_i7.GlobalKey<_i7.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    Root.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.Root());
    },
    HomeRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.HomePage());
    },
    MyRecipesRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.MyRecipesPage());
    },
    CookNowRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.CookNowPage());
    },
    SettingsRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.SettingsPage());
    }
  };

  @override
  List<_i6.RouteConfig> get routes => [
        _i6.RouteConfig(Root.name, path: '/', children: [
          _i6.RouteConfig(HomeRoute.name, path: '', parent: Root.name),
          _i6.RouteConfig(MyRecipesRoute.name,
              path: 'my-recipes-page', parent: Root.name),
          _i6.RouteConfig(CookNowRoute.name,
              path: 'cook-now-page', parent: Root.name),
          _i6.RouteConfig(SettingsRoute.name,
              path: 'settings-page', parent: Root.name)
        ])
      ];
}

/// generated route for
/// [_i1.Root]
class Root extends _i6.PageRouteInfo<void> {
  const Root({List<_i6.PageRouteInfo>? children})
      : super(Root.name, path: '/', initialChildren: children);

  static const String name = 'Root';
}

/// generated route for
/// [_i2.HomePage]
class HomeRoute extends _i6.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i3.MyRecipesPage]
class MyRecipesRoute extends _i6.PageRouteInfo<void> {
  const MyRecipesRoute() : super(MyRecipesRoute.name, path: 'my-recipes-page');

  static const String name = 'MyRecipesRoute';
}

/// generated route for
/// [_i4.CookNowPage]
class CookNowRoute extends _i6.PageRouteInfo<void> {
  const CookNowRoute() : super(CookNowRoute.name, path: 'cook-now-page');

  static const String name = 'CookNowRoute';
}

/// generated route for
/// [_i5.SettingsPage]
class SettingsRoute extends _i6.PageRouteInfo<void> {
  const SettingsRoute() : super(SettingsRoute.name, path: 'settings-page');

  static const String name = 'SettingsRoute';
}
