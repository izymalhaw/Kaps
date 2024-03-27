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
      final response =
          await _dio.post("https://kaps-api.purposeblacketh.com/agent/signin",
              options: Options(
                headers: {
                  'Content-Type': 'application/json',
                  'Authorization':
                      'bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NWRjNTU2OWFjYTcwNzhlYmM0NTA5NzIiLCJyb2xlIjoiQWRtaW4iLCJpYXQiOjE3MDk1MzE5OTB9.VAbggbnkEWv4-XLBdruePcYLyk8T52nBZRl097O3VVE'
                  // Set the content type to multipart/form-data
                },
              ),
              data: jsonEncode({'phone': PhoneNumber, 'password': Password}));
      if (response.statusCode == HttpStatus.ok) {
        FarmerModels farmerEntities = FarmerModels.fromJson(response.data);
        print(farmerEntities.agent.img.url);
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('ProfilePicture', farmerEntities.agent.img.url);
        await prefs.setString('phone', farmerEntities.agent.phone);
        await prefs.setBool('user', true);
        await prefs.setString('name', farmerEntities.agent.name);
        await prefs.setString('location', farmerEntities.agent.location);

        return HttpResponse<List<FarmerModels>>(
          [farmerEntities],
          response, // Pass the list of FarmerModels
        );
      } else {
        print(response.data.toString());
        throw DioError(
          error: 'An error occurred while fetching farmer data',
          response: response,
          requestOptions: response.requestOptions,
        );
      }
    } catch (e) {
      print(e.toString());
      throw DioError(
        error: e.toString(),
        requestOptions: RequestOptions(path: "/agent/signin"),
      );
    }
  }

  @override
  Future<int> signUp(
    String FullName,
    String PhoneNumber,
    String Location,
    File? ProfileImage,
    Uint8List? fileBytes,
    String? fileName,
    String password,
  ) async {
    FormData formData = await FarmerModelsSend(
      FullName: FullName,
      PhoneNumber: PhoneNumber,
      location: Location,
      profilePicture: ProfileImage,
      fileName: fileName,
      fileBytes: fileBytes,
      Password: password,
    ).toJson();
    print(formData);
    try {
      final response = await _dio.post(
        "https://kaps-api.purposeblacketh.com/agent/signup",
        data: formData, // Use the FormData object here
        options: Options(
          headers: {
            'Content-Type': 'multipart/form-data',
            'Authorization':
                'bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NWRjNTU2OWFjYTcwNzhlYmM0NTA5NzIiLCJyb2xlIjoiQWRtaW4iLCJpYXQiOjE3MDk1MzE5OTB9.VAbggbnkEWv4-XLBdruePcYLyk8T52nBZRl097O3VVE'
// Set the content type to multipart/form-data
          },
        ),
      );
      if (response.statusCode == HttpStatus.ok) {
        print("working");
        //FarmerModels farmerEntities = FarmerModels.fromJson(response.data);
        return HttpStatus.ok;
      } else {
        print(response.data.toString());
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
        requestOptions: RequestOptions(path: "/agent/signup"),
      );
    }
  }
}
