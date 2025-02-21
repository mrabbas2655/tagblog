import 'dart:developer';

import 'package:dio/dio.dart';

class DioService {
  Future<dynamic> getMethod(String url) async {
    Dio dio = Dio();
    dio.options.headers['content-type'] = 'application/json';

    try {
      var response = await dio.get(url,
          options: Options(responseType: ResponseType.json, method: "GET"));
      log(response.toString()); // برای چاپ نتیجه دریافتی از سرور
      return response;
    } catch (e) {
      log("Error occurred: $e"); // در صورت خطا چاپ ارور
      return null; // یا یک پاسخ خطای سفارشی
    }
  }
}
