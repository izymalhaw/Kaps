import 'package:flutter_test/flutter_test.dart';
import 'package:kaps/features/authentication/data/model/farmer_model.dart';

void main() {
  test('toJson handles empty farmer', () {
    final farmer = FarmerModels();

    final expected = {};

    expect(farmer.toJson(), expected);
  });

  test('toJson handles farmer with only required fields', () {
    final farmer =
        FarmerModels(firstName: 'John', lastName: 'Doe', phone: '123-456-7890');

    final expected = {
      'firstName': 'John',
      'lastName': 'Doe',
      'phone': '123-456-7890'
    };

    expect(farmer.toJson(), expected);
  });

  test('toJson handles invalid phone number', () {
    final farmer =
        FarmerModels(firstName: 'John', lastName: 'Doe', phone: 'invalid');

    expect(() => farmer.toJson(), throwsA(isA<FormatException>()));
  });
}


