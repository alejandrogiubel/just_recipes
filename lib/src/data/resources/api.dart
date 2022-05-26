import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:just_recipes/src/data/models/autocomplete_search_result.dart';
import 'package:just_recipes/src/data/models/found_recipes.dart';
import 'package:just_recipes/src/data/models/recipe.dart';
import 'package:just_recipes/src/data/models/similar_recipe.dart';
import 'package:retrofit/retrofit.dart';

part 'api.g.dart';

@RestApi(
  baseUrl: 'https://api.spoonacular.com/',
)
@lazySingleton
abstract class Api {
  @factoryMethod
  factory Api(
    Dio dio, {
    String baseUrl,
  }) = _Api;

  @GET('recipes/random')
  Future<RandomRecipes> getRandomRecipes({
    @Query('tags') required String? tags,
    @Query('number') required int number,
  });

  @GET('recipes/{id}/information')
  Future<Recipe> getRecipe({
    @Path('id') required int id,
    @Query('includeNutrition') required bool includeNutrition,
  });

  @GET('recipes/complexSearch')
  Future<FoundRecipes> searchRecipes({
    @Query('query') required String query,
  });

  @GET('recipes/{id}/similar')
  Future<List<SimilarRecipe>> getSimilarRecipe({
    @Path('id') required int id,
    @Query('number') required int number,
  });

  @GET('recipes/autocomplete')
  Future<List<AutocompleteSearch>> autocompleteRecipeSearch({
    @Query('query') required String query,
  });
}
