import 'package:kaps/features/authentication/domain/entites/farmer_entity.dart';
import 'package:kaps/features/authentication/domain/repositories/repositories.dart';

import '../../../../core/resources/data_state.dart';
import '../../../../core/usecase/usecase.dart';

class GetFarmerDataUseCase
    implements UseCase<DataState<List<FarmersEntity>>, String> {
  final domainRepositories _domainRepositories;
  GetFarmerDataUseCase(this._domainRepositories);
  @override
  Future<DataState<List<FarmersEntity>>> call({String? params}) {
    return _domainRepositories.getFarmerData(params!);
  }
}
