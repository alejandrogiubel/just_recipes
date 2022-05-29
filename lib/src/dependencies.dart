import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:just_recipes/src/dependencies.config.dart';
import 'package:just_recipes/src/presentation/utils/const.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@InjectableInit(preferRelativeImports: false)
Future<void> configureDependencies() async => $initGetIt(GetIt.I);

@module
abstract class RegisterModule {
  @lazySingleton
  Dio get dio => Dio(
        BaseOptions(
          headers: <String, String>{
            'Content-Type': 'application/json',
            'x-api-key': '36f46e98cf884aedb18da310c1738bc5',
          },
        ),
      )..interceptors.add(PrettyDioLogger());

  @Named('baseUrl')
  String get baseUrl => apiBaseUrl;

  @lazySingleton
  @Named('my_recipes_box')
  @preResolve
  Future<Box<int>> get myRecipesBox => Hive.openBox('my_recipes_box');

  @lazySingleton
  @Named('dark_mode_box')
  @preResolve
  Future<Box<bool>> get darkModeBox => Hive.openBox('dark_mode_box');

  @lazySingleton
  @Named('theme_scheme_box')
  @preResolve
  Future<Box<String>> get themeSchemeBox => Hive.openBox('theme_scheme_box');
}
