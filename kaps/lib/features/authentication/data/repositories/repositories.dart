import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:dio/dio.dart';
import 'package:kaps/core/resources/data_state.dart';
import 'package:kaps/features/authentication/data/data_sources/remote/get_farmer_data_api_service.dart';
import 'package:kaps/features/authentication/data/model/farmer_model.dart';
import 'package:kaps/features/authentication/domain/entites/farmer_entity.dart';
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

  @override
  Future<DataState<List<FarmerModels>>> SignIn(
      String PhoneNumber, String Password) async {
    try {
      final Res = await _getFarmerDataApiService.SignIn(PhoneNumber, Password);

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
      print("flag#2");
      return DataFailed(error: e);
    }
  }

  @override
  Future<DataState<int>> SignUp(
    String FullName,
    String PhoneNumber,
    String Location,
    File? ProfileImage,
    Uint8List? fileBytes,
    String? fileName,
    String Password,
  ) async {
    try {
      final Res = await _getFarmerDataApiService.signUp(FullName, PhoneNumber,
          Location, ProfileImage, fileBytes, fileName, Password);

      if (Res == HttpStatus.ok) {
        return DataSuccess(data: Res);
      } else {
        return DataFailed(
            error: DioError(
          requestOptions: RequestOptions(
            path: '',
          ),
        ));
      }
    } on DioError catch (e) {
      print("flag#2");
      return DataFailed(error: e);
    }
  }
}
