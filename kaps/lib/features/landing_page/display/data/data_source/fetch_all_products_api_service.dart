import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:kaps/core/constants/network_constatnts.dart';
import 'package:kaps/features/landing_page/display/data/model/SingleProductModel.dart';
import 'package:kaps/features/landing_page/display/data/model/models.dart';
import 'package:retrofit/retrofit.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'fetch_all_products_api_service.g.dart';

@RestApi(baseUrl: KapsBaseUrl)
abstract class FetchAllProducts {
  factory FetchAllProducts(Dio dio) = _FetchAllProducts;

  @GET("/product/getallItems")
  Future<HttpResponse<List<Datum>>> FetchProducts() async {
    throw UnimplementedError();
  }

  @GET("/wearhouse/products/")
  Future<HttpResponse<Singleproduct>> FetchAProduct(String id) async {
    throw UnimplementedError();
  }

  @POST("/cart/add-to-cart")
  Future<HttpResponse<CartResponse>> addToCart() async{
    throw UnimplementedError();
  }
  @POST("/payment/pay")
  Future<HttpResponse<PaymentResponse>> PayCart(String OrderId,double price) async{
    throw UnimplementedError();
  }
}
