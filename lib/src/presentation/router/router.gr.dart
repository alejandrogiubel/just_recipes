// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i7;
import 'package:flutter/material.dart' as _i8;

import '../pages/cook_now/cook_now_page.dart' as _i5;
import '../pages/home/home_page.dart' as _i3;
import '../pages/my_recipes/my_recipes_page.dart' as _i4;
import '../pages/recipe_details/recipe_details_page.dart' as _i2;
import '../pages/root/root.dart' as _i1;
import '../pages/settings/settings_page.dart' as _i6;

class AppRouter extends _i7.RootStackRouter {
  AppRouter([_i8.GlobalKey<_i8.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    Root.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.Root());
    },
    RecipeDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<RecipeDetailsRouteArgs>();
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i7.WrappedRoute(
              child: _i2.RecipeDetailsPage(
                  recipeId: args.recipeId, key: args.key)));
    },
    HomeRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i7.WrappedRoute(child: const _i3.HomePage()));
    },
    MyRecipesRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.MyRecipesPage());
    },
    CookNowRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.CookNowPage());
    },
    SettingsRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.SettingsPage());
    }
  };

  @override
  List<_i7.RouteConfig> get routes => [
        _i7.RouteConfig(Root.name, path: '/', children: [
          _i7.RouteConfig(HomeRoute.name, path: '', parent: Root.name),
          _i7.RouteConfig(MyRecipesRoute.name,
              path: 'my-recipes-page', parent: Root.name),
          _i7.RouteConfig(CookNowRoute.name,
              path: 'cook-now-page', parent: Root.name),
          _i7.RouteConfig(SettingsRoute.name,
              path: 'settings-page', parent: Root.name)
        ]),
        _i7.RouteConfig(RecipeDetailsRoute.name, path: '/recipe-details-page')
      ];
}

/// generated route for
/// [_i1.Root]
class Root extends _i7.PageRouteInfo<void> {
  const Root({List<_i7.PageRouteInfo>? children})
      : super(Root.name, path: '/', initialChildren: children);

  static const String name = 'Root';
}

/// generated route for
/// [_i2.RecipeDetailsPage]
class RecipeDetailsRoute extends _i7.PageRouteInfo<RecipeDetailsRouteArgs> {
  RecipeDetailsRoute({required int recipeId, _i8.Key? key})
      : super(RecipeDetailsRoute.name,
            path: '/recipe-details-page',
            args: RecipeDetailsRouteArgs(recipeId: recipeId, key: key));

  static const String name = 'RecipeDetailsRoute';
}

class RecipeDetailsRouteArgs {
  const RecipeDetailsRouteArgs({required this.recipeId, this.key});

  final int recipeId;

  final _i8.Key? key;

  @override
  String toString() {
    return 'RecipeDetailsRouteArgs{recipeId: $recipeId, key: $key}';
  }
}

/// generated route for
/// [_i3.HomePage]
class HomeRoute extends _i7.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i4.MyRecipesPage]
class MyRecipesRoute extends _i7.PageRouteInfo<void> {
  const MyRecipesRoute() : super(MyRecipesRoute.name, path: 'my-recipes-page');

  static const String name = 'MyRecipesRoute';
}

/// generated route for
/// [_i5.CookNowPage]
class CookNowRoute extends _i7.PageRouteInfo<void> {
  const CookNowRoute() : super(CookNowRoute.name, path: 'cook-now-page');

  static const String name = 'CookNowRoute';
}

/// generated route for
/// [_i6.SettingsPage]
class SettingsRoute extends _i7.PageRouteInfo<void> {
  const SettingsRoute() : super(SettingsRoute.name, path: 'settings-page');

  static const String name = 'SettingsRoute';
}
