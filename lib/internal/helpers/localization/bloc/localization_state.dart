// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'localization_bloc.dart';

@immutable
abstract class LocalizationState {}

class LocalizationInitial extends LocalizationState {}

class LocalizationLoadingState extends LocalizationState {}

class LocalizationLoadedState extends LocalizationState {
  final String locale;

  LocalizationLoadedState({required this.locale});
}

class LocalizationErrorState extends LocalizationState {}
