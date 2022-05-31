// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i8;
import 'package:flutter/material.dart' as _i9;

import '../pages/cook_now/cook_now_page.dart' as _i6;
import '../pages/home/home_page.dart' as _i4;
import '../pages/intro/intro_page.dart' as _i3;
import '../pages/my_recipes/my_recipes_page.dart' as _i5;
import '../pages/recipe_details/recipe_details_page.dart' as _i2;
import '../pages/root/root_page.dart' as _i1;
import '../pages/settings/settings_page.dart' as _i7;

class AppRouter extends _i8.RootStackRouter {
  AppRouter([_i9.GlobalKey<_i9.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i8.PageFactory> pagesMap = {
    RootRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.RootPage());
    },
    RecipeDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<RecipeDetailsRouteArgs>();
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i8.WrappedRoute(
              child: _i2.RecipeDetailsPage(
                  recipeId: args.recipeId, key: args.key)));
    },
    IntroRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.IntroPage());
    },
    HomeRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i8.WrappedRoute(child: const _i4.HomePage()));
    },
    MyRecipesRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i8.WrappedRoute(child: const _i5.MyRecipesPage()));
    },
    CookNowRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.CookNowPage());
    },
    SettingsRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i8.WrappedRoute(child: const _i7.SettingsPage()));
    }
  };

  @override
  List<_i8.RouteConfig> get routes => [
        _i8.RouteConfig(RootRoute.name, path: '/root-page', children: [
          _i8.RouteConfig(HomeRoute.name, path: '', parent: RootRoute.name),
          _i8.RouteConfig(MyRecipesRoute.name,
              path: 'my-recipes-page', parent: RootRoute.name),
          _i8.RouteConfig(CookNowRoute.name,
              path: 'cook-now-page', parent: RootRoute.name),
          _i8.RouteConfig(SettingsRoute.name,
              path: 'settings-page', parent: RootRoute.name)
        ]),
        _i8.RouteConfig(RecipeDetailsRoute.name, path: '/recipe-details-page'),
        _i8.RouteConfig(IntroRoute.name, path: '/')
      ];
}

/// generated route for
/// [_i1.RootPage]
class RootRoute extends _i8.PageRouteInfo<void> {
  const RootRoute({List<_i8.PageRouteInfo>? children})
      : super(RootRoute.name, path: '/root-page', initialChildren: children);

  static const String name = 'RootRoute';
}

/// generated route for
/// [_i2.RecipeDetailsPage]
class RecipeDetailsRoute extends _i8.PageRouteInfo<RecipeDetailsRouteArgs> {
  RecipeDetailsRoute({required int recipeId, _i9.Key? key})
      : super(RecipeDetailsRoute.name,
            path: '/recipe-details-page',
            args: RecipeDetailsRouteArgs(recipeId: recipeId, key: key));

  static const String name = 'RecipeDetailsRoute';
}

class RecipeDetailsRouteArgs {
  const RecipeDetailsRouteArgs({required this.recipeId, this.key});

  final int recipeId;

  final _i9.Key? key;

  @override
  String toString() {
    return 'RecipeDetailsRouteArgs{recipeId: $recipeId, key: $key}';
  }
}

/// generated route for
/// [_i3.IntroPage]
class IntroRoute extends _i8.PageRouteInfo<void> {
  const IntroRoute() : super(IntroRoute.name, path: '/');

  static const String name = 'IntroRoute';
}

/// generated route for
/// [_i4.HomePage]
class HomeRoute extends _i8.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i5.MyRecipesPage]
class MyRecipesRoute extends _i8.PageRouteInfo<void> {
  const MyRecipesRoute() : super(MyRecipesRoute.name, path: 'my-recipes-page');

  static const String name = 'MyRecipesRoute';
}

/// generated route for
/// [_i6.CookNowPage]
class CookNowRoute extends _i8.PageRouteInfo<void> {
  const CookNowRoute() : super(CookNowRoute.name, path: 'cook-now-page');

  static const String name = 'CookNowRoute';
}

/// generated route for
/// [_i7.SettingsPage]
class SettingsRoute extends _i8.PageRouteInfo<void> {
  const SettingsRoute() : super(SettingsRoute.name, path: 'settings-page');

  static const String name = 'SettingsRoute';
}
