import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:just_recipes/src/presentation/blocs/search_recipe/search_recipe_cubit.dart';
import 'package:just_recipes/src/presentation/router/router.gr.dart';
import 'package:just_recipes/src/presentation/style/themes.dart';
import 'package:just_recipes/src/presentation/widgets/fail_widget.dart';
import 'package:just_recipes/src/presentation/widgets/loading_widget.dart';

class SearchRecipeDelegate extends SearchDelegate<void> {
  final cubit = GetIt.I.get<SearchRecipeCubit>();

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const FaIcon(FontAwesomeIcons.xmark),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const FaIcon(FontAwesomeIcons.arrowLeft),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    cubit.searchRecipe(query);
    return BlocBuilder<SearchRecipeCubit, SearchRecipeState>(
      bloc: cubit,
      builder: (context, state) {
        if (state is SearchRecipeLoadingState) {
          return const Center(
            child: LoadingWidget(),
          );
        } else if (state is SearchRecipeLoadedState) {
          return ListView.builder(
            itemCount: state.foundRecipes.results!.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(state.foundRecipes.results![index].title!),
                onTap: () {
                  context.router.push(
                    RecipeDetailsRoute(
                      recipeId: state.foundRecipes.results![index].id!,
                    ),
                  );
                },
              );
            },
          );
        } else {
          state as SearchRecipeErrorState;
          return Center(
            child: FailWidget(error: state.errorMessage),
          );
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    return Column();
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    return GetIt.I
                .get<Box<bool>>(instanceName: 'dark_mode_box')
                .get('darkMode', defaultValue: false)! ==
            true
        ? darkTheme
        : lightTheme;
  }
}
