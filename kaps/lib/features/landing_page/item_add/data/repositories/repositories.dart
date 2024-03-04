import 'dart:io';

import 'package:dio/dio.dart';
import 'package:kaps/core/resources/data_state.dart';
import 'package:kaps/features/landing_page/item_add/data/data_sources/add_items_api_services.dart';
import 'package:kaps/features/landing_page/item_add/domain/repositories/repositories.dart';

class repositoriesImpl implements domainRepositories {
  final AddItemsApiService _addItemsApiService;
  repositoriesImpl(this._addItemsApiService);

  @override
  Future<DataState<int>> AddItems(
    final String PhoneNumber,
    final String Location,
    final File ProductImage,
    final String? ProductName,
    final String? ProductDescription,
    final String? price,
  ) async {
    try {
      final Res = await _addItemsApiService.AddItems(
        PhoneNumber,
        Location,
        ProductImage,
        price,
        ProductName,
        ProductDescription,
      );

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

  Future<DataState<List<dynamic>>> getAllItem() async {
    try {
      List<dynamic> res = await _addItemsApiService.GetAllItems();
      if (res is List) {
        return DataSuccess(data: res);
      } else {
        return DataFailed(
            error: DioError(
          requestOptions: RequestOptions(
            path: '',
          ),
        ));
      }
    } on DioError catch (e) {
      return DataFailed(error: e);
    }
  }
}
