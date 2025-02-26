import 'dart:developer';

import 'package:dio/dio.dart' as dio_service;
import 'package:dio/dio.dart';

class DioService {
  Dio dio = Dio();
  Future<dynamic> getMethod(String url) async {
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

  Future<dynamic> postMethod(Map<String, dynamic> map, String url) async {
    dio.options.headers['content-type'] = 'application/json';
    //   TODO
    return await dio
        .post(url,
            data: dio_service.FormData.fromMap(map),
            options: Options(responseType: ResponseType.json, method: "POST"))
        .then(
      (response) {
        log(response.headers.toString());
        log(response.data.toString());
        log(response.statusCode.toString());
        return response;
      },
    ).catchError((err) {
      if (err is DioException) {
        return err.response!;
      }
    });
  }
}
