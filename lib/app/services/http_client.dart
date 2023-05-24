import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class HttpClient {
  static String domain = 'https://xiaomi.itying.com';
  static Dio dio = Dio();

  HttpClient() {
    dio.options.baseUrl = domain;
    dio.options.connectTimeout = const Duration(milliseconds: 10000);
    dio.options.receiveTimeout = const Duration(milliseconds: 10000);
  }

  Future get(String url) async {
    try {
      var response = await dio.get(url);
      return response;
    } catch (e) {
      debugPrint("请求超时 $e");
      return null;
    }
  }

  static replacePath(path) {
    return '$domain/${path.replaceAll("\\", "/")}' ;
  }
}
