import 'dart:io';
import 'dart:typed_data';

import 'package:equatable/equatable.dart';

class FarmersEntity extends Equatable {
  String? fid;
  String? firstName;
  String? lastName;
  String? phone;
  String? password;
  String? location;
  String? profilePicture;
  String? scannedDocuments;

  FarmersEntity({
    required this.fid,
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.password,
    required this.location,
    required this.profilePicture,
    required this.scannedDocuments,
  });

  @override
  List<Object?> get props => [
        fid,
        firstName,
        lastName,
        phone,
        password,
        location,
        profilePicture,
        scannedDocuments,
      ];
}

class FarmersEntitySend extends Equatable {
  final String? FullName;
  final String? PhoneNumber;
  final String? Location;
  final File? ProfileImage;
  final Uint8List? fileBytes;
  final String? fileName;
  final String? Password;

  FarmersEntitySend({
    required this.FullName,
    required this.PhoneNumber,
    required this.Location,
    required this.ProfileImage,
    required this.fileBytes,
    required this.fileName,
    required this.Password,
    String? location,
  });

  @override
  List<Object?> get props => [
        FullName,
        PhoneNumber,
        Location,
        ProfileImage,
        fileBytes,
        fileName,
        Password,
      ];
}
