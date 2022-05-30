part of 'recipe_of_the_day_cubit.dart';

@immutable
abstract class RecipeOfTheDayState extends Equatable {}

class RecipeOfTheDayInitialState extends RecipeOfTheDayState {
  @override
  List<Object?> get props => [];
}

class RecipeOfTheDayLoadingState extends RecipeOfTheDayState {
  @override
  List<Object?> get props => [];
}

class RecipeOfTheDayLoadedState extends RecipeOfTheDayState {
  RecipeOfTheDayLoadedState(this.recipe);
  final RandomRecipes recipe;

  @override
  List<Object?> get props => [recipe.recipes!.length];
}

class RecipeOfTheDayErrorState extends RecipeOfTheDayState {
  RecipeOfTheDayErrorState(this.message);
  final String message;

  @override
  List<Object?> get props => [message];
}
