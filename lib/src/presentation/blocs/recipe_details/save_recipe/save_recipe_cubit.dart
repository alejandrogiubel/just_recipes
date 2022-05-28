import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

@injectable
class SaveRecipeCubit extends Cubit<bool> {
  SaveRecipeCubit(@Named('my_recipes_box') this.myRecipeBox) : super(false);
  final Box<int> myRecipeBox;

  Future<void> saveRecipe(int recipeId) async {
    await myRecipeBox.put(recipeId, recipeId);
    emit(true);
  }

  Future<void> unSaveRecipe(int recipeId) async {
    await myRecipeBox.delete(recipeId);
    emit(false);
  }

  Future<void> isSaved(int recipeId) async {
    emit(myRecipeBox.containsKey(recipeId));
  }
}
