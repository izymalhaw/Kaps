import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:kaps/features/authentication/domain/entites/farmer_entity.dart';

class FarmerModels {
  String message;
  String token;
  Agent agent;

  FarmerModels({
    required this.message,
    required this.token,
    required this.agent,
  });

  factory FarmerModels.fromRawJson(String str) =>
      FarmerModels.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory FarmerModels.fromJson(Map<String, dynamic> json) => FarmerModels(
        message: json["message"],
        token: json["token"],
        agent: Agent.fromJson(json["agent"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "token": token,
        "agent": agent.toJson(),
      };
}

class Agent {
  String? role;
  String? id;
  String name;
  String phone;
  String email;
  String password;
  bool? restriction;
  String img;
  String location;
  String files;
  List<dynamic>? products;
  int? v;

  Agent({
    this.role,
    this.id,
    required this.name,
    required this.phone,
    required this.email,
    required this.password,
    this.restriction,
    required this.img,
    required this.location,
    required this.files,
    required this.products,
    this.v,
  });

  factory Agent.fromRawJson(String str) => Agent.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Agent.fromJson(Map<String, dynamic> json) => Agent(
        role: json["role"],
        id: json["_id"],
        name: json["name"],
        phone: json["phone"],
        email: json["email"],
        password: json["password"],
        restriction: json["restriction"],
        img: json["img"],
        location: json["location"],
        files: json["files"],
        products: List<dynamic>.from(json["products"].map((x) => x)),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "role": role,
        "_id": id,
        "name": name,
        "phone": phone,
        "email": email,
        "password": password,
        "restriction": restriction,
        "img": img,
        "location": location,
        "files": files,
        "__v": v,
      };
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
      throw Exception('Failed to create FormData: $e');
    }
  }
}
