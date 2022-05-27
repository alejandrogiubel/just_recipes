import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:just_recipes/src/data/models/product_matches.dart';

void main() {
  group('ProductMatches model test', () {
    //load fake data
    final mockData = File('test/data/models/mock_data/product_matches.json')
        .readAsStringSync();

    //parse json
    final data = json.decode(mockData) as Map<String, dynamic>;

    //create mock from json
    final productMatchesFromJson = ProductMatches.fromJson(data);

    //create mock from constructor
    const productMatchesConstructor = ProductMatches(
      id: 469199,
      title: 'Buddha Kat Winery Chardonnay',
      description:
          'We barrel ferment our Chardonnay and age it in a mix of Oak and Stainless. Giving this light bodied wine modest oak character, a delicate floral aroma, and a warming finish.',
      price: r'$25.0',
      imageUrl: 'https://spoonacular.com/productImages/469199-312x231.jpg',
      averageRating: 0.8,
      ratingCount: 1,
      score: 0.55,
      link:
          'https://www.amazon.com/2015-Buddha-Kat-Winery-Chardonnay/dp/B00OSAVVM4?tag=spoonacular-20',
    );

    test('Test instance equality', () {
      expect(
        productMatchesFromJson,
        equals(productMatchesConstructor),
      );
    });

    test('Test from json', () {
      expect(productMatchesFromJson, isA<ProductMatches>());
      expect(
        productMatchesFromJson,
        equals(ProductMatches.fromJson(data)),
      );
    });

    test('Test to json', () {
      expect(productMatchesFromJson.toJson(), isA<Map<String, dynamic>>());
      expect(productMatchesFromJson.toJson(), equals(data));
    });
  });
}
