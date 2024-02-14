import 'package:equatable/equatable.dart';

class FarmersEntity extends Equatable {
  String? fid;
  String? firstName;
  String? lastName;
  String? phone;
  String? password;
  String? location;
  String? profilePicture;
  String? scannedDocuments;
  String? status;

  FarmersEntity({
    required this.fid,
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.password,
    required this.location,
    required this.profilePicture,
    required this.scannedDocuments,
    required this.status,
  });

  @override
  List<Object?> get props => [
        fid,
        firstName,
        lastName,
        phone,
        password,
        location,
        profilePicture,
        scannedDocuments,
        status
      ];
}
