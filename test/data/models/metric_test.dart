import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:just_recipes/src/data/models/metric.dart';

void main() {
  group('Metric model test', () {
    //load fake data
    final mockData =
        File('test/data/models/mock_data/metric.json').readAsStringSync();

    //parse json
    final data = json.decode(mockData) as Map<String, dynamic>;

    //create mock from json
    final metricFromJson = Metric.fromJson(data);

    //create mock from constructor
    const metricFromConstructor = Metric(
      amount: 1,
      unitLong: 'Tbsp',
      unitShort: 'Tbsp',
    );

    test('Test instance equality', () {
      expect(
        metricFromJson,
        equals(metricFromConstructor),
      );
    });

    test('Test from json', () {
      expect(metricFromJson, isA<Metric>());
      expect(
        metricFromJson,
        equals(Metric.fromJson(data)),
      );
    });

    test('Test to json', () {
      expect(metricFromJson.toJson(), isA<Map<String, dynamic>>());
      expect(metricFromJson.toJson(), equals(data));
    });
  });
}
