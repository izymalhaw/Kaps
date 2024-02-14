import 'package:kaps/core/resources/data_state.dart';

import '../entites/farmer_entity.dart';

abstract class domainRepositories{
  Future<DataState<List<FarmersEntity>>> getFarmerData(String id);
}