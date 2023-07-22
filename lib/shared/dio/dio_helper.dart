import 'package:dio/dio.dart';

class DioHelper
{
  static late Dio dio;

  static init()
  {
    dio=Dio(
      BaseOptions(
        baseUrl: 'http://api.weatherapi.com/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response>getData({
  required String url,
  required dynamic query,
})async
  {
    return await dio.get(
      url,
      queryParameters: query,
    );
  }
}