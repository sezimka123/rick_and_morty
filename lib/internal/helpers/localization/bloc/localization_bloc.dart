import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morty/internal/helpers/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'localization_event.dart';
part 'localization_state.dart';

@singleton
class LocalizationBloc extends Bloc<LocalizationEvent, LocalizationState> {
  LocalizationBloc() : super(LocalizationInitial()) {
    on<ChangeLocaleEvent>((event, emit) async {
      try {
        emit(LocalizationLoadingState());

        LocalizationHelper.setLocale(event.locale);

        String locale = await LocalizationHelper.getLocale();

        emit(LocalizationLoadedState(locale: locale));
      } catch (e) {
        emit(LocalizationErrorState());
      }
    });
  }
}
