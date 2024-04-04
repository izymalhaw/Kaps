import 'dart:convert';

class UpdateAccount {
    Agent agent;

    UpdateAccount({
        required this.agent,
    });

    factory UpdateAccount.fromRawJson(String str) => UpdateAccount.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory UpdateAccount.fromJson(Map<String, dynamic> json) => UpdateAccount(
        agent: Agent.fromJson(json["agent"]),
    );

    Map<String, dynamic> toJson() => {
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
    List<dynamic> files;
    String location;
    String bankName;
    String accNumber;
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
        required this.bankName,
        required this.accNumber,
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
        files: List<dynamic>.from(json["files"].map((x) => x)),
        location: json["location"],
        bankName: json["bankName"],
        accNumber: json["accNumber"],
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
        "files": List<dynamic>.from(files.map((x) => x)),
        "location": location,
        "bankName": bankName,
        "accNumber": accNumber,
        "role": role,
        "products": List<dynamic>.from(products.map((x) => x)),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
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
