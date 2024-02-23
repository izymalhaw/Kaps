import 'dart:io';
import 'dart:typed_data';

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
    String? status,
  }) : super(
          fid: fid,
          firstName: firstName,
          lastName: lastName,
          phone: phone,
          password: password,
          location: location,
          profilePicture: profilePicture,
          scannedDocuments: scannedDocuments,
          status: status,
        );

  factory FarmerModels.fromJson(Map<String, dynamic> json) {
    return FarmerModels(
      fid: json['_id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      phone: json['phone'],
      password: json['password'],
      location: json['location'],
      profilePicture: json['profilePicture'],
      scannedDocuments: json['scanneDocuments'],
      status: json['user_status'],
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
      'status': status,
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

  Map<String, dynamic> toJson() {
    return {
      'firstName': FullName,
    };
  }
}
