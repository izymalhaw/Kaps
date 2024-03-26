// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fetch_all_products_api_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _FetchAllProducts implements FetchAllProducts {
  _FetchAllProducts(
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
  Future<HttpResponse<List<Datum>>> FetchProducts() async {
    try {
      final response = await _dio.get(
          "https://kaps-api.purposeblacketh.com/wearhouse/products",
          options: Options(headers: {
            'Authorization':
                'bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NWRjNTU2OWFjYTcwNzhlYmM0NTA5NzIiLCJyb2xlIjoiQWRtaW4iLCJpYXQiOjE3MDk1MzE5OTB9.VAbggbnkEWv4-XLBdruePcYLyk8T52nBZRl097O3VVE'
          }));
      if (response.statusCode == HttpStatus.ok) {
        var products = Products.fromJson(response.data);
        return HttpResponse(products.data, response);
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
  Future<HttpResponse<Singleproduct>> FetchAProduct(String id) async {
    try {
      final response = await _dio.get(
          "https://kaps-api.purposeblacketh.com/wearhouse/products/${id}",
          options: Options(headers: {
            'Authorization':
                'bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NWRjNTU2OWFjYTcwNzhlYmM0NTA5NzIiLCJyb2xlIjoiQWRtaW4iLCJpYXQiOjE3MDk1MzE5OTB9.VAbggbnkEWv4-XLBdruePcYLyk8T52nBZRl097O3VVE'
          }));
      var products = Singleproduct.fromJson(response.data);
      print(products);
      if (response.statusCode == HttpStatus.ok) {
        var products = Singleproduct.fromJson(response.data);
        return HttpResponse(products, response);
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
