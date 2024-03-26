part of 'display_bloc.dart';

@immutable
sealed class DisplayState {}

final class DisplayInitial extends DisplayState {
}

final class DisplayLoadedState extends DisplayState {
  List<dynamic> products;
  DisplayLoadedState(this.products);
}
final class DisplayError extends DisplayState{}

final class cartDataLoadedState extends DisplayState {
  List<dynamic> datas;
  cartDataLoadedState (this.datas);
}