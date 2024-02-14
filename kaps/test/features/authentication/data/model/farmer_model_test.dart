import 'package:flutter_test/flutter_test.dart';
import 'package:kaps/features/authentication/data/model/farmer_model.dart';

void main() {
  test('toJson returns expected map', () {
    final farmer = FarmerModels(
      fid: '1',
      firstName: 'John',
      lastName: 'Doe',
      phone: '123-456-7890',
      password: 'password123',
      location: 'New York',
      profilePicture: 'profile.jpg',
      scannedDocuments: 'documents.pdf',
      status: 'active',
    );

    final expected = {
      'firstName': 'John',
      'lastName': 'Doe',
      'phone': '123-456-7890',
      'password': 'password123',
      'location': 'New York',
      'profilePicture': 'profile.jpg',
      'scanneDocuments': 'documents.pdf',
      'status': 'active',
    };

    expect(farmer.toJson(), expected);
  });

  test('toJson returns map with null values', () {
    final farmer = FarmerModels(
      fid: null,
      firstName: null,
      lastName: null,
      phone: null,
      password: null,
      location: null,
      profilePicture: null,
      scannedDocuments: null,
      status: null,
    );

    final expected = {
      'firstName': null,
      'lastName': null,
      'phone': null,
      'password': null,
      'location': null,
      'profilePicture': null,
      'scanneDocuments': null,
      'status': null,
    };

    expect(farmer.toJson(), expected);
  });
}
