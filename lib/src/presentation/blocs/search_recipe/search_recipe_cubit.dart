import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:just_recipes/src/data/models/found_recipes.dart';
import 'package:just_recipes/src/data/repository/recipe_repository.dart';
import 'package:meta/meta.dart';

part 'search_recipe_state.dart';

@injectable
class SearchRecipeCubit extends Cubit<SearchRecipeState> {
  SearchRecipeCubit(
    this._recipeRepository,
  ) : super(SearchRecipeInitialState());
  final RecipeRepository _recipeRepository;

  Future<void> searchRecipe(String query) async {
    emit(SearchRecipeLoadingState());
    try {
      final recipes = await _recipeRepository.searchRecipes(query: query);
      emit(SearchRecipeLoadedState(recipes));
    } catch (e) {
      emit(SearchRecipeErrorState(e.toString()));
    }
  }

  // Future<void> getSuggested(String query) async {
  //   emit(SearchRecipeLoadingState());
  //   try {
  //     final recipes = await _recipeRepository.autocompleteRecipeSearch(query: query);
  //     emit(SearchRecipeLoadedState(recipes));
  //   } catch (e) {
  //     emit(SearchRecipeErrorState(e.toString()));
  //   }
  // }
}
