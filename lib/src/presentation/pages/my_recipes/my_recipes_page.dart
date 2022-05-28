import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get_it/get_it.dart';
import 'package:just_recipes/src/presentation/blocs/my_recipes/my_recipes_cubit.dart';
import 'package:just_recipes/src/presentation/router/router.gr.dart';
import 'package:just_recipes/src/presentation/widgets/fail_widget.dart';
import 'package:just_recipes/src/presentation/widgets/loading_widget.dart';
import 'package:just_recipes/src/presentation/widgets/recipe_tile.dart';

class MyRecipesPage extends StatelessWidget with AutoRouteWrapper {
  const MyRecipesPage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<MyRecipesCubit>().getMyRecipes();
    return BlocBuilder<MyRecipesCubit, MyRecipesState>(
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
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: StaggeredGrid.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 12,
                  children: state.recipes
                      .map(
                        (e) => RecipeTile(
                          title: e.sourceName ?? '',
                          timeInMinutes: e.readyInMinutes ?? 0,
                          portions: e.servings ?? 0,
                          imageUrl: e.image ?? '',
                          subtitle: e.title ?? '',
                          onTap: () => context.router
                              .push(RecipeDetailsRoute(recipeId: e.id!)),
                        ),
                      )
                      .toList(),
                ),
              ),
            );
          }
        } else {
          state as MyRecipesErrorState;
          return FailWidget(error: state.message);
        }
      },
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
