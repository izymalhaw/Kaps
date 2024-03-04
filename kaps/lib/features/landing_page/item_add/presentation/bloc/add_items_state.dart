part of 'add_items_bloc.dart';

@immutable
sealed class AddItemsState {}

final class AddItemsInitial extends AddItemsState {}

final class ItemAdded extends AddItemsState {}

final class ImagePickerState extends AddItemsState {
  File? image;
  ImagePickerState(this.image);
}

final class ImageError extends AddItemsState {}

final class getAllItemsState extends AddItemsState {
  List<dynamic> data;
  getAllItemsState(this.data);
}

final class loadingState extends AddItemsState {}

final class netError extends AddItemsState{}
