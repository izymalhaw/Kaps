import 'dart:io';

import 'package:kaps/core/resources/data_state.dart';
import 'package:kaps/core/usecase/usecase.dart';
import 'package:kaps/features/landing_page/item_add/domain/entities/items_entity.dart';
import 'package:kaps/features/landing_page/item_add/domain/repositories/repositories.dart';

class AddItemsUseCase implements UseCase<DataState<List<ItemsEntity>>, String> {
  final domainRepositories _domainRepositories;
  AddItemsUseCase(this._domainRepositories);
  @override
  Future<DataState<List<ItemsEntity>>> call({String? params}) {
    throw UnimplementedError();
  }

  Future<DataState<int>> AddItems(
    final String PhoneNumber,
    final String Location,
    final File ProductImage,
    final String? ProductName,
    final String? ProductDescription,
    final String? price,
  ) {
    return _domainRepositories.AddItems(
      PhoneNumber,
      Location,
      ProductImage,
      ProductName,
      ProductDescription,
      price,
    );
  }

  Future<DataState<List<dynamic>>> getAllItem() {
    return _domainRepositories.getAllItem();
  }
}
