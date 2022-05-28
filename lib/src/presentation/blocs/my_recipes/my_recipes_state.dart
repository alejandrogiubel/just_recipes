part of 'my_recipes_cubit.dart';

@immutable
abstract class MyRecipesState {}

class MyRecipesInitialState extends MyRecipesState {}

class MyRecipesLoadingState extends MyRecipesState {}

class MyRecipesLoadedState extends MyRecipesState {
  MyRecipesLoadedState(this.recipes);
  final List<Recipe> recipes;
}

class MyRecipesErrorState extends MyRecipesState {
  MyRecipesErrorState(this.message);
  final String message;
}
