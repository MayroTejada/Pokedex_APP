import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pokedex_app/core/network/app_cofig.dart';

@module
abstract class DioProvider {
  @singleton
  Dio dio(IConfig config) {
    Dio dio = Dio();
    dio.interceptors.addAll([
      LogInterceptor(
          requestBody: true, responseHeader: false, responseBody: true)
    ]);
    dio.options.headers = config.headers;
    return dio;
  }
}
