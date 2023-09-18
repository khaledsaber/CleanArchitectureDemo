import 'package:clean_architecture_demo/app/app_prefs.dart';
import 'package:clean_architecture_demo/presentation/resources/constants_manager.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../app/constants.dart';

const String APPLICATION_JSON = "application/json";
const String CONTENT_TYPE = "content-type";
const String ACCEPT = "accept";
const String AUTHORIZATION = 'authorization';
const String DEFAULT_LANGUAGE = "language";

class DioFactory {

  final AppPreferences _appPreferences ;


  DioFactory(this._appPreferences);

  Future<Dio> getDio() async {
    Dio dio = Dio();


    String language = await _appPreferences.getAppLanguage();


    Map<String, String> headers = {
      CONTENT_TYPE: APPLICATION_JSON,
      ACCEPT: APPLICATION_JSON,
      AUTHORIZATION: Constants.token,
      DEFAULT_LANGUAGE: language,
    };

    dio.options = BaseOptions(
        baseUrl: Constants.baseUrl,
        headers: headers,
        receiveTimeout: const Duration(milliseconds: Constants.apiITimeOut),
        sendTimeout: const Duration(milliseconds: Constants.apiITimeOut));

    if (!kReleaseMode) {
      dio.interceptors.add(PrettyDioLogger(
          request: true,
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: true));
    }

    return dio;
  }
}
