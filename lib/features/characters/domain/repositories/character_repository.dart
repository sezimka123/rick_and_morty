import 'package:rick_and_morty/features/characters/data/models/character_model.dart';

abstract class CharacterRepository {
  Future<CharacterModel> getAllCharacters();
}