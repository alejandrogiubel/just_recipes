import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:just_recipes/src/data/models/recipe.dart';
import 'package:just_recipes/src/data/repository/recipe_repository.dart';
import 'package:meta/meta.dart';

part 'recipe_of_the_day_state.dart';

@injectable
class RecipeOfTheDayCubit extends Cubit<RecipeOfTheDayState> {
  RecipeOfTheDayCubit(this._recipeRepository)
      : super(RecipeOfTheDayInitialState());
  final RecipeRepository _recipeRepository;

  Future<void> getRecipeOfTheDay() async {
    emit(RecipeOfTheDayLoadingState());
    try {
      final recipe = await _recipeRepository.getRandomRecipes(
        tags: 'vegan',
        numberOfRecipes: 1,
      );
      emit(RecipeOfTheDayLoadedState(recipe));
    } catch (e) {
      emit(RecipeOfTheDayErrorState(e.toString()));
    }
  }
}
