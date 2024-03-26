import 'dart:convert';

class Products {
    List<Product> product;

    Products({
        required this.product,
    });

    factory Products.fromRawJson(String str) => Products.fromJsonList(json.decode(str));

    factory Products.fromJsonList(List<dynamic> list) {
        return Products(
            product: list.map((item) => Product.fromJson(item)).toList(),
        );
    }
    
}

class Product {
    String id;
    String productname;
    int productprice;
    String productlocation;
    String agentphone;
    String productdescription;
    int quantity;
    String file;
    String approvalStatus;
    DateTime createdAt;
    DateTime updatedAt;
    int v;
    String adminApproval;
    String? unit;
    String? url;

    Product({
        required this.id,
        required this.productname,
        required this.productprice,
        required this.productlocation,
        required this.agentphone,
        required this.productdescription,
        required this.quantity,
        required this.file,
        required this.approvalStatus,
        required this.createdAt,
        required this.updatedAt,
        required this.v,
        required this.adminApproval,
        this.unit,
        this.url,
    });

    factory Product.fromRawJson(String str) => Product.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["_id"],
        productname: json["productname"],
        productprice: json["productprice"],
        productlocation: json["productlocation"],
        agentphone: json["agentphone"],
        productdescription: json["productdescription"],
        quantity: json["quantity"],
        file: json["file"],
        approvalStatus: json["approvalStatus"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        adminApproval: json["adminApproval"],
        unit: json["unit"],
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "productname": productname,
        "productprice": productprice,
        "productlocation": productlocation,
        "agentphone": agentphone,
        "productdescription": productdescription,
        "quantity": quantity,
        "file": file,
        "approvalStatus": approvalStatus,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
        "adminApproval": adminApproval,
        "unit": unit,
        "url": url,
    };
}
