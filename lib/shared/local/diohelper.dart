
import 'package:dio/dio.dart';

class DioHelper{


  static Dio ?dio;

  static init(){

    dio = Dio(
       BaseOptions(
         baseUrl: 'https://cc38-197-121-61-72.eu.ngrok.io',
         receiveDataWhenStatusError: true,
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
    Map <String,dynamic> ?query,
    required Map<String,dynamic> data,
  })
  async{

    return await dio!.post("",queryParameters: query,data: data) ;

  }



}