import 'package:injectable/injectable.dart';
import 'package:just_recipes/src/data/models/autocomplete_search_result.dart';
import 'package:just_recipes/src/data/models/found_recipes.dart';
import 'package:just_recipes/src/data/models/recipe.dart';
import 'package:just_recipes/src/data/models/similar_recipe.dart';
import 'package:just_recipes/src/data/resources/api.dart';

@lazySingleton
class RecipeRepository {
  RecipeRepository({required this.api});

  final Api api;

  Future<RandomRecipes> getRandomRecipes({
    required String tags,
    required int numberOfRecipes,
  }) async {
    return api.getRandomRecipes(tags: tags, numberOfRecipes: numberOfRecipes);
  }

  Future<Recipe> getRecipe({
    required int id,
    bool includeNutrition = true,
  }) async {
    return api.getRecipe(id: id, includeNutrition: includeNutrition);
  }

  Future<FoundRecipes> searchRecipes({
    required String query,
  }) async {
    return api.searchRecipes(query: query);
  }

  Future<List<SimilarRecipe>> getSimilarRecipe({
    required int id,
    required int numberOfRecipes,
  }) async {
    return api.getSimilarRecipe(id: id, numberOfRecipes: numberOfRecipes);
  }

  Future<List<AutocompleteSearch>> autocompleteRecipeSearch({
    required String query,
  }) async {
    return api.autocompleteRecipeSearch(query: query);
  }
}
