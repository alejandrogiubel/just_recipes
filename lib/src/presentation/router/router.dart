// @CupertinoAutoRouter
// @AdaptiveAutoRouter
// @CustomAutoRouter
import 'package:auto_route/annotations.dart';
import 'package:just_recipes/src/presentation/pages/cook_now/cook_now_page.dart';
import 'package:just_recipes/src/presentation/pages/home/home_page.dart';
import 'package:just_recipes/src/presentation/pages/intro_page.dart';
import 'package:just_recipes/src/presentation/pages/my_recipes/my_recipes_page.dart';
import 'package:just_recipes/src/presentation/pages/recipe_details/recipe_details_page.dart';
import 'package:just_recipes/src/presentation/pages/root/root_page.dart';
import 'package:just_recipes/src/presentation/pages/settings/settings_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute<dynamic>(
      page: RootPage,
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
    AutoRoute<dynamic>(
      page: RecipeDetailsPage,
    ),
    AutoRoute<dynamic>(
      page: IntroPage,
      initial: true,
    ),
  ],
)
class $AppRouter {}
