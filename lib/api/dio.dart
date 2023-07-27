import 'package:dio/dio.dart';

class DioCharacter{
 late Dio dio;
 DioCharacter(){
  dio= Dio(
   BaseOptions(
    baseUrl: 'https://rickandmortyapi.com/api/',
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 10),
   )
  );
 }
 Future<Response> getAllCharacter({required String path}) async{
  Response response = await dio.get(path);
  return response;
 }
}