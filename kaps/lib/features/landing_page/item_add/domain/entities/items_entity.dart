import 'dart:io';
import 'dart:typed_data';

import 'package:equatable/equatable.dart';

class ItemsEntity extends Equatable {
  String? phoneNumber;
  String? productName;
  String? productDescription;
  String? price;
  String? location;
  File? productImage;

  ItemsEntity({
    required this.phoneNumber,
    required this.productName,
    required this.productDescription,
    required this.price,
    required this.location,
    required this.productImage,
  });

  @override
  List<Object?> get props => [
        phoneNumber,
        productName,
        productDescription,
        price,
        location,
        productImage,
      ];
}
