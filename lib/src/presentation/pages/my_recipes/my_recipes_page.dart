import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get_it/get_it.dart';
import 'package:just_recipes/src/presentation/blocs/my_recipes/my_recipes_cubit.dart';
import 'package:just_recipes/src/presentation/router/router.gr.dart';
import 'package:just_recipes/src/presentation/utils/extensions/widget_extension.dart';
import 'package:just_recipes/src/presentation/widgets/fail_widget.dart';
import 'package:just_recipes/src/presentation/widgets/loading_widget.dart';
import 'package:just_recipes/src/presentation/widgets/recipe_tile.dart';

class MyRecipesPage extends StatelessWidget with AutoRouteWrapper {
  const MyRecipesPage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<MyRecipesCubit>().getMyRecipes();
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Recipes'),
      ),
      body: RefreshIndicator(
        onRefresh: () => context.read<MyRecipesCubit>().getMyRecipes(),
        child: BlocBuilder<MyRecipesCubit, MyRecipesState>(
          builder: (context, state) {
            if (state is MyRecipesLoadingState) {
              return const Center(child: LoadingWidget());
            } else if (state is MyRecipesLoadedState) {
              if (state.recipes.isEmpty) {
                return Center(
                  child: Text(
                    'No recipes found',
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                );
              } else {
                return MasonryGridView.extent(
                  maxCrossAxisExtent: 300,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                  padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                  itemCount: state.recipes.length,
                  itemBuilder: (context, index) {
                    return RecipeTile(
                      title: state.recipes[index].title ?? '',
                      timeInMinutes: state.recipes[index].readyInMinutes ?? 0,
                      portions: state.recipes[index].servings ?? 0,
                      imageUrl: state.recipes[index].image ?? '',
                      subtitle: state.recipes[index].creditsText ?? 'Anonymous',
                      onTap: () => context.router.push(
                        RecipeDetailsRoute(
                          recipeId: state.recipes[index].id!,
                        ),
                      ),
                    ).withDominoDelayedRevealAnimation(
                      Duration(milliseconds: index * 100),
                    );
                  },
                );
              }
            } else {
              state as MyRecipesErrorState;
              return SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Center(child: FailWidget(error: state.message)),
              );
            }
          },
        ),
      ),
    );
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I.get<MyRecipesCubit>(),
      child: this,
    );
  }
}
