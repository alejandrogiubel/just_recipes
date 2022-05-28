import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:just_recipes/src/data/models/recipe.dart';
import 'package:just_recipes/src/data/repository/recipe_repository.dart';
import 'package:meta/meta.dart';

part 'my_recipes_state.dart';

@injectable
class MyRecipesCubit extends Cubit<MyRecipesState> {
  MyRecipesCubit(
      this._recipeRepository, @Named('my_recipes_box') this._myRecipeBox)
      : super(MyRecipesInitialState());
  final RecipeRepository _recipeRepository;
  final Box<int> _myRecipeBox;

  Future<void> getMyRecipes() async {
    emit(MyRecipesLoadingState());
    try {
      final ids = StringBuffer();
      for (final element in _myRecipeBox.values) {
        ids.write('$ids,$element');
      }
      final recipes =
          await _recipeRepository.getRecipesBulk(ids: ids.toString());
      emit(MyRecipesLoadedState(recipes));
    } catch (e) {
      emit(MyRecipesErrorState(e.toString()));
    }
  }
}
