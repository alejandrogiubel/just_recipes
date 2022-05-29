import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_it/get_it.dart';
import 'package:just_recipes/src/data/models/recipe.dart';
import 'package:just_recipes/src/presentation/blocs/recipe_details/get_recipe/get_recipe_cubit.dart';
import 'package:just_recipes/src/presentation/blocs/recipe_details/save_recipe/save_recipe_cubit.dart';
import 'package:just_recipes/src/presentation/pages/recipe_details/widgets/ingredient.dart';
import 'package:just_recipes/src/presentation/utils/extensions/widget_extension.dart';
import 'package:just_recipes/src/presentation/widgets/fail_widget.dart';
import 'package:just_recipes/src/presentation/widgets/loading_widget.dart';

class RecipeDetailsPage extends StatelessWidget with AutoRouteWrapper {
  const RecipeDetailsPage({
    required this.recipeId,
    super.key,
  });

  final int recipeId;

  @override
  Widget build(BuildContext context) {
    return ThemeSwitchingArea(
      child: BlocBuilder<GetRecipeCubit, GetRecipeState>(
        builder: (context, state) {
          if (state is GetRecipeLoadingState) {
            return const Scaffold(body: Center(child: LoadingWidget()));
          } else if (state is GetRecipeLoadedState) {
            return Scaffold(
              appBar: AppBar(
                title: Text(state.recipe.sourceName ?? 'Recipe'),
                actions: [
                  BlocBuilder<SaveRecipeCubit, bool>(
                    builder: (context, state) {
                      if (state) {
                        return IconButton(
                          splashRadius: 20,
                          icon: Icon(
                            FontAwesomeIcons.heart,
                            color: Theme.of(context).primaryColor,
                          ),
                          onPressed: () {
                            context
                                .read<SaveRecipeCubit>()
                                .unSaveRecipe(recipeId);
                          },
                        );
                      } else {
                        return IconButton(
                          splashRadius: 20,
                          icon: const Icon(FontAwesomeIcons.heart),
                          onPressed: () {
                            context
                                .read<SaveRecipeCubit>()
                                .saveRecipe(recipeId);
                          },
                        );
                      }
                    },
                  ),
                ],
              ),
              body: getBody(context, state.recipe),
            );
          } else {
            state as GetRecipeErrorState;
            return FailWidget(error: state.error);
          }
        },
      ),
    );
  }

  Widget getBody(BuildContext context, Recipe recipe) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (recipe.image != null)
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CachedNetworkImage(
                  imageUrl: recipe.image!,
                  fit: BoxFit.cover,
                ),
              ).withDominoAnimation,
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                recipe.title ?? 'No title',
                style: Theme.of(context).textTheme.headline5,
              ).withDominoDelayedRevealAnimation(
                const Duration(milliseconds: 300),
              ),
            ),
            Row(
              children: [
                const FaIcon(FontAwesomeIcons.clock, size: 20)
                    .withDominoDelayedRevealAnimation(
                  const Duration(milliseconds: 500),
                ),
                const SizedBox(width: 10),
                Text(
                  '${recipe.readyInMinutes ?? 0} min',
                  style: Theme.of(context).textTheme.bodyText1,
                ).withDominoDelayedRevealAnimation(
                  const Duration(milliseconds: 500),
                ),
                const SizedBox(width: 40),
                const FaIcon(FontAwesomeIcons.plateWheat, size: 20)
                    .withDominoDelayedRevealAnimation(
                  const Duration(milliseconds: 700),
                ),
                const SizedBox(width: 10),
                Text(
                  '${recipe.servings ?? 0} servings',
                  style: Theme.of(context).textTheme.bodyText1,
                ).withDominoDelayedRevealAnimation(
                  const Duration(milliseconds: 700),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                'Ingredients',
                style: Theme.of(context).textTheme.headline6,
              ).withDominoDelayedRevealAnimation(
                const Duration(milliseconds: 1000),
              ),
            ),
            Column(
              children: recipe.extendedIngredients!
                  .map((e) => Ingredient(ingredient: e))
                  .toList(),
            ).withDominoDelayedRevealAnimation(
              const Duration(milliseconds: 1200),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              GetIt.I.get<GetRecipeCubit>()..getRecipe(recipeId),
        ),
        BlocProvider(
          create: (context) =>
              GetIt.I.get<SaveRecipeCubit>()..isSaved(recipeId),
        ),
      ],
      child: this,
    );
  }
}
