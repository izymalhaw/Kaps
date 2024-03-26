import 'dart:io';

import 'package:dio/dio.dart';
import 'package:kaps/core/resources/data_state.dart';
import 'package:kaps/features/landing_page/display/data/data_source/fetch_all_products_api_service.dart';
import 'package:kaps/features/landing_page/display/domain/entites/entities.dart';
import 'package:kaps/features/landing_page/display/domain/repositories/repositories.dart';

class repositoriesImpl implements domainRepositories {
  final FetchAllProducts _fetchAllProducts;
  repositoriesImpl(this._fetchAllProducts);

  @override
  Future<DataState<List<ProductEntity>>> getproductData() async {
    try {
      final Res = await _fetchAllProducts.FetchProducts();

      if (Res.response.statusCode == HttpStatus.ok) {
        return DataSuccess(
            data: Res.data
                .map((product) => ProductEntity(
                      id: product.id,
                      productname: product.productname.toString(),
                      productprice: product.productprice.toDouble(),
                      productlocation: product.productlocation,
                      agentphone: product.agentphone.toString(),
                      productdescription: product.productdescription,
                      file: product.file,
                      createdAt: product.createdAt,
                      updatedAt: product.updatedAt,
                      v: 0,
                      quantity: product.quantity ?? 0,
                      unit: product.unit ?? "",
                    ))
                .toList());
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
  Future<DataState<ProductEntity>> getSingleproductData(String id) async {
    try {
      final Res = await _fetchAllProducts.FetchAProduct(id);

      if (Res.response.statusCode == HttpStatus.ok) {
        return DataSuccess(
            data: ProductEntity(
                id: Res.data.id,
                productname: Res.data.productname,
                productprice: Res.data.productprice.toDouble(),
                productlocation: Res.data.productlocation,
                agentphone: Res.data.agentphone,
                productdescription: Res.data.productdescription,
                file: Res.data.file,
                createdAt: Res.data.createdAt,
                updatedAt: Res.data.updatedAt,
                v: Res.data.v,
                quantity: Res.data.quantity.toDouble(),
                unit: Res.data.unit));
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
