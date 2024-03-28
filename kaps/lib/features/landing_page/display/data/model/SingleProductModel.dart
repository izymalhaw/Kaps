import 'dart:convert';

class Singleproduct {
    String id;
    String productname;
    int productprice;
    String productlocation;
    String agentphone;
    String productdescription;
    int quantity;
    String unit;
    String url;
    FileClass file;
    String approvalStatus;
    DateTime createdAt;
    DateTime updatedAt;
    int v;
    String adminApproval;

    Singleproduct({
        required this.id,
        required this.productname,
        required this.productprice,
        required this.productlocation,
        required this.agentphone,
        required this.productdescription,
        required this.quantity,
        required this.unit,
        required this.url,
        required this.file,
        required this.approvalStatus,
        required this.createdAt,
        required this.updatedAt,
        required this.v,
        required this.adminApproval,
    });

    factory Singleproduct.fromRawJson(String str) => Singleproduct.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Singleproduct.fromJson(Map<String, dynamic> json) => Singleproduct(
        id: json["_id"],
        productname: json["productname"],
        productprice: json["productprice"],
        productlocation: json["productlocation"],
        agentphone: json["agentphone"],
        productdescription: json["productdescription"],
        quantity: json["quantity"],
        unit: json["unit"],
        url: json["url"],
        file: FileClass.fromJson(json["file"]),
        approvalStatus: json["approvalStatus"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        adminApproval: json["adminApproval"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "productname": productname,
        "productprice": productprice,
        "productlocation": productlocation,
        "agentphone": agentphone,
        "productdescription": productdescription,
        "quantity": quantity,
        "unit": unit,
        "url": url,
        "file": file,
        "approvalStatus": approvalStatus,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
        "adminApproval": adminApproval,
    };
}

class FileClass {
  String publicId;
  String url;

  FileClass({
    required this.publicId,
    required this.url,
  });

  factory FileClass.fromRawJson(String str) =>
      FileClass.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory FileClass.fromJson(Map<String, dynamic> json) => FileClass(
        publicId: json["public_id"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "public_id": publicId,
        "url": url,
      };
}
