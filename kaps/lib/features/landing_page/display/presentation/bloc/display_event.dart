part of 'display_bloc.dart';

@immutable
sealed class DisplayEvent {}

class DisplayInitialEvent extends DisplayEvent {}

class cartDataEvent extends DisplayEvent {
  List<String> ids;
  cartDataEvent(this.ids);
}
