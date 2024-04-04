import 'package:kaps/core/resources/data_state.dart';
import 'package:kaps/features/landing_page/Info/domain/entities/entitiy.dart';

abstract class domainRepositories {
  domainRepositories(Object object);

  Future<DataState<List<dynamic>>> getFarmerData(String phone);

  Future<AgentEntity> updateAgentAccount(String Id, String accNumber,String bankAcc);
}
