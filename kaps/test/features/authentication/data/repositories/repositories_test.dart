import 'package:flutter_test/flutter_test.dart';
import 'package:kaps/core/resources/data_state.dart';
import 'package:kaps/features/authentication/data/data_sources/remote/get_farmer_data_api_service.dart';
import 'package:kaps/features/authentication/data/repositories/repositories.dart';
import 'package:mockito/mockito.dart';

class MockGetFarmerDataApiService extends Mock
    implements GetFarmerDataApiService {}

void main() {
  late repositoriesImpl repository;
  late MockGetFarmerDataApiService mockService;

  setUp(() {
    mockService = MockGetFarmerDataApiService();
    repository = repositoriesImpl(mockService);
  });

  test('SignUp returns DataSuccess on success', () async {
    when(mockService.signUp('', '', '', any, any, any, ''))
        .thenAnswer((_) async => 200);

    final result = await repository.SignUp(
        'John Doe', '1234567890', 'New York', null, null, null, 'password123');

    expect(result, isA<DataSuccess>());
    expect((result as DataSuccess).data, 200);
    verify(mockService.signUp('', '', '', any, any, any, ''));
  });

  test('SignUp returns DataFailed on error', () async {
    when(mockService.signUp('', '', '', any, any, any, ''))
        .thenThrow(Exception());

    final result = await repository.SignUp(
        'John Doe', '1234567890', 'New York', null, null, null, 'password123');

    expect(result, isA<DataFailed>());
    verify(mockService.signUp('', '', '', any, any, any, ''));
  });
}
