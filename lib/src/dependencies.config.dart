// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:just_recipes/src/data/repository/recipe_repository.dart' as _i5;
import 'package:just_recipes/src/data/resources/api.dart' as _i4;
import 'package:just_recipes/src/dependencies.dart'
    as _i6; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  gh.lazySingleton<_i3.Dio>(() => registerModule.dio);
  gh.lazySingleton<_i4.Api>(
      () => _i4.Api(get<_i3.Dio>(), baseUrl: get<String>()));
  gh.lazySingleton<_i5.RecipeRepository>(
      () => _i5.RecipeRepository(api: get<_i4.Api>()));
  return get;
}

class _$RegisterModule extends _i6.RegisterModule {}