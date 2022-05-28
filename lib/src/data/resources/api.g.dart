// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps

class _Api implements Api {
  _Api(this._dio, {this.baseUrl});

  final Dio _dio;

  String? baseUrl;

  @override
  Future<RandomRecipes> getRandomRecipes(
      {tags, required numberOfRecipes}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'tags': tags,
      r'number': numberOfRecipes
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<RandomRecipes>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'recipes/random',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = RandomRecipes.fromJson(_result.data!);
    return value;
  }

  @override
  Future<Recipe> getRecipe({required id, required includeNutrition}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'includeNutrition': includeNutrition
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<Recipe>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'recipes/${id}/information',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Recipe.fromJson(_result.data!);
    return value;
  }

  @override
  Future<List<Recipe>> getRecipesBulk(
      {required ids, required includeNutrition}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'ids': ids,
      r'includeNutrition': includeNutrition
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<Recipe>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'recipes/informationBulk',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => Recipe.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<FoundRecipes> searchRecipes({required query}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'query': query};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<FoundRecipes>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'recipes/complexSearch',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = FoundRecipes.fromJson(_result.data!);
    return value;
  }

  @override
  Future<List<SimilarRecipe>> getSimilarRecipe(
      {required id, required numberOfRecipes}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'number': numberOfRecipes};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<SimilarRecipe>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'recipes/${id}/similar',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => SimilarRecipe.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<List<AutocompleteSearch>> autocompleteRecipeSearch(
      {required query}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'query': query};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<AutocompleteSearch>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'recipes/autocomplete',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) =>
            AutocompleteSearch.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
