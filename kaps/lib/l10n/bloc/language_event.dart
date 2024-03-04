part of 'language_bloc.dart';

@immutable
sealed class LanguageEvent {}

class LanguageInitial extends LanguageEvent {}

class LanguageLoading extends LanguageEvent {
  final String lang;
  LanguageLoading(this.lang);
}
