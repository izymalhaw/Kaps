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
    Img img;
    String id;
    String name;
    String phone;
    String email;
    String password;
    bool restriction;
    List<FileElement> files;
    String location;
    String role;
    List<dynamic> products;
    DateTime createdAt;
    DateTime updatedAt;
    int v;

    Agent({
        required this.img,
        required this.id,
        required this.name,
        required this.phone,
        required this.email,
        required this.password,
        required this.restriction,
        required this.files,
        required this.location,
        required this.role,
        required this.products,
        required this.createdAt,
        required this.updatedAt,
        required this.v,
    });

    factory Agent.fromRawJson(String str) => Agent.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Agent.fromJson(Map<String, dynamic> json) => Agent(
        img: Img.fromJson(json["img"]),
        id: json["_id"],
        name: json["name"],
        phone: json["phone"],
        email: json["email"],
        password: json["password"],
        restriction: json["restriction"],
        files: List<FileElement>.from(json["files"].map((x) => FileElement.fromJson(x))),
        location: json["location"],
        role: json["role"],
        products: List<dynamic>.from(json["products"].map((x) => x)),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "img": img.toJson(),
        "_id": id,
        "name": name,
        "phone": phone,
        "email": email,
        "password": password,
        "restriction": restriction,
        "files": List<dynamic>.from(files.map((x) => x.toJson())),
        "location": location,
        "role": role,
        "products": List<dynamic>.from(products.map((x) => x)),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
    };
}

class FileElement {
    String publicId;
    String url;
    String id;

    FileElement({
        required this.publicId,
        required this.url,
        required this.id,
    });

    factory FileElement.fromRawJson(String str) => FileElement.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory FileElement.fromJson(Map<String, dynamic> json) => FileElement(
        publicId: json["public_id"],
        url: json["url"],
        id: json["_id"],
    );

    Map<String, dynamic> toJson() => {
        "public_id": publicId,
        "url": url,
        "_id": id,
    };
}

class Img {
    String publicId;
    String url;

    Img({
        required this.publicId,
        required this.url,
    });

    factory Img.fromRawJson(String str) => Img.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Img.fromJson(Map<String, dynamic> json) => Img(
        publicId: json["public_id"],
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "public_id": publicId,
        "url": url,
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
