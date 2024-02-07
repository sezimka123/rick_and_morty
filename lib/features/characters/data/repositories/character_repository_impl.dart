import 'package:dio/dio.dart';
import 'package:rick_and_morty/features/characters/data/models/character_model.dart';
import 'package:rick_and_morty/features/characters/domain/repositories/character_repository.dart';
import 'package:rick_and_morty/internal/helpers/api_requester.dart';
import 'package:rick_and_morty/internal/helpers/catch_exception.dart';

class CharacterRepositoryImpl implements CharacterRepository {
  ApiRequester apiRequester = ApiRequester();
  @override
  Future<CharacterModel> getAllCharacters() async {
    try {
      Response response = await apiRequester.toGet('character');

      if (response.statusCode == 200) {
        return CharacterModel.fromJson(response.data);
      }
      throw CatchException.convertException(response);
    } catch (e) {
      throw CatchException.convertException(e);
    }
  }
}
