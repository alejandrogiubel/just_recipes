import '../test/data/api/api_test.dart' as api_test;
import '../test/data/models/autocomplete_search_test.dart'
    as autocomplete_search_test;
import '../test/data/models/extended_ingredients_test.dart'
    as extended_ingredients_test;
import '../test/data/models/found_recipes_test.dart' as found_recipes_test;
import '../test/data/models/measures_test.dart' as measures_test;
import '../test/data/models/metric_test.dart' as metric_test;
import '../test/data/models/prodcut_matches_test.dart' as prodcut_matches_test;
import '../test/data/repository/repository_test.dart' as repositories_test;

void main() {
  api_test.main();
  autocomplete_search_test.main();
  extended_ingredients_test.main();
  found_recipes_test.main();
  measures_test.main();
  metric_test.main();
  prodcut_matches_test.main();
  repositories_test.main();
}
