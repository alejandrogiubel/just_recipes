import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
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

  group('Api Test', () {
    test('Return something from api', () async {
      final api = Api(
        dio,
      );
      final response = await api.getRandomRecipe(
        tags: 'vegetarian,dessert',
        number: '1',
      );
      expect(response.isNotEmpty, true);
    });
  });
}
