import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:just_recipes/src/data/models/found_recipes.dart';

void main() {
  group('FoundRecipes model test', () {
    //load fake data
    final mockData = File('test/data/models/mock_data/found_recipes.json')
        .readAsStringSync();

    //parse json
    final data = json.decode(mockData) as Map<String, dynamic>;

    //create mock from json
    final foundRecipesFromJson = FoundRecipes.fromJson(data);

    //create mock from constructor
    final foundRecipesFromConstructor = FoundRecipes(
      offset: 0,
      number: 2,
      results: [
        {
          'id': 716429,
          'title': 'Pasta with Garlic, Scallions, Cauliflower & Breadcrumbs',
          'calories': 584,
          'carbs': '84g',
          'fat': '20g',
          'image': 'https://spoonacular.com/recipeImages/716429-312x231.jpg',
          'imageType': 'jpg',
          'protein': '19g'
        },
        {
          'id': 715538,
          'title':
              'What to make for dinner tonight?? Bruschetta Style Pork & Pasta',
          'calories': 521,
          'carbs': '69g',
          'fat': '10g',
          'image': 'https://spoonacular.com/recipeImages/715538-312x231.jpg',
          'imageType': 'jpg',
          'protein': '35g'
        }
      ]
          .map((dynamic e) => Results.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalResults: 86,
    );

    test('Test instance equality', () {
      expect(
        foundRecipesFromJson,
        equals(foundRecipesFromConstructor),
      );
    });

    test('Test from json', () {
      expect(foundRecipesFromJson, isA<FoundRecipes>());
      expect(
        foundRecipesFromJson,
        equals(FoundRecipes.fromJson(data)),
      );
    });

    test('Test to json', () {
      expect(foundRecipesFromJson.toJson(), isA<Map<String, dynamic>>());
      expect(foundRecipesFromJson.toJson(), equals(data));
    });

    final resultFromJson = Results.fromJson(const <String, dynamic>{
      'id': 716429,
      'title': 'Pasta with Garlic, Scallions, Cauliflower & Breadcrumbs',
      'calories': 584,
      'carbs': '84g',
      'fat': '20g',
      'image': 'https://spoonacular.com/recipeImages/716429-312x231.jpg',
      'imageType': 'jpg',
      'protein': '19g'
    });

    const resultFromConstructor = Results(
      id: 716429,
      title: 'Pasta with Garlic, Scallions, Cauliflower & Breadcrumbs',
      calories: 584,
      carbs: '84g',
      fat: '20g',
      image: 'https://spoonacular.com/recipeImages/716429-312x231.jpg',
      imageType: 'jpg',
      protein: '19g',
    );

    test('Test result instance equality', () {
      expect(
        resultFromJson,
        equals(resultFromConstructor),
      );
    });

    test('Test result from json', () {
      expect(resultFromJson, isA<Results>());
      expect(
        resultFromJson,
        equals(
          Results.fromJson(const <String, dynamic>{
            'id': 716429,
            'title': 'Pasta with Garlic, Scallions, Cauliflower & Breadcrumbs',
            'calories': 584,
            'carbs': '84g',
            'fat': '20g',
            'image': 'https://spoonacular.com/recipeImages/716429-312x231.jpg',
            'imageType': 'jpg',
            'protein': '19g'
          }),
        ),
      );
    });

    test('Test result to json', () {
      expect(resultFromJson.toJson(), isA<Map<String, dynamic>>());
      expect(
        resultFromJson.toJson(),
        equals(<String, dynamic>{
          'id': 716429,
          'title': 'Pasta with Garlic, Scallions, Cauliflower & Breadcrumbs',
          'calories': 584,
          'carbs': '84g',
          'fat': '20g',
          'image': 'https://spoonacular.com/recipeImages/716429-312x231.jpg',
          'imageType': 'jpg',
          'protein': '19g'
        }),
      );
    });
  });
}
