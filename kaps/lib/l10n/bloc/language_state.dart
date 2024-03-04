part of 'language_bloc.dart';

@immutable
sealed class LanguageState {}

final class LanguageInitialState extends LanguageState {}

final class LanguageLoadingState extends LanguageState {
  final String lang;
  LanguageLoadingState(this.lang);
}
