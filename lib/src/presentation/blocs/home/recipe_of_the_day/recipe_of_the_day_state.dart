part of 'recipe_of_the_day_cubit.dart';

@immutable
abstract class RecipeOfTheDayState {}

class RecipeOfTheDayInitialState extends RecipeOfTheDayState {}

class RecipeOfTheDayLoadingState extends RecipeOfTheDayState {}

class RecipeOfTheDayLoadedState extends RecipeOfTheDayState {
  RecipeOfTheDayLoadedState(this.recipe);
  final RandomRecipes recipe;
}

class RecipeOfTheDayErrorState extends RecipeOfTheDayState {
  RecipeOfTheDayErrorState(this.message);
  final String message;
}
