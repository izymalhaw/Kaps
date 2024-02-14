import 'dart:io';

import 'package:dio/dio.dart';
import 'package:kaps/core/constants/network_constatnts.dart';
import 'package:retrofit/retrofit.dart';

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
}
