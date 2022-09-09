import 'dart:core';

import 'package:dio/dio.dart';

import '../data/constant.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
          baseUrl: "${baseUrl}v1",
          receiveDataWhenStatusError: true,
          headers: {
            'Content-Type': 'application/json',
          }),
    );
  }

  static Future<Response> getData(
      {required String url,
      Map<String, dynamic>? query,
      String lang = 'en',
      String? token}) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      // 'lang': lang,
      'accept': '*/*',
      'Authorization': token,
    };
    return await dio.get(
      url,
      queryParameters: query,
    );
  }
}
