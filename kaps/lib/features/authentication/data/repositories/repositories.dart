import 'dart:io';

import 'package:dio/dio.dart';
import 'package:kaps/core/resources/data_state.dart';
import 'package:kaps/features/authentication/data/data_sources/remote/get_farmer_data_api_service.dart';
import 'package:kaps/features/authentication/data/model/farmer_model.dart';
import 'package:kaps/features/authentication/domain/repositories/repositories.dart';
import 'package:retrofit/retrofit.dart';

class repositoriesImpl implements domainRepositories {
  final GetFarmerDataApiService _getFarmerDataApiService;
  repositoriesImpl(this._getFarmerDataApiService);

  @override
  Future<DataState<List<FarmerModels>>> getFarmerData(String id) async {
    try {
      final Res = await _getFarmerDataApiService.getFarmerData(id);

      if (Res.response.statusCode == HttpStatus.ok) {
        return DataSuccess(data: Res.data);
      } else {
        return DataFailed(
            error: DioError(
          error: Res.response.statusMessage,
          response: Res.response,
          requestOptions: Res.response.requestOptions,
        ));
      }
    } on DioError catch (e) {
      return DataFailed(error: e);
    }
  }
}
