part of 'search_recipe_cubit.dart';

@immutable
abstract class SearchRecipeState {}

class SearchRecipeInitialState extends SearchRecipeState {}

class SearchRecipeLoadingState extends SearchRecipeState {}

class SearchRecipeLoadedState extends SearchRecipeState {
  SearchRecipeLoadedState(this.foundRecipes);
  final FoundRecipes foundRecipes;
}

class SearchRecipeErrorState extends SearchRecipeState {
  SearchRecipeErrorState(this.errorMessage);
  final String errorMessage;
}
