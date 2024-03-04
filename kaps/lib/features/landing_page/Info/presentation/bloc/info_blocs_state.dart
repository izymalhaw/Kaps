part of 'info_blocs_bloc.dart';

@immutable
sealed class InfoBlocsState {}

final class InfoBlocsInitial extends InfoBlocsState {}

final class History extends InfoBlocsState {
  final List<dynamic> history;
  History(this.history);
}
