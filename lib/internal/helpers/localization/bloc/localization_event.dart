// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'localization_bloc.dart';

@immutable
abstract class LocalizationEvent {}

class ChangeLocaleEvent extends LocalizationEvent {
  final String locale;

  ChangeLocaleEvent({required this.locale});
}
