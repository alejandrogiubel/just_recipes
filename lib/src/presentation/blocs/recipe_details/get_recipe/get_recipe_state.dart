part of 'get_recipe_cubit.dart';

@immutable
abstract class GetRecipeState {}

class GetRecipeInitialState extends GetRecipeState {}

class GetRecipeLoadingState extends GetRecipeState {}

class GetRecipeLoadedState extends GetRecipeState {
  GetRecipeLoadedState(this.recipe);
  final Recipe recipe;
}

class GetRecipeErrorState extends GetRecipeState {
  GetRecipeErrorState(this.error);
  final String error;
}
