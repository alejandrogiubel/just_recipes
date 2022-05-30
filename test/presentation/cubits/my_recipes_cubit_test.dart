import 'package:bloc_test/bloc_test.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:just_recipes/src/data/models/recipe.dart';
import 'package:just_recipes/src/data/repository/recipe_repository.dart';
import 'package:just_recipes/src/data/resources/api.dart';
import 'package:just_recipes/src/presentation/blocs/my_recipes/my_recipes_cubit.dart';
import 'package:just_recipes/src/presentation/utils/const.dart';
import 'package:mocktail/mocktail.dart';

class MockMyRecipesCubit extends MockCubit<MyRecipesState>
    implements MyRecipesCubit {}

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

  final _myRecipesCubit = MockMyRecipesCubit();

  group('MyRecipesCubit', () {
    test('initial state is ', () {
      when(() => _myRecipesCubit.state).thenReturn(MyRecipesInitialState());
      expect(
        _myRecipesCubit.state,
        isA<MyRecipesInitialState>(),
      );
    });

    blocTest<MyRecipesCubit, MyRecipesState>(
      'emits new random recipes',
      build: () {
        return _myRecipesCubit;
      },
      act: (cubit) {
        when(_myRecipesCubit.getMyRecipes.call).thenAnswer(
          (invocation) async => Future.value(),
        );
        cubit.getMyRecipes();
      },
      expect: () => [
        MyRecipesLoadingState(),
        MyRecipesLoadedState(
          const [Recipe()],
        )
      ],
    );
  });
}
