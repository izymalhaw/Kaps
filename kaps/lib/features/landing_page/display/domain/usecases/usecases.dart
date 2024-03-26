import 'dart:io';
import 'dart:typed_data';

import 'package:kaps/core/resources/data_state.dart';
import 'package:kaps/core/usecase/usecase.dart';
import 'package:kaps/features/landing_page/display/domain/entites/entities.dart';
import 'package:kaps/features/landing_page/display/domain/repositories/repositories.dart';


class GetDataUseCase
    implements UseCase<DataState<List<ProductEntity>>, String> {
  final domainRepositories _domainRepositories;
  GetDataUseCase(this._domainRepositories);
  @override
  Future<DataState<List<ProductEntity>>> call({String? params}) {
    return _domainRepositories.getproductData();
  }
  Future<DataState<ProductEntity>> singleProductFetch(String id) {
    return _domainRepositories.getSingleproductData(id);
  }

}
