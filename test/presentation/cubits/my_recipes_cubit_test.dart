// import 'package:bloc_test/bloc_test.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:just_recipes/src/data/repository/recipe_repository.dart';
// import 'package:just_recipes/src/presentation/blocs/my_recipes/my_recipes_cubit.dart';
// import 'package:mocktail/mocktail.dart';
//
// // class MockMyRecipesCubit extends MockCubit<MyRecipesState>
// //     implements MyRecipesCubit {}
//
// class MockRecipeRepository extends Mock implements RecipeRepository {}
//
// class MockHive extends Mock implements HiveInterface {}
//
// void main() {
//   group('MyRecipesCubit', () {
//     // test('initial state is ', () {
//     //   when(() => _myRecipesCubit.state).thenReturn(MyRecipesInitialState());
//     //   expect(
//     //     _myRecipesCubit.state,
//     //     isA<MyRecipesInitialState>(),
//     //   );
//     // });
//
//     late final MyRecipesCubit _myRecipesCubit;
//
//     // when(() => MockHive().initFlutter()).thenAnswer((invocation) async {});
//
//     setUp(() {
//       _myRecipesCubit = MyRecipesCubit(
//         MockRecipeRepository(),
//         MockHive().box<int>('my_recipes_box'),
//       );
//       when(() => _myRecipesCubit.myRecipeBox.get(1)).thenReturn(1);
//     });
//
//     blocTest<MyRecipesCubit, MyRecipesState>(
//       'emits new random recipes',
//       build: () => _myRecipesCubit,
//       act: (cubit) async {
//         // await MockHive().initFlutter();
//         // final box = MockHive().box<int>('my_recipes_box');
//         // final _myRecipesCubit = MyRecipesCubit(
//         //   MockRecipeRepository(),
//         //   box,
//         // );
//
//         when(cubit.getMyRecipes).thenAnswer(
//           (invocation) async {},
//         );
//
//         // when(() => MockHive().initFlutter()).thenAnswer((invocation) async {});
//         // when(() => cubit.myRecipeBox.get(1)).thenReturn(1);
//
//         await cubit.getMyRecipes();
//       },
//       expect: () => [
//         isA<MyRecipesLoadingState>,
//         isA<MyRecipesLoadedState>,
//       ],
//     );
//   });
// }
