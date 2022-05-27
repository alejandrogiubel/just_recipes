import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:just_recipes/src/data/models/autocomplete_search_result.dart';

void main() {
  group('AutocompleteSearch model test', () {
    //load fake data
    final mockData =
    File('test/data/models/mock_data/autocomplete_search.json')
        .readAsStringSync();

    //parse json
    final data = json.decode(mockData) as Map<String, dynamic>;

    //create mock from json
    final autocompleteSearchFromJson = AutocompleteSearch.fromJson(data);

    //create mock from constructor
    const autocompleteSearchFromConstructor = AutocompleteSearch(
      id: 296687,
      title: 'chicken',
      imageType: 'jpg',
    );

    test('Test instance equality', () {
      expect(
        autocompleteSearchFromJson,
        equals(autocompleteSearchFromConstructor),
      );
    });

    test('Test from json', () {
      expect(autocompleteSearchFromJson, isA<AutocompleteSearch>());
      expect(
        autocompleteSearchFromJson,
        equals(AutocompleteSearch.fromJson(data)),
      );
    });

    test('Test to json', () {
      expect(autocompleteSearchFromJson.toJson(), isA<Map<String, dynamic>>());
      expect(autocompleteSearchFromJson.toJson(), equals(data));
    });
  });
}
