import 'package:dio/dio.dart';
import 'package:movie_rikeandmo/api/dio.dart';

import 'model.dart';

class Repository{
  DioCharacter dioCharacter=DioCharacter();

  Future<List<Model>> getCharacterData() async{
    Response response= await dioCharacter.getAllCharacter(path: 'character');
    List result = response.data['results'];
    return result.map((e) => Model.fromJson(e)).toList();
  }
}