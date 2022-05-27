import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:just_recipes/src/data/models/product_matches.dart';
import 'package:just_recipes/src/data/models/wine_pairing.dart';

void main() {
  group('WinePairing model test', () {
    //load fake data
    final mockData =
        File('test/data/models/mock_data/wine_pairing.json').readAsStringSync();

    //parse json
    final data = json.decode(mockData) as Map<String, dynamic>;

    //create mock from json
    final usFromJson = WinePairing.fromJson(data);

    //create mock from constructor
    final usFromConstructor = WinePairing(
      pairedWines: const ['chardonnay', 'gruener veltliner', 'sauvignon blanc'],
      pairingText:
          'Chardonnay, Gruener Veltliner, and Sauvignon Blanc are great choices for Pasta. Sauvignon Blanc and Gruner Veltliner both have herby notes that complement salads with enough acid to match tart vinaigrettes, while a Chardonnay can be a good pick for creamy salad dressings. The Buddha Kat Winery Chardonnay with a 4 out of 5 star rating seems like a good match. It costs about 25 dollars per bottle.',
      productMatches: [
        ProductMatches.fromJson(const <String, dynamic>{
          'id': 469199,
          'title': 'Buddha Kat Winery Chardonnay',
          'description':
              'We barrel ferment our Chardonnay and age it in a mix of Oak and Stainless. Giving this light bodied wine modest oak character, a delicate floral aroma, and a warming finish.',
          'price': r'$25.0',
          'imageUrl':
              'https://spoonacular.com/productImages/469199-312x231.jpg',
          'averageRating': 0.8,
          'ratingCount': 1.0,
          'score': 0.55,
          'link':
              'https://www.amazon.com/2015-Buddha-Kat-Winery-Chardonnay/dp/B00OSAVVM4?tag=spoonacular-20'
        })
      ],
    );

    test('Test instance equality', () {
      expect(
        usFromJson,
        equals(usFromConstructor),
      );
    });

    test('Test from json', () {
      expect(usFromJson, isA<WinePairing>());
      expect(
        usFromJson,
        equals(WinePairing.fromJson(data)),
      );
    });

    test('Test to json', () {
      expect(usFromJson.toJson(), isA<Map<String, dynamic>>());
      expect(usFromJson.toJson(), equals(data));
    });
  });
}
