import 'package:dio/dio.dart';
import 'package:ricky_and_mortypp/models/characters_model.dart';

class ApiService {
  final _dio = Dio(BaseOptions(baseUrl: 'https://rickandmortyapi.com/api/'));
 
  Future<CharachtersModel> getCharacters({String? url, Map<String, dynamic>? args}) async {
    try {
      final response = await _dio.get(url ?? 'character', queryParameters: args);
      return CharachtersModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

    Future<List<CharacterModel>> getMultipleCharacters(List<int> idList) async {
    try {
      final response = await _dio.get('character/${idList.join(',')}');
      return (response.data as List)
          .map((e) => CharacterModel.fromJson(e))
          .toList();
    } catch (e) {
      rethrow;
    }
  }

}
