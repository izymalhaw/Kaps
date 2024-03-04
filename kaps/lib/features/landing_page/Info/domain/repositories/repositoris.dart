import 'package:kaps/core/resources/data_state.dart';

abstract class domainRepositories {
  domainRepositories(Object object);

  Future<DataState<List<dynamic>>> getFarmerData(String phone);
}
