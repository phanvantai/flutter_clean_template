import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

class API {
  static const String baseUrl = "http://118.70.67.17:5000";

  static const String samplePath = "/user/login";
}

@RestApi(baseUrl: API.baseUrl + '/api/')
abstract class ApiService {
  factory ApiService(Dio dio, {String? baseUrl}) {
    dio.options =
        BaseOptions(receiveTimeout: 30000, connectTimeout: 30000, headers: {
      'Content-Type': 'application/json',
      //'authorization': getIt<SharedPreferenceHelper>().getAuthToken,
    });

    if (kDebugMode) {
      dio.interceptors.add(PrettyDioLogger(
        responseBody: true,
        error: true,
        requestHeader: true,
        responseHeader: false,
        request: false,
        requestBody: true,
      ));
    }
    return _ApiService(dio, baseUrl: baseUrl);
  }
}
