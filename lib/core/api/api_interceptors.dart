import 'package:dio/dio.dart';
import 'package:pet_finder_app/core/api/endpoints.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers[ApiKeys.apiKey] = EndPoints.myApiKey;
    handler.next(options);
  }
}
