part of 'my_recipes_cubit.dart';

@immutable
abstract class MyRecipesState extends Equatable {}

class MyRecipesInitialState extends MyRecipesState {
  @override
  List<Object?> get props => [];
}

class MyRecipesLoadingState extends MyRecipesState {
  @override
  List<Object?> get props => [];
}

class MyRecipesLoadedState extends MyRecipesState {
  MyRecipesLoadedState(this.recipes);
  final List<Recipe> recipes;

  @override
  List<Object?> get props => [recipes];
}

class MyRecipesErrorState extends MyRecipesState {
  MyRecipesErrorState(this.message);
  final String message;

  @override
  List<Object?> get props => [message];
}
