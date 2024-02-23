// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_farmer_data_api_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _GetFarmerDataApiService implements GetFarmerDataApiService {
  _GetFarmerDataApiService(
    this._dio, {
    this.baseUrl,
  });

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
  Future<HttpResponse<List<FarmerModels>>> getFarmerData(String id) async {
    try {
      final response = await _dio.get("/farmers/", queryParameters: {'id': id});
      if (response.statusCode == HttpStatus.ok) {
        return response.data;
      } else {
        throw DioError(
          error: 'An error occurred while fetching farmer data',
          response: response,
          requestOptions: response.requestOptions,
        );
      }
    } catch (e) {
      throw DioError(
        error: e.toString(),
        requestOptions: RequestOptions(path: "/farmers/"),
      );
    }
  }

  @override
  Future<HttpResponse<List<FarmerModels>>> SignIn(
      String PhoneNumber, String Password) async {
    try {
      final response = await _dio.post(
          "https://kaps-api.purposeblacketh.com/agent/signin",
          data: <String, String>{'phone': PhoneNumber, 'password': Password});
      if (response.statusCode == HttpStatus.ok) {
        FarmerModels farmerEntities = FarmerModels.fromJson(response.data);
        return HttpResponse<List<FarmerModels>>(
          [farmerEntities],
          response, // Pass the list of FarmerModels
        );
      } else {
        throw DioError(
          error: 'An error occurred while fetching farmer data',
          response: response,
          requestOptions: response.requestOptions,
        );
      }
    } catch (e) {
      print("flag1");
      throw DioError(
        error: e.toString(),
        requestOptions: RequestOptions(path: "/agent/signin"),
      );
    }
  }

  @override
  Future<HttpResponse> signUp(
    String FullName,
    String PhoneNumber,
    String Location,
    File? ProfileImage,
    Uint8List? fileBytes,
    String? fileName,
  ) async {
    print("all datas:" +
        "name:" +
        FullName +
        " phone:" +
        PhoneNumber +
        " loc:" +
        Location +
        " filename: " +
        fileName!);
    print(ProfileImage);
    print("fileByte:");
    print(fileBytes);
    return Future.value(HttpResponse(
        200,
        Response(
            data: 'SignUp dummy response',
            requestOptions: RequestOptions(path: "/agent/signup"))));
  }
}
