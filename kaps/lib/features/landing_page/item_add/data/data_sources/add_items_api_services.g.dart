// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_items_api_services.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _AddItemsApiService implements AddItemsApiService {
  _AddItemsApiService(
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
  Future<int> AddItems(
    String PhoneNumber,
    String Location,
    File ProductImage,
    String? price,
    String? productName,
    String? productDescription,
    String? productCategory,
    String? unit,
    String? quantity,

  ) async {
    FormData formData = await ItemsModels(
      phoneNumber: PhoneNumber,
      location: Location,
      productImage: ProductImage,
      productName: productName,
      productDescription: productDescription,
      price: price,
      productCategory:productCategory,
      unit: unit,
      quantity: quantity,
    ).toJson();
    try {
      final response = await _dio.post(
        "https://kaps-api.purposeblacketh.com/product/postitem",
        data: formData,
        options: Options(
          headers: {
            'Content-Type': 'multipart/form-data',
            'Authorization':
                'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NWRjNTU2OWFjYTcwNzhlYmM0NTA5NzIiLCJyb2xlIjoiQWRtaW4iLCJpYXQiOjE3MDk1MzE5OTB9.VAbggbnkEWv4-XLBdruePcYLyk8T52nBZRl097O3VVE'
          },
        ),
      );
      if (response.statusCode == HttpStatus.ok) {
        print("working");
        return HttpStatus.ok;
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
        requestOptions: RequestOptions(path: "/product/postitem"),
      );
    }
  }

  @override
  Future<List<dynamic>> GetAllItems() async {
    try {
      final response = await _dio.get(
          "https://kaps-api.purposeblacketh.com/adminitem/getallItems",
          options: Options(headers: {
            'Authorization':
                'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NWRjNTU2OWFjYTcwNzhlYmM0NTA5NzIiLCJyb2xlIjoiQWRtaW4iLCJpYXQiOjE3MDkzMTM2MTV9.lxlXWhnv8KxqQkcZu8q5AuPrFZiP3-M6FWnW3VttXnA'
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
        requestOptions: RequestOptions(path: "/product/postitem"),
      );
    }
  }
}
