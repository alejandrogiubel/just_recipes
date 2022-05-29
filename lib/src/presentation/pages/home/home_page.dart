import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_it/get_it.dart';
import 'package:just_recipes/src/data/models/recipe.dart';
import 'package:just_recipes/src/presentation/blocs/home/recipe_of_the_day/recipe_of_the_day_cubit.dart';
import 'package:just_recipes/src/presentation/blocs/home/recommended_recipe/recommended_recipe_cubit.dart';
import 'package:just_recipes/src/presentation/pages/home/widgets/recipe_of_the_day.dart';
import 'package:just_recipes/src/presentation/pages/home/widgets/simple_tile.dart';
import 'package:just_recipes/src/presentation/router/router.gr.dart';
import 'package:just_recipes/src/presentation/utils/extensions/widget_extension.dart';
import 'package:just_recipes/src/presentation/widgets/fail_widget.dart';
import 'package:just_recipes/src/presentation/widgets/loading_widget.dart';
import 'package:just_recipes/src/presentation/widgets/recipe_tile.dart';
import 'package:just_recipes/src/presentation/widgets/simple_outlined_button.dart';

class HomePage extends StatelessWidget with AutoRouteWrapper {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<RecipeOfTheDayCubit>().getRecipeOfTheDay();
    context.read<RecommendedRecipeCubit>().getRecommendedRecipe();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            splashRadius: 20,
            onPressed: () {},
            icon: const FaIcon(FontAwesomeIcons.magnifyingGlass, size: 20),
          )
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () {
          context.read<RecipeOfTheDayCubit>().getRecipeOfTheDay();
          context.read<RecommendedRecipeCubit>().getRecommendedRecipe();
          return Future.value();
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              BlocBuilder<RecipeOfTheDayCubit, RecipeOfTheDayState>(
                builder: (context, state) {
                  if (state is RecipeOfTheDayLoadedState) {
                    return getHeader(context, state.recipe);
                  } else if (state is RecipeOfTheDayLoadingState) {
                    return const Center(child: LoadingWidget());
                  } else {
                    state as RecipeOfTheDayErrorState;
                    return Center(child: FailWidget(error: state.message));
                  }
                },
              ),
              const SizedBox(height: 40),
              BlocBuilder<RecommendedRecipeCubit, RecommendedRecipeState>(
                builder: (context, state) {
                  if (state is RecommendedRecipeLoadedState) {
                    return getRecommended(context, state.recipe);
                  } else if (state is RecommendedRecipeLoadingState) {
                    return const Center(child: LoadingWidget());
                  } else {
                    state as RecommendedRecipeErrorState;
                    return Center(
                      child: FailWidget(
                        error: state.message,
                      ),
                    );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget getHeader(BuildContext context, RandomRecipes randomRecipes) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RecipeOfTheDay(
              subtitle: randomRecipes.recipes?.first.title ?? '',
              imageUrl: randomRecipes.recipes?.first.image ?? '',
              portions: randomRecipes.recipes?.first.servings ?? 0,
              timeInMinutes: randomRecipes.recipes?.first.readyInMinutes ?? 0,
              onTap: () {
                context.router.push(
                  RecipeDetailsRoute(
                    recipeId: randomRecipes.recipes?.first.id ?? 0,
                  ),
                );
              },
            ).withDominoDelayedRevealAnimation(
              const Duration(milliseconds: 500),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(10),
                    child: SimpleTile(
                      title: 'Cook like pro',
                      subtitle: 'Thermomix  advanced tips and tricks',
                    ),
                  ).withDominoDelayedRevealAnimation(
                    const Duration(milliseconds: 700),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10),
                    child: SimpleTile(
                      title: 'Check new updates',
                    ),
                  ).withDominoDelayedRevealAnimation(
                    const Duration(milliseconds: 1000),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget getRecommended(BuildContext context, RandomRecipes randomRecipes) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            randomRecipes.recipes?.first.creditsText ?? '',
            style: Theme.of(context).textTheme.headline5?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
          ).withDominoDelayedRevealAnimation(
            const Duration(milliseconds: 1200),
          ),
          Text(
            'recommends you',
            style: Theme.of(context).textTheme.headline5?.copyWith(
                  fontSize: 30,
                ),
          ).withDominoDelayedRevealAnimation(
            const Duration(milliseconds: 1300),
          ),
          const SizedBox(height: 20),
          RecipeTile(
            title: randomRecipes.recipes?.first.title ?? '',
            subtitle: randomRecipes.recipes?.first.creditsText ?? '',
            imageUrl: randomRecipes.recipes?.first.image ?? '',
            portions: randomRecipes.recipes?.first.servings ?? 0,
            timeInMinutes: randomRecipes.recipes?.first.readyInMinutes ?? 0,
            onTap: () {
              context.router.push(
                RecipeDetailsRoute(
                  recipeId: randomRecipes.recipes?.first.id ?? 0,
                ),
              );
            },
          ).withDominoDelayedRevealAnimation(
            const Duration(milliseconds: 1500),
          ),
          const SizedBox(height: 10),
          const SimpleOutlinedButton().withDominoDelayedRevealAnimation(
            const Duration(milliseconds: 1700),
          ),
        ],
      ),
    );
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RecipeOfTheDayCubit>(
          create: (context) => GetIt.I.get<RecipeOfTheDayCubit>(),
        ),
        BlocProvider<RecommendedRecipeCubit>(
          create: (context) => GetIt.I.get<RecommendedRecipeCubit>(),
        ),
      ],
      child: this,
    );
  }
}
