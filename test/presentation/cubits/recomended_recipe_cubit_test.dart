import 'package:bloc_test/bloc_test.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:just_recipes/src/data/models/recipe.dart';
import 'package:just_recipes/src/data/repository/recipe_repository.dart';
import 'package:just_recipes/src/data/resources/api.dart';
import 'package:just_recipes/src/presentation/blocs/home/recommended_recipe/recommended_recipe_cubit.dart';
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

  final _recipeRepository = RecipeRepository(
    api: Api(dio, baseUrl: apiBaseUrl),
  );

  group('RecipeOfTheDayCubit', () {
    test('initial state is ', () {
      expect(
        RecommendedRecipeCubit(_recipeRepository).state,
        isA<RecommendedRecipeInitialState>(),
      );
    });

    blocTest<RecommendedRecipeCubit, RecommendedRecipeState>(
      'emits new recommended recipes',
      build: () => RecommendedRecipeCubit(_recipeRepository),
      act: (cubit) => cubit.getRecommendedRecipe(),
      expect: () => [
        RecommendedRecipeLoadingState(),
        RecommendedRecipeLoadedState(
          const RandomRecipes(
            recipes: [
              Recipe(id: 123123),
            ],
          ),
        )
      ],
    );
  });
}
