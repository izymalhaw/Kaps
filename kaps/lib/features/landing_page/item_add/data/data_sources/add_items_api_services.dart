import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:kaps/core/constants/network_constatnts.dart';
import 'package:kaps/features/landing_page/item_add/data/model/items_model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'add_items_api_services.g.dart';

@RestApi(baseUrl: KapsBaseUrl)
abstract class AddItemsApiService {
  factory AddItemsApiService(Dio dio) = _AddItemsApiService;

  @POST("/product/postitem")
  Future<int> AddItems(String PhoneNumber, String Location, File ProductImage,
      String? price, String? productName, String? productDescription) async {
    throw UnimplementedError();
  }

  @GET("adminitem/getallItems")
  Future<List<dynamic>> GetAllItems() {
    throw UnimplementedError();
  }
}
