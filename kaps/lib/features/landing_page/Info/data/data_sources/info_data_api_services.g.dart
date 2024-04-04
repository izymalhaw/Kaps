// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'info_data_api_services.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _infoDataApiService implements infoDataApiService {
  _infoDataApiService(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'https://kaps-api.purposeblacketh.com/';
  }

  final Dio _dio;

  String? baseUrl;

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  String _combineBaseUrls(
    String dioBaseUrl,
    String? baseUrl,
  ) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }

  @override
  Future<List<dynamic>> getItemsHistory(String PhoneNumber) async {
    try {
      final response = await _dio.get(
          "https://kaps-api.purposeblacketh.com/product/getitemsbyphone/${PhoneNumber}",
          options: Options(headers: {
            'Authorization':
                'bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NWRjNTU2OWFjYTcwNzhlYmM0NTA5NzIiLCJyb2xlIjoiQWRtaW4iLCJpYXQiOjE3MDk1MzE5OTB9.VAbggbnkEWv4-XLBdruePcYLyk8T52nBZRl097O3VVE'
          }));
      if (response.statusCode == HttpStatus.ok) {
        List<dynamic> items = response.data;
        return items;
      } else {
        throw DioError(
          error: 'An error occurred while fetching farmer data',
          response: response,
          requestOptions: response.requestOptions,
        );
      }
    } on DioException catch (e) {
      print(e.response.toString());
      throw DioError(
        error: e.toString(),
        requestOptions: RequestOptions(path: "/product/getitemsbyphone"),
      );
    }
  }

  @override
  Future<UpdateAccount> UpdateAcc(
      String Id, String accBank, String accNumber) async {
    try {
      final response = await _dio.put(
          "https://kaps-api.purposeblacketh.com/agent/update/${Id}",
          options: Options(headers: {
            'Authorization':
                'bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NWRjNTU2OWFjYTcwNzhlYmM0NTA5NzIiLCJyb2xlIjoiQWRtaW4iLCJpYXQiOjE3MDk1MzE5OTB9.VAbggbnkEWv4-XLBdruePcYLyk8T52nBZRl097O3VVE'
          }),
          data: jsonEncode({
            "bankName": accBank.toString(),
            "accNumber": accNumber.toString()
          }));
      if (response.statusCode == HttpStatus.ok) {
        return UpdateAccount.fromJson(response.data);
      } else {
        throw DioError(
          error: 'An error occurred while fetching farmer data',
          response: response,
          requestOptions: response.requestOptions,
        );
      }
    } on DioException catch (e) {
      print(e.response.toString());
      throw DioError(
        error: e.toString(),
        requestOptions: RequestOptions(path: "/product/getitemsbyphone"),
      );
    }
  }
}
