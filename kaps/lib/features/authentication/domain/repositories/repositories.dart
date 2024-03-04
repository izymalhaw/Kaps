import 'dart:io';
import 'dart:typed_data';

import 'package:kaps/core/resources/data_state.dart';

import '../entites/farmer_entity.dart';

abstract class domainRepositories {
  domainRepositories(Object object);

  Future<DataState<List<FarmersEntity>>> getFarmerData(String id);
  Future<DataState<List<FarmersEntity>>> SignIn(
      String PhoneNumber, String Password);
  Future<DataState<int>> SignUp(
    final String FullName,
    final String PhoneNumber,
    final String Location,
    final File? ProfileImage,
    final Uint8List? fileBytes,
    final String? fileName,
    final String Password,
  );
}
