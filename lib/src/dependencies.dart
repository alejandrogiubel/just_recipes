import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:just_recipes/src/dependencies.config.dart';
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
}
