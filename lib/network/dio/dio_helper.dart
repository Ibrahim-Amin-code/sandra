import 'package:dio/dio.dart';

class DioHelper {

  static late Dio dio;

  static inti() {
    dio = Dio(
        BaseOptions(
          baseUrl: 'http://beautiheath.com/sub/eshop/api/buyers/',
          receiveDataWhenStatusError: true,
        ),
    );
  }


  static Future<Response> getData({
    required String url,
    Map<String,dynamic>? query,
    String? token,
  })
  async {
    return dio.get(
        url,
        queryParameters: query??null,
        options: Options(
        headers: {
        'Authorization': token,
          //Bearer
        }
    ));
  }



  static Future<Response> postContactUsData({
    required String url,
    Map<String,dynamic>? query,
    required  Map<String,String> data,
    String? token,
  }) async
  {
    return dio.post(
        url,
        queryParameters: query??null,
        data: data,
        options: Options(
            headers: {
              'Authorization': token,
            }
        )

    );
  }






}