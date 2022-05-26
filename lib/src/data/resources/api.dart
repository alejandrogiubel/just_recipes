import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'api.g.dart';

@RestApi(
  baseUrl: 'https://api.spoonacular.com/',
)
@lazySingleton
abstract class Api {
  @factoryMethod
  factory Api(
    Dio dio, {
    String baseUrl,
  }) = _Api;

  @GET('recipes/random')
  Future<String> getRandomRecipe({
    @Query('tags') String? tags,
    @Query('number') String? number,
  });
}
