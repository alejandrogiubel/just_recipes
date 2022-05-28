// @CupertinoAutoRouter
// @AdaptiveAutoRouter
// @CustomAutoRouter
import 'package:auto_route/annotations.dart';
import 'package:just_recipes/src/presentation/pages/cook_now/cook_now_page.dart';
import 'package:just_recipes/src/presentation/pages/home/home_page.dart';
import 'package:just_recipes/src/presentation/pages/my_recipes/my_recipes_page.dart';
import 'package:just_recipes/src/presentation/pages/root/root.dart';
import 'package:just_recipes/src/presentation/pages/settings/settings_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute<dynamic>(
      page: Root,
      initial: true,
      children: [
        AutoRoute<dynamic>(page: HomePage, initial: true),
        AutoRoute<dynamic>(
          page: MyRecipesPage,
        ),
        AutoRoute<dynamic>(
          page: CookNowPage,
        ),
        AutoRoute<dynamic>(
          page: SettingsPage,
        ),
      ],
    ),
  ],
)
class $AppRouter {}
