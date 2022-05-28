import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:just_recipes/src/data/models/recipe.dart';
import 'package:just_recipes/src/data/repository/recipe_repository.dart';

part 'get_recipe_state.dart';

@injectable
class GetRecipeCubit extends Cubit<GetRecipeState> {
  GetRecipeCubit(
    this._recipeRepository,
  ) : super(GetRecipeInitialState());
  final RecipeRepository _recipeRepository;

  Future<void> getRecipe(int recipeId) async {
    emit(GetRecipeLoadingState());
    try {
      final recipe = await _recipeRepository.getRecipe(id: recipeId);
      emit(GetRecipeLoadedState(recipe));
    } catch (e) {
      emit(GetRecipeErrorState(e.toString()));
    }
  }
}
