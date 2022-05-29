import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:just_recipes/src/presentation/blocs/my_recipes/my_recipes_cubit.dart';

@injectable
class SaveRecipeCubit extends Cubit<bool> {
  SaveRecipeCubit(
      this._myRecipesCubit, @Named('my_recipes_box') this._myRecipeBox)
      : super(false);
  final MyRecipesCubit _myRecipesCubit;
  final Box<int> _myRecipeBox;

  Future<void> saveRecipe(int recipeId) async {
    await _myRecipeBox.put(recipeId, recipeId);
    emit(true);
    await _myRecipesCubit.getMyRecipes();
  }

  Future<void> unSaveRecipe(int recipeId) async {
    await _myRecipeBox.delete(recipeId);
    emit(false);
    await _myRecipesCubit.getMyRecipes();
  }

  Future<void> isSaved(int recipeId) async {
    emit(_myRecipeBox.containsKey(recipeId));
  }
}
