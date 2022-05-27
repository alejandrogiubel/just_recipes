import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:just_recipes/src/data/models/similar_recipe.dart';

void main() {
  group('SimilarRecipe model test', () {
    //load fake data
    final mockData = File('test/data/models/mock_data/similar_recipes.json')
        .readAsStringSync();

    //parse json
    final data = json.decode(mockData) as Map<String, dynamic>;

    //create mock from json
    final similarRecipeFromJson = SimilarRecipe.fromJson(data);

    //create mock from constructor
    const similarRecipeFromConstructor = SimilarRecipe(
      id: 209128,
      title: 'Dinner Tonight: Grilled Romesco-Style Pork',
      imageType: 'jpg',
      readyInMinutes: 45,
      servings: 4,
      sourceUrl:
          'http://www.seriouseats.com/recipes/2008/07/grilled-romesco-style-pork-salad-recipe.html',
    );

    test('Test instance equality', () {
      expect(
        similarRecipeFromJson,
        equals(similarRecipeFromConstructor),
      );
    });

    test('Test from json', () {
      expect(similarRecipeFromJson, isA<SimilarRecipe>());
      expect(
        similarRecipeFromJson,
        equals(SimilarRecipe.fromJson(data)),
      );
    });

    test('Test to json', () {
      expect(similarRecipeFromJson.toJson(), isA<Map<String, dynamic>>());
      expect(similarRecipeFromJson.toJson(), equals(data));
    });
  });
}
