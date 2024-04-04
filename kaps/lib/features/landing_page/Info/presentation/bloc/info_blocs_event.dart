part of 'info_blocs_bloc.dart';

@immutable
sealed class InfoBlocsEvent {}

class FetchHistory extends InfoBlocsEvent {
  final String Phone;
  FetchHistory(this.Phone);
}

class updateAccountEvent extends InfoBlocsEvent {
  final String accountName;
  final String accountNumber;
  updateAccountEvent(this.accountName, this.accountNumber);
}
