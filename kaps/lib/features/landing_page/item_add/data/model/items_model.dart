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
    String? productCategory,
    String? unit,
    String? quantity,
  }) : super(
          phoneNumber: phoneNumber,
          productName: productName,
          productDescription: productDescription,
          price: price,
          location: location,
          productImage: productImage,
          productCategory: productCategory,
          unit: unit,
          quantity: quantity,
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
        'quantity': quantity,
        'category': productCategory,
        'unit': unit,
        'url': "",
      });
      return formData;
    } catch (e) {
      throw Exception('Failed to create FormData: $e');
    }
  }
}
