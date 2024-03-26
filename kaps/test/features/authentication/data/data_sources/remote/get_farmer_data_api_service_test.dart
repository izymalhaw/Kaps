import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kaps/features/authentication/data/data_sources/remote/get_farmer_data_api_service.dart';

void main() {
  group('GetFarmerDataApiService', () {
    late GetFarmerDataApiService apiService;

    setUp(() {
      Dio dio = Dio();
      apiService = GetFarmerDataApiService(dio);
    });

    test('throws exception if farmer id is invalid', () async {
      expect(() => apiService.getFarmerData('invalid_id'),
          throwsA(isA<Exception>()));
    });

    test('returns empty farmer data if farmer not found', () async {
      final result = await apiService.getFarmerData('unknown_id');
      expect(result, isEmpty);
    });

    test('returns correct farmer data for valid id', () async {
      final result = await apiService.getFarmerData('123');
      expect(result, isNotEmpty);
      expect(result, '123');
    });
  });
}
