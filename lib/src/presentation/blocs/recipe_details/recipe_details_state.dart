part of 'recipe_details_cubit.dart';

@immutable
abstract class RecipeDetailsState {}

class RecipeDetailsInitialState extends RecipeDetailsState {}

class RecipeDetailsLoadingState extends RecipeDetailsState {}

class RecipeDetailsLoadedState extends RecipeDetailsState {
  RecipeDetailsLoadedState(this.recipe);
  final Recipe recipe;
}

class RecipeDetailsErrorState extends RecipeDetailsState {
  RecipeDetailsErrorState(this.error);
  final String error;
}
