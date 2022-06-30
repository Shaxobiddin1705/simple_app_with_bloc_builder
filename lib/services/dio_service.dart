import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';

class DioService{

  ///BaseUrl
  static String baseUrl = "https://jsonplaceholder.typicode.com";

  ///Header
  static const Map<String, String> headers = {
    'Content-type': 'application/json; charset=UTF-8',
    'Accept': 'application/json',
  };

  /* Base options */

  static final BaseOptions _baseDioOptions = BaseOptions(
    baseUrl: baseUrl,
    headers: headers,
  );


  static Dio dio = Dio(_baseDioOptions);

  static Future<String?> get({required String api, required Map<String, dynamic> params}) async{
    try{
      Response response = await dio.get(api, queryParameters: params);
      if(response.statusCode == 200 || response.statusCode == 201) return jsonEncode(response.data);
      return null;
    } on DioError catch(e) {
      log(e.response.toString());
    }
    return null;
  }

  // Params
  static Map<String, String> paramsEmpty() {
    Map<String, String> params = {};
    return params;
  }

  static const String apiGetUsers = '/users';
}