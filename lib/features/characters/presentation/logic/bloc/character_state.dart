// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'character_bloc.dart';

@immutable
abstract class CharacterState {}

class CharacterInitial extends CharacterState {}

class AllCharactersLoadingState extends CharacterState {}

class AllCharactersLoadedState extends CharacterState {
  final CharacterModel characterModel;

  AllCharactersLoadedState({
    required this.characterModel,
  });
}

class AllCharactersErrorState extends CharacterState {
  final CatchException error;

  AllCharactersErrorState({required this.error});
}

class GetCharacterByIdLoadingState extends CharacterState {}

