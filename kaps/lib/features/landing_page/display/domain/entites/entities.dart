import 'dart:io';
import 'dart:typed_data';

import 'package:equatable/equatable.dart';
import 'package:kaps/features/landing_page/display/data/model/models.dart';

class ProductEntity extends Equatable {
  String id;
  String productname;
  double productprice;
  String productlocation;
  String agentphone;
  String productdescription;
  double quantity;
  String? unit;
  String? url;
  String file;
  String? approvalStatus;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  String? adminApproval;
  String? catagory;

  ProductEntity(
      {required this.id,
      required this.productname,
      required this.productprice,
      required this.productlocation,
      required this.agentphone,
      required this.productdescription,
      required this.quantity,
      required this.file,
      required this.createdAt,
      required this.updatedAt,
      required this.v,
      this.url,
      this.adminApproval,
      this.catagory,
      this.unit});

  @override
  List<Object?> get props => [
        id,
        productname,
        productprice,
        productlocation,
        agentphone,
        productdescription,
        quantity,
        file,
        createdAt,
        updatedAt,
        v,
        url,
        adminApproval,
        catagory,
        unit
      ];
}

class cartEntity extends Equatable {
  String message;
/*   Payer payer;
  Price price; */
  int orderId;
  String status;

  cartEntity({
    required this.message,
/*     required this.payer,
    required this.price, */
    required this.orderId,
    required this.status,
  });

  @override
  List<Object?> get props => [
        message,
/*         payer,
        price, */
        orderId,
        status,
      ];
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
}
