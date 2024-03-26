import 'dart:convert';

class Products {
  List<Datum> data;
  int totalPages;

  Products({
    required this.data,
    required this.totalPages,
  });

  factory Products.fromRawJson(String str) =>
      Products.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Products.fromJson(Map<String, dynamic> json) => Products(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        totalPages: json["totalPages"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "totalPages": totalPages,
      };
}

class Datum {
  String id;
  String productname;
  double productprice;
  String productlocation;
  String agentphone;
  String productdescription;
  double? quantity;
  String? unit;
  String? url;
  String file;
  String? approvalStatus;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  String? adminApproval;
  String? catagory;

  Datum({
    required this.id,
    required this.productname,
    required this.productprice,
    required this.productlocation,
    required this.agentphone,
    required this.productdescription,
    this.quantity,
    this.unit,
    this.url,
    required this.file,
    required this.approvalStatus,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    this.adminApproval,
    this.catagory,
  });

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        productname: json["productname"],
        productprice: json["productprice"]?.toDouble(),
        productlocation: json["productlocation"],
        agentphone: json["agentphone"],
        productdescription: json["productdescription"],
        quantity: json["quantity"]?.toDouble(),
        unit: json["unit"],
        url: json["url"],
        file: json["file"],
        approvalStatus: json["approvalStatus"]!,
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        adminApproval: json["adminApproval"],
        catagory: json["catagory"],
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
        "catagory": catagory,
      };
}
