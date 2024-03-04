import 'dart:io';
import 'dart:typed_data';

import 'package:kaps/features/authentication/domain/entites/farmer_entity.dart';
import 'package:kaps/features/authentication/domain/repositories/repositories.dart';

import '../../../../core/resources/data_state.dart';
import '../../../../core/usecase/usecase.dart';

class GetFarmerDataUseCase
    implements UseCase<DataState<List<FarmersEntity>>, String> {
  final domainRepositories _domainRepositories;
  GetFarmerDataUseCase(this._domainRepositories);
  @override
  Future<DataState<List<FarmersEntity>>> call({String? params}) {
    return _domainRepositories.getFarmerData(params!);
  }

  Future<DataState<List<FarmersEntity>>> SignIn(
      String PhoneNumber, String Password) async {
    return _domainRepositories.SignIn(PhoneNumber, Password);
  }

  Future<DataState<int>> SignUp(
    final String FullName,
    final String PhoneNumber,
    final String Location,
    final File? ProfileImage,
    final Uint8List? fileBytes,
    final String? fileName,
    final String Password,
  ) {
    return _domainRepositories.SignUp(FullName, PhoneNumber, Location,
        ProfileImage, fileBytes, fileName, Password);
  }
}
