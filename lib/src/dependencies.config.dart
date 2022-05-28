// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:hive_flutter/hive_flutter.dart' as _i3;
import 'package:injectable/injectable.dart' as _i2;
import 'package:just_recipes/src/data/repository/recipe_repository.dart' as _i7;
import 'package:just_recipes/src/data/resources/api.dart' as _i6;
import 'package:just_recipes/src/dependencies.dart' as _i11;
import 'package:just_recipes/src/presentation/blocs/home/recipe_of_the_day/recipe_of_the_day_cubit.dart'
    as _i10;
import 'package:just_recipes/src/presentation/blocs/home/recommended_recipe/recommended_recipe_cubit.dart'
    as _i8;
import 'package:just_recipes/src/presentation/blocs/recipe_details/get_recipe/get_recipe_cubit.dart'
    as _i9;
import 'package:just_recipes/src/presentation/blocs/recipe_details/save_recipe/save_recipe_cubit.dart'
    as _i5; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  await gh.lazySingletonAsync<_i3.Box<int>>(() => registerModule.myRecipesBox,
      instanceName: 'my_recipes_box', preResolve: true);
  gh.lazySingleton<_i4.Dio>(() => registerModule.dio);
  gh.factory<_i5.SaveRecipeCubit>(() =>
      _i5.SaveRecipeCubit(get<_i3.Box<int>>(instanceName: 'my_recipes_box')));
  gh.factory<String>(() => registerModule.baseUrl, instanceName: 'baseUrl');
  gh.lazySingleton<_i6.Api>(() =>
      _i6.Api(get<_i4.Dio>(), baseUrl: get<String>(instanceName: 'baseUrl')));
  gh.lazySingleton<_i7.RecipeRepository>(
      () => _i7.RecipeRepository(api: get<_i6.Api>()));
  gh.factory<_i8.RecommendedRecipeCubit>(
      () => _i8.RecommendedRecipeCubit(get<_i7.RecipeRepository>()));
  gh.factory<_i9.GetRecipeCubit>(
      () => _i9.GetRecipeCubit(get<_i7.RecipeRepository>()));
  gh.factory<_i10.RecipeOfTheDayCubit>(
      () => _i10.RecipeOfTheDayCubit(get<_i7.RecipeRepository>()));
  return get;
}

class _$RegisterModule extends _i11.RegisterModule {}
