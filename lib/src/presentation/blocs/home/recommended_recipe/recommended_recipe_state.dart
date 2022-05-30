part of 'recommended_recipe_cubit.dart';

@immutable
abstract class RecommendedRecipeState extends Equatable {}

class RecommendedRecipeInitialState extends RecommendedRecipeState {
  @override
  List<Object?> get props => [];
}

class RecommendedRecipeLoadingState extends RecommendedRecipeState {
  @override
  List<Object?> get props => [];
}

class RecommendedRecipeLoadedState extends RecommendedRecipeState {
  RecommendedRecipeLoadedState(this.recipe);
  final RandomRecipes recipe;

  @override
  List<Object?> get props => [recipe.recipes!.length];
}

class RecommendedRecipeErrorState extends RecommendedRecipeState {
  RecommendedRecipeErrorState(this.message);
  final String message;

  @override
  List<Object?> get props => [message];
}
