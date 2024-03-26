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
  final String? productCategory;
  final String? unit;
  final String? quantity;
  Add_items_event(
    this.PhoneNumber,
    this.Location,
    this.ProductImage,
    this.ProductName,
    this.ProductDescription,
    this.price,
    this.productCategory,
    this.unit,
    this.quantity,
  );
}

class ImagePickerEvent extends AddItemsEvent {}

class getAllItems extends AddItemsEvent {}
