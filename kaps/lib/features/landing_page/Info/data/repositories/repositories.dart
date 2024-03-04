import 'package:dio/dio.dart';
import 'package:kaps/core/resources/data_state.dart';
import 'package:kaps/features/landing_page/Info/data/data_sources/info_data_api_services.dart';
import 'package:kaps/features/landing_page/Info/domain/repositories/repositoris.dart';

class repositoriesImpl implements domainRepositories {
  final infoDataApiService _infoDataApiService;
  repositoriesImpl(this._infoDataApiService);

  @override
  Future<DataState<List>> getFarmerData(String phone) async {
    try {
      List<dynamic> res = await _infoDataApiService.getItemsHistory(phone);
      if (res is List) {
        return DataSuccess(data: res);
      } else {
        return DataFailed(
            error: DioError(
          requestOptions: RequestOptions(
            path: '',
          ),
        ));
      }
    } on DioError catch (e) {
      return DataFailed(error: e);
    }
  }
}
