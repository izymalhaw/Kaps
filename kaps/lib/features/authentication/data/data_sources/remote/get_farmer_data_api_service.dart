import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:kaps/core/constants/network_constatnts.dart';
import 'package:retrofit/retrofit.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/farmer_model.dart';

part 'get_farmer_data_api_service.g.dart';

@RestApi(baseUrl: KapsBaseUrl)
abstract class GetFarmerDataApiService {
  factory GetFarmerDataApiService(Dio dio) = _GetFarmerDataApiService;

  @GET("/farmers/")
  Future<HttpResponse<List<FarmerModels>>> getFarmerData(
      @Query('id') String id) async {
    throw UnimplementedError();
  }

  @POST("/agent/signin")
  Future<dynamic> SignIn(String PhoneNumber, String Password) async {
    throw UnimplementedError();
  }

  @POST("/agent/signup")
  Future<int> signUp(
    String FullName,
    String PhoneNumber,
    String Location,
    File? ProfileImage,
    Uint8List? fileBytes,
    String? fileName,
    String password,
  ) async {
    throw UnimplementedError();
  }
}
