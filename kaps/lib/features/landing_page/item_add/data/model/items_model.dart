import 'dart:io';

import 'package:dio/dio.dart';
import 'package:kaps/features/landing_page/item_add/domain/entities/items_entity.dart';

class ItemsModels extends ItemsEntity {
  ItemsModels({
    String? phoneNumber,
    String? productName,
    String? productDescription,
    String? price,
    String? location,
    File? productImage,
  }) : super(
          phoneNumber: phoneNumber,
          productName: productName,
          productDescription: productDescription,
          price: price,
          location: location,
          productImage: productImage,
        );

  factory ItemsModels.fromJson(Map<String, dynamic> json) {
    return ItemsModels(
      productName: json[''],
    );
  }

  Future<FormData> toJson() async {
    try {
      FormData formData = FormData.fromMap({
        'agentphone': phoneNumber,
        'productlocation': location,
        'file': await MultipartFile.fromFile(productImage!.path,
            filename: productImage!.path.split('/').last),
        'productname': productName,
        'productdescription': productDescription,
        'productprice': price,
        'quantity': '10',
      });
      return formData;
    } catch (e) {
      // Handle or log the error as appropriate
      throw Exception('Failed to create FormData: $e');
    }
  }
}
