import 'package:flutter_test/flutter_test.dart';
import 'package:just_recipes/src/data/models/autocomplete_search_result.dart';
import 'package:just_recipes/src/data/models/extended_ingredients.dart';
import 'package:just_recipes/src/data/models/mesures.dart';
import 'package:just_recipes/src/data/models/metric.dart';
import 'package:just_recipes/src/data/models/us.dart';

void main() {
  group('Models test', () {
    test('AutocompleteSearch model', () {
      final autocompleteSearch = AutocompleteSearch(
        id: 1,
        imageType: 'photo',
        title: 'title',
      );
      expect(autocompleteSearch.id, 1);
      expect(autocompleteSearch.imageType, 'photo');
      expect(autocompleteSearch.title, 'title');
    });

    test('ExtendedIngredients model', () {
      final measures = Measures(
        metric: Metric(
          amount: 1,
          unitLong: 'unitLong',
          unitShort: 'unitShort',
        ),
        us: Us(
          amount: 1,
          unitLong: 'unitLong',
          unitShort: 'unitShort',
        ),
      );
      final extendedIngredients = ExtendedIngredients(
        id: 1,
        aisle: 'aisle',
        amount: 1,
        consitency: 'consitency',
        image: 'image',
        measures: measures,
        meta: List<dynamic>.empty(),
        name: 'name',
        original: 'original',
        originalName: 'originalName',
        unit: 'unit',
      );
      expect(extendedIngredients.id, 1);
      expect(extendedIngredients.aisle, 'aisle');
      expect(extendedIngredients.amount, 1);
      expect(extendedIngredients.consitency, 'consitency');
      expect(extendedIngredients.image, 'image');
      expect(
        extendedIngredients.measures,
        measures,
      );
      expect(extendedIngredients.meta, List<dynamic>.empty());
      expect(extendedIngredients.name, 'name');
      expect(extendedIngredients.original, 'original');
      expect(extendedIngredients.originalName, 'originalName');
      expect(extendedIngredients.unit, 'unit');
    });
  });
}
