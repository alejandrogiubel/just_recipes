import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:just_recipes/src/data/models/measures.dart';
import 'package:just_recipes/src/data/models/metric.dart';
import 'package:just_recipes/src/data/models/us.dart';

void main() {
  group('Measures model test', () {
    //load fake data
    final mockData =
        File('test/data/models/mock_data/measures.json').readAsStringSync();

    //parse json
    final data = json.decode(mockData) as Map<String, dynamic>;

    //create mock from json
    final measuresFromJson = Measures.fromJson(data);

    //create mock from constructor
    final measuresFromConstructor = Measures(
      metric: Metric.fromJson(const <String, dynamic>{
        'amount': 1.0,
        'unitLong': 'Tbsp',
        'unitShort': 'Tbsp',
      }),
      us: Us.fromJson(const <String, dynamic>{
        'amount': 1.0,
        'unitLong': 'Tbsp',
        'unitShort': 'Tbsp'
      }),
    );

    test('Test instance equality', () {
      expect(
        measuresFromJson,
        equals(measuresFromConstructor),
      );
    });

    test('Test from json', () {
      expect(measuresFromJson, isA<Measures>());
      expect(
        measuresFromJson,
        equals(Measures.fromJson(data)),
      );
    });

    test('Test to json', () {
      expect(measuresFromJson.toJson(), isA<Map<String, dynamic>>());
      expect(measuresFromJson.toJson(), equals(data));
    });
  });
}
