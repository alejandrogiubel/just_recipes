import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:just_recipes/src/data/models/similar_recipe.dart';
import 'package:just_recipes/src/data/resources/api.dart';

void main() {
  final dio = Dio(
    BaseOptions(
      headers: <String, String>{
        'Content-Type': 'application/json',
        'x-api-key': '36f46e98cf884aedb18da310c1738bc5',
      },
    ),
  );

  final api = Api(
    dio,
  );

  group('Api Test', () {
    test('Get Random Recipes', () async {
      final response = await api.getRandomRecipes(
        tags: 'vegetarian,dessert',
        numberOfRecipes: 1,
      );
      expect(response.recipes?.isNotEmpty, true);
    });

    test('Get Recipe', () async {
      final response = await api.getRecipe(
        id: 716429,
        includeNutrition: true,
      );
      expect(response.id, 716429);
    });

    test('Search Recipe', () async {
      final response = await api.searchRecipes(
        query: 'pasta',
      );
      expect(
        response.results
            ?.any((element) => element.title!.toLowerCase().contains('pasta')),
        true,
      );
    });

    test('Similar Recipe', () async {
      final response = await api.getSimilarRecipe(
        id: 716429,
        numberOfRecipes: 5,
      );
      expect(response.runtimeType, List<SimilarRecipe>);
    });

    test('Autocomplete Recipe Search', () async {
      final response = await api.autocompleteRecipeSearch(
        query: 'pas',
      );
      expect(
        response.any((element) => element.title!.toLowerCase().contains('pas')),
        true,
      );
    });
  });
}
