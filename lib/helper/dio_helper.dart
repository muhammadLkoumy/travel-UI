import 'package:dio/dio.dart';

class DioHelper {
  static Dio dio = Dio();

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: "http://mark.bslmeiyu.com/api/",
        receiveDataWhenStatusError: true,
        // sendTimeout: 3000,
        // receiveTimeout: 3000,
      ),
    );
  }

  static Future<Response> getData({
    required String url,
  }) async {
    return await dio.get(url);
  }
}
