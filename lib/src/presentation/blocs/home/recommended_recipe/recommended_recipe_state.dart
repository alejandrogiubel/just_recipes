part of 'recommended_recipe_cubit.dart';

@immutable
abstract class RecommendedRecipeState {}

class RecommendedRecipeInitialState extends RecommendedRecipeState {}

class RecommendedRecipeLoadingState extends RecommendedRecipeState {}

class RecommendedRecipeLoadedState extends RecommendedRecipeState {
  RecommendedRecipeLoadedState(this.recipe);
  final RandomRecipes recipe;
}

class RecommendedRecipeErrorState extends RecommendedRecipeState {
  RecommendedRecipeErrorState(this.message);
  final String message;
}
