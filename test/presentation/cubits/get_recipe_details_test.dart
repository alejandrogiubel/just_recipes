import 'package:bloc_test/bloc_test.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:just_recipes/src/data/models/recipe.dart';
import 'package:just_recipes/src/data/repository/recipe_repository.dart';
import 'package:just_recipes/src/data/resources/api.dart';
import 'package:just_recipes/src/presentation/blocs/recipe_details/get_recipe/get_recipe_cubit.dart';
import 'package:just_recipes/src/presentation/utils/const.dart';

// class MockRecipeRepository extends Mock implements RecipeRepository {}

// class MockGetRecipeCubit extends MockCubit<GetRecipeState>
//     implements GetRecipeCubit {}

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

  group('GetRecipeCubit', () {
    blocTest<GetRecipeCubit, GetRecipeState>(
      'emit new recipe details state',
      build: () => GetRecipeCubit(repository),
      act: (cubit) => cubit.getRecipe(123123),
      expect: () => [
        GetRecipeLoadingState(),
        GetRecipeLoadedState(
          const Recipe(
            id: 123123,
          ),
        ),
      ],
    );
  });
}
