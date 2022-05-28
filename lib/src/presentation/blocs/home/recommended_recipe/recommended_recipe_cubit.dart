import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:just_recipes/src/data/models/recipe.dart';
import 'package:just_recipes/src/data/repository/recipe_repository.dart';
import 'package:meta/meta.dart';

part 'recommended_recipe_state.dart';

@injectable
class RecommendedRecipeCubit extends Cubit<RecommendedRecipeState> {
  RecommendedRecipeCubit(this._recipeRepository)
      : super(RecommendedRecipeInitialState());
  final RecipeRepository _recipeRepository;

  Future<void> getRecommendedRecipe() async {
    emit(RecommendedRecipeLoadingState());
    try {
      final recipe = await _recipeRepository.getRandomRecipes(
        tags: '',
        numberOfRecipes: 1,
      );
      emit(RecommendedRecipeLoadedState(recipe));
    } catch (e) {
      emit(RecommendedRecipeErrorState(e.toString()));
    }
  }
}
