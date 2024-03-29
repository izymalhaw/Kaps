import 'dart:convert';

class Products {
  List<Datum> data;

  Products({
    required this.data,
  });

  factory Products.fromRawJson(String str) =>
      Products.fromJson(json.decode(str));

  /*factory Products.fromJson(Map<String, dynamic> json) => Products(
        data: List<Datum>.from(json.map((x) => Datum.fromJson(x))),
      );*/

  factory Products.fromJson(List<dynamic> json) => Products(
        data: List<Datum>.from(json.map((x) => Datum.fromJson(x))),
      );
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
  FileClass file;
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
        file: FileClass.fromJson(json["file"]),
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

class AddToCart {
  String firstName;
  String lastName;
  String phoneNumber;
  String email;
  String address;
  List<Item> items;

  AddToCart({
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.email,
    required this.address,
    required this.items,
  });

  Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "lastName": lastName,
        "phoneNumber": phoneNumber,
        "email": email,
        "address": address,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class Item {
  String productId;
  String quantity;

  Item({
    required this.productId,
    required this.quantity,
  });

  factory Item.fromRawJson(String str) => Item.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        productId: json["productId"],
        quantity: json["quantity"],
      );

  Map<String, dynamic> toJson() => {
        "productId": productId,
        "quantity": quantity,
      };
}

class CartResponse {
  String message;
  List<Order> orders;
  Payer payer;
  Price price;
  int orderId;
  String status;

  CartResponse({
    required this.message,
    required this.orders,
    required this.payer,
    required this.price,
    required this.orderId,
    required this.status,
  });

  factory CartResponse.fromRawJson(String str) =>
      CartResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CartResponse.fromJson(Map<String, dynamic> json) => CartResponse(
        message: json["message"],
        orders: List<Order>.from(json["orders"].map((x) => Order.fromJson(x))),
        payer: Payer.fromJson(json["payer"]),
        price: Price.fromJson(json["price"]),
        orderId: json["orderID"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "orders": List<dynamic>.from(orders.map((x) => x.toJson())),
        "payer": payer.toJson(),
        "price": price.toJson(),
        "orderID": orderId,
        "status": status,
      };
}

class Order {
  String productName;
  String quantity;
  String unit;
  double price;
  String location;
  double itemPrice;
  double tax;
  double serviceCharge;
  double totalPrice;

  Order({
    required this.productName,
    required this.quantity,
    required this.unit,
    required this.price,
    required this.location,
    required this.itemPrice,
    required this.tax,
    required this.serviceCharge,
    required this.totalPrice,
  });

  factory Order.fromRawJson(String str) => Order.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        productName: json["productName"],
        quantity: json["quantity"],
        unit: json["unit"],
        price: json["price"]?.toDouble(),
        location: json["location"],
        itemPrice: json["itemPrice"]?.toDouble(),
        tax: json["tax"]?.toDouble(),
        serviceCharge: json["serviceCharge"]?.toDouble(),
        totalPrice: json["totalPrice"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "productName": productName,
        "quantity": quantity,
        "unit": unit,
        "price": price,
        "location": location,
        "itemPrice": itemPrice,
        "tax": tax,
        "serviceCharge": serviceCharge,
        "totalPrice": totalPrice,
      };
}

class Payer {
  String firstName;
  String lastName;
  String phoneNumber;
  String email;
  String address;

  Payer({
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.email,
    required this.address,
  });

  factory Payer.fromRawJson(String str) => Payer.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Payer.fromJson(Map<String, dynamic> json) => Payer(
        firstName: json["firstName"],
        lastName: json["lastName"],
        phoneNumber: json["phoneNumber"],
        email: json["email"],
        address: json["address"],
      );

  Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "lastName": lastName,
        "phoneNumber": phoneNumber,
        "email": email,
        "address": address,
      };
}

class Price {
  double itemPrice;
  double tax;
  double serviceCharge;
  double totalPrice;
  double deliveryFee;

  Price({
    required this.itemPrice,
    required this.tax,
    required this.serviceCharge,
    required this.totalPrice,
    required this.deliveryFee,
  });

  factory Price.fromRawJson(String str) => Price.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Price.fromJson(Map<String, dynamic> json) => Price(
        itemPrice: json["itemPrice"]?.toDouble(),
        tax: json["tax"]?.toDouble(),
        serviceCharge: json["serviceCharge"]?.toDouble(),
        totalPrice: json["totalPrice"]?.toDouble(),
        deliveryFee: json["deliveryFee"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "itemPrice": itemPrice,
        "tax": tax,
        "serviceCharge": serviceCharge,
        "totalPrice": totalPrice,
        "deliveryFee": deliveryFee,
      };
}


class PaymentResponse {
    PaymentResponseData data;

    PaymentResponse({
        required this.data,
    });

    factory PaymentResponse.fromRawJson(String str) => PaymentResponse.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory PaymentResponse.fromJson(Map<String, dynamic> json) => PaymentResponse(
        data: PaymentResponseData.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
    };
}

class PaymentResponseData {
    int code;
    String newCode;
    dynamic channel;
    DataData data;
    String message;
    int dateTime;
    dynamic path;
    ErrorDetails errorDetails;
    ErrorDetails extraData;
    dynamic extData;

    PaymentResponseData({
        required this.code,
        required this.newCode,
        required this.channel,
        required this.data,
        required this.message,
        required this.dateTime,
        required this.path,
        required this.errorDetails,
        required this.extraData,
        required this.extData,
    });

    factory PaymentResponseData.fromRawJson(String str) => PaymentResponseData.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory PaymentResponseData.fromJson(Map<String, dynamic> json) => PaymentResponseData(
        code: json["code"],
        newCode: json["newCode"],
        channel: json["channel"],
        data: DataData.fromJson(json["data"]),
        message: json["message"],
        dateTime: json["dateTime"],
        path: json["path"],
        errorDetails: ErrorDetails.fromJson(json["errorDetails"]),
        extraData: ErrorDetails.fromJson(json["extraData"]),
        extData: json["extData"],
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "newCode": newCode,
        "channel": channel,
        "data": data.toJson(),
        "message": message,
        "dateTime": dateTime,
        "path": path,
        "errorDetails": errorDetails.toJson(),
        "extraData": extraData.toJson(),
        "extData": extData,
    };
}

class DataData {
    String toPayUrl;

    DataData({
        required this.toPayUrl,
    });

    factory DataData.fromRawJson(String str) => DataData.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory DataData.fromJson(Map<String, dynamic> json) => DataData(
        toPayUrl: json["toPayUrl"],
    );

    Map<String, dynamic> toJson() => {
        "toPayUrl": toPayUrl,
    };
}

class ErrorDetails {
    ErrorDetails();

    factory ErrorDetails.fromRawJson(String str) => ErrorDetails.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ErrorDetails.fromJson(Map<String, dynamic> json) => ErrorDetails(
    );

    Map<String, dynamic> toJson() => {
    };
}
