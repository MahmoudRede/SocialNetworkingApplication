
import 'package:dio/dio.dart';

class DioHelperChatBot{

  static Dio ?dio;

  static init(){

    dio = Dio(
      BaseOptions(
          baseUrl:'https://b291-197-121-127-67.eu.ngrok.io',
          receiveDataWhenStatusError: true,
          headers: {
            'Content-Type':'application/Json'
          }
      ) ,
    );

  }

  static Future<Response> getDate({
    required String url,
    Map <String,dynamic> ?query
  })
  async{

    return await dio!.get(url,queryParameters: query) ;

  }

  static Future<Response> postDate({
    required String url,
    Map <String,dynamic> ?query,
    required Map<String,dynamic> data,
  })
  async{

    return await dio!.post(url,queryParameters: query,data: data) ;

  }



}