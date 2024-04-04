import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:kaps/core/constants/network_constatnts.dart';
import 'package:kaps/features/landing_page/Info/data/model/models.dart';
import 'package:retrofit/retrofit.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'info_data_api_services.g.dart';

@RestApi(baseUrl: KapsBaseUrl)
abstract class infoDataApiService {
  factory infoDataApiService(Dio dio) = _infoDataApiService;

  @GET("/product/getitemsbyphone/")
  Future<List<dynamic>> getItemsHistory(String PhoneNumber) async {
    throw UnimplementedError();
  }

  @PUT("/agent/update/")
  Future<UpdateAccount> UpdateAcc(String Id, String accBank, String accNumber) async {
    throw UnimplementedError();
  }
}
