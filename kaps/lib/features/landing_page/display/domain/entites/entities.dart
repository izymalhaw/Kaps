import 'dart:io';
import 'dart:typed_data';

import 'package:equatable/equatable.dart';

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

  ProductEntity({
    required this.id,
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
    this.unit
  });

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
