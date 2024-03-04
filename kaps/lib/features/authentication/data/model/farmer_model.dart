import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:kaps/features/authentication/domain/entites/farmer_entity.dart';

class FarmerModels extends FarmersEntity {
  FarmerModels({
    String? fid,
    String? firstName,
    String? lastName,
    String? phone,
    String? password,
    String? location,
    String? profilePicture,
    String? scannedDocuments,

  }) : super(
          fid: fid,
          firstName: firstName,
          lastName: lastName,
          phone: phone,
          password: password,
          location: location,
          profilePicture: profilePicture,
          scannedDocuments: scannedDocuments,
        );

  factory FarmerModels.fromJson(Map<String, dynamic> json) {
    return FarmerModels(
      fid: json['_id'],
      firstName: json['name'],
      phone: json['phone'],
      location: json['location'],
      profilePicture: json['img'],
      scannedDocuments: json['file'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'phone': phone,
      'password': password,
      'location': location,
      'profilePicture': profilePicture,
      'scanneDocuments': scannedDocuments,
    };
  }
}

class FarmerModelsSend extends FarmersEntitySend {
  FarmerModelsSend({
    String? FullName,
    String? PhoneNumber,
    String? location,
    File? profilePicture,
    Uint8List? fileBytes,
    String? fileName,
    String? Password,
  }) : super(
          FullName: FullName,
          PhoneNumber: PhoneNumber,
          Location: location,
          ProfileImage: profilePicture,
          fileBytes: fileBytes,
          fileName: fileName,
          Password: Password,
        );

  Future<FormData> toJson() async {
    try {
      FormData formData = FormData.fromMap({
        'name': FullName,
        'phone': PhoneNumber,
        'location': Location,
        'files': MultipartFile.fromBytes(fileBytes!, filename: fileName!),
        'password': Password,
        'img': await MultipartFile.fromFile(ProfileImage!.path,
            filename: ProfileImage!.path.split('/').last),
        'email': "",
      });
      return formData;
    } catch (e) {
      // Handle or log the error as appropriate
      throw Exception('Failed to create FormData: $e');
    }
  }
}
