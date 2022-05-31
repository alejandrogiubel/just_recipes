part of 'get_recipe_cubit.dart';

@immutable
abstract class GetRecipeState extends Equatable {}

class GetRecipeInitialState extends GetRecipeState {
  @override
  List<Object?> get props => [];
}

class GetRecipeLoadingState extends GetRecipeState {
  @override
  List<Object?> get props => [];
}

class GetRecipeLoadedState extends GetRecipeState {
  GetRecipeLoadedState(this.recipe);
  final Recipe recipe;

  @override
  List<Object?> get props => [recipe.id];
}

class GetRecipeErrorState extends GetRecipeState {
  GetRecipeErrorState(this.error);
  final String error;

  @override
  List<Object?> get props => [error];
}
