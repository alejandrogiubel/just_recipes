import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:just_recipes/src/data/models/extended_ingredients.dart';
import 'package:just_recipes/src/data/models/measures.dart';

void main() {
  group('ExtendedIngredients model test', () {
    //load fake data
    final mockData =
        File('test/data/models/mock_data/extended_ingredients.json')
            .readAsStringSync();

    //parse json
    final data = json.decode(mockData) as Map<String, dynamic>;

    //create mock from json
    final extendedIngredientsFromJson = ExtendedIngredients.fromJson(data);

    //create mock from constructor
    final extendedIngredientsFromConstructor = ExtendedIngredients(
      aisle: 'Milk, Eggs, Other Dairy',
      amount: 1,
      consitency: 'solid',
      id: 1001,
      image: 'butter-sliced.jpg',
      measures: Measures.fromJson(const <String, dynamic>{
        'metric': {'amount': 1.0, 'unitLong': 'Tbsp', 'unitShort': 'Tbsp'},
        'us': {'amount': 1.0, 'unitLong': 'Tbsp', 'unitShort': 'Tbsp'}
      }),
      meta: const <List>[],
      name: 'butter',
      original: '1 tbsp butter',
      originalName: 'butter',
      unit: 'tbsp',
    );

    test('Test instance equality', () {
      expect(
        extendedIngredientsFromJson,
        equals(extendedIngredientsFromConstructor),
      );
    });

    test('Test from json', () {
      expect(extendedIngredientsFromJson, isA<ExtendedIngredients>());
      expect(
        extendedIngredientsFromJson,
        equals(ExtendedIngredients.fromJson(data)),
      );
    });

    test('Test to json', () {
      expect(extendedIngredientsFromJson.toJson(), isA<Map<String, dynamic>>());
      expect(extendedIngredientsFromJson.toJson(), equals(data));
    });
  });
}
