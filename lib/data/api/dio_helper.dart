import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shop/data/api/api_constants.dart';

class DioHelper {
  static  Dio dio;

  static init() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
    );
    dio = Dio(options);
  }

  static Future<dynamic> getData({
    @required String url,
    Map<String, dynamic> query,
    String lang = 'en',
    String token,
  }) async {
    dio.options.headers = {
      'lang': lang,
      'Content-Type': 'application/json',
      'Authorization': token ?? '',
    };
    return await dio.get(
      url,
      queryParameters: query,
    );
  }

  static Future<Response> postData({
   @required String url,
    Map<String, dynamic> query,
   @required Map<String, dynamic> data,
    String lang = 'en',
    String token,
  }) async {
    dio.options.headers = {
      'lang': lang,
      'Content-Type': 'application/json',
      'Authorization': token ?? '',
    };
    return dio.post(
      url,
      queryParameters: query,
      data: data,
    );
  }
}
