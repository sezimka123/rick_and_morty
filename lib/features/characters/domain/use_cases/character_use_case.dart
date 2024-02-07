// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:rick_and_morty/features/characters/data/models/character_model.dart';
import 'package:rick_and_morty/features/characters/domain/repositories/character_repository.dart';

class CharacterUseCase {
  final CharacterRepository characterRepository;

  CharacterUseCase({
    required this.characterRepository,
  });

  Future<CharacterModel> getAllCharacters() async => await characterRepository.getAllCharacters();
}
