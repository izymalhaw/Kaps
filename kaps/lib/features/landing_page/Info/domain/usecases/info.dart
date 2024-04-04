import 'package:kaps/core/resources/data_state.dart';
import 'package:kaps/core/usecase/usecase.dart';
import 'package:kaps/features/landing_page/Info/domain/entities/entitiy.dart';
import 'package:kaps/features/landing_page/Info/domain/repositories/repositoris.dart';

class info implements UseCase<DataState<List<dynamic>>, String> {
  final domainRepositories _domainRepositories;
  info(this._domainRepositories);
  @override
  Future<DataState<List<dynamic>>> call({String? params}) {
    throw UnimplementedError();
  }

  Future<DataState<List<dynamic>>> getAllItem(String phone) {
    return _domainRepositories.getFarmerData(phone);
  }

  Future<AgentEntity> updateAgentAccount(String Id,String accNumber,String bankAcc) {
    return _domainRepositories.updateAgentAccount(Id,accNumber,bankAcc);
  }
}
