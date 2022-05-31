import 'package:bloc_test/bloc_test.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:just_recipes/src/data/repository/recipe_repository.dart';
import 'package:just_recipes/src/data/resources/api.dart';
import 'package:just_recipes/src/presentation/blocs/search_recipe/search_recipe_cubit.dart';
import 'package:just_recipes/src/presentation/utils/const.dart';

void main() {
  final dio = Dio(
    BaseOptions(
      headers: <String, String>{
        'Content-Type': 'application/json',
        'x-api-key': '36f46e98cf884aedb18da310c1738bc5',
      },
    ),
  );

  final api = Api(
    dio,
    baseUrl: apiBaseUrl,
  );

  final repository = RecipeRepository(
    api: api,
  );

  group('RecipeOfTheDayCubit', () {
    blocTest<SearchRecipeCubit, SearchRecipeState>(
      'emits new found recipes state',
      build: () => SearchRecipeCubit(repository),
      act: (cubit) => cubit.searchRecipe('pasta'),
      expect: () => [
        isA<SearchRecipeLoadingState>(),
        isA<SearchRecipeLoadedState>(),
      ],
    );
  });
}
