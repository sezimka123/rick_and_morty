import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morty/features/characters/data/models/character_model.dart';
import 'package:rick_and_morty/features/characters/domain/use_cases/character_use_case.dart';
import 'package:rick_and_morty/internal/helpers/catch_exception.dart';

part 'character_event.dart';
part 'character_state.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  final CharacterUseCase useCase;

  CharacterBloc(this.useCase) : super(CharacterInitial()) {
    on<GetAllCharactersEvent>((event, emit) async {
      emit(AllCharactersLoadingState());

      await useCase
          .getAllCharacters()
          .then((characterModel) =>
              emit(AllCharactersLoadedState(characterModel: characterModel)))
          .onError((error, stackTrace) => emit(AllCharactersErrorState(
              error: CatchException.convertException(error))));
    });
  }
}
