import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:just_recipes/src/data/models/us.dart';

void main() {
  group('Us model test', () {
    //load fake data
    final mockData =
        File('test/data/models/mock_data/us.json').readAsStringSync();

    //parse json
    final data = json.decode(mockData) as Map<String, dynamic>;

    //create mock from json
    final usFromJson = Us.fromJson(data);

    //create mock from constructor
    const usFromConstructor =
        Us(amount: 2, unitLong: 'cups', unitShort: 'cups');

    test('Test instance equality', () {
      expect(
        usFromJson,
        equals(usFromConstructor),
      );
    });

    test('Test from json', () {
      expect(usFromJson, isA<Us>());
      expect(
        usFromJson,
        equals(Us.fromJson(data)),
      );
    });

    test('Test to json', () {
      expect(usFromJson.toJson(), isA<Map<String, dynamic>>());
      expect(usFromJson.toJson(), equals(data));
    });
  });
}
