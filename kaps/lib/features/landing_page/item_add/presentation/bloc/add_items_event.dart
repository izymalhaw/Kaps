part of 'add_items_bloc.dart';

@immutable
sealed class AddItemsEvent {}

class Add_items_event extends AddItemsEvent {
  final String PhoneNumber;
  final String Location;
  final File ProductImage;
  final String? ProductName;
  final String? ProductDescription;
  final String? price;
  Add_items_event(
    this.PhoneNumber,
    this.Location,
    this.ProductImage,
    this.ProductName,
    this.ProductDescription,
    this.price,
  );
}

class ImagePickerEvent extends AddItemsEvent {}

class getAllItems extends AddItemsEvent {}
