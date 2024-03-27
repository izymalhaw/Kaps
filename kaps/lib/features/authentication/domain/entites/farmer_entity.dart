import 'dart:io';
import 'dart:typed_data';

import 'package:equatable/equatable.dart';

class FarmersEntity extends Equatable {
  String? role;
  String? id;
  String name;
  String phone;
  String email;
  String password;
  bool? restriction;
  String img;
  String location;
  List<dynamic>? products;
  int? v;

  FarmersEntity({
    this.role,
    this.id,
    required this.name,
    required this.phone,
    required this.email,
    required this.password,
    this.restriction,
    required this.img,
    required this.location,
    required this.products,
    this.v,
  });

  @override
  List<Object?> get props => [
        role,
        id,
        name,
        phone,
        email,
        password,
        restriction,
        img,
        location,
        products,
        v,
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
