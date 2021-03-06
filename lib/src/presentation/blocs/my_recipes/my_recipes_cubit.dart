import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:just_recipes/src/data/models/recipe.dart';
import 'package:just_recipes/src/data/repository/recipe_repository.dart';
import 'package:meta/meta.dart';

part 'my_recipes_state.dart';

@lazySingleton
class MyRecipesCubit extends Cubit<MyRecipesState> {
  MyRecipesCubit(
    this._recipeRepository,
    @Named('my_recipes_box') this.myRecipeBox,
  ) : super(MyRecipesInitialState());
  final RecipeRepository _recipeRepository;
  final Box<int> myRecipeBox;

  Future<void> getMyRecipes() async {
    emit(MyRecipesLoadingState());
    try {
      final ids = StringBuffer();
      for (final element in myRecipeBox.values) {
        ids.write(',$element');
      }
      final recipes =
          await _recipeRepository.getRecipesBulk(ids: ids.toString());
      emit(MyRecipesLoadedState(recipes));
    } catch (e) {
      emit(MyRecipesErrorState('Connection error'));
    }
  }
}
