import 'dart:io';
import 'dart:typed_data';

import 'package:kaps/core/resources/data_state.dart';
import 'package:kaps/features/landing_page/item_add/presentation/pages/AddItems.dart';

abstract class domainRepositories {
  domainRepositories(Object object);

  Future<DataState<int>> AddItems(
    final String PhoneNumber,
    final String Location,
    final File ProductImage,
    final String? ProductName,
    final String? ProductDescription,
    final String? price,
  );

  Future<DataState<List<dynamic>>> getAllItem();
}
