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
    print(id);
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

  @override
  Future<HttpResponse<CartResponse>> addToCart() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final List<String>? products = prefs.getStringList('products');
      final List<String>? customerInfo = prefs.getStringList('CustomerInfo');
      final List<String>? productQuantities =
          prefs.getStringList('productsQuantities');
      List<Item> items = [];
      int counter = 0;
      products?.forEach((element) {
        items.add(
            Item(productId: element, quantity: productQuantities![counter]));
        counter += 1;
      });

      AddToCart cartInfo = AddToCart(
          firstName: customerInfo![0],
          lastName: customerInfo![1],
          phoneNumber: customerInfo![2],
          email: customerInfo![3],
          address:
              "${customerInfo![4]} ${customerInfo![5]} ${customerInfo![6]} ${customerInfo![7]}}",
          items: items);

      Map<String, dynamic> datas = cartInfo.toJson();

      print(datas);

      final response = await _dio.post(
          "https://kaps-api.purposeblacketh.com/cart/add-to-cart",
          options: Options(
            headers: {
              'Content-Type': 'application/json',
              'Authorization':
                  'bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NWRjNTU2OWFjYTcwNzhlYmM0NTA5NzIiLCJyb2xlIjoiQWRtaW4iLCJpYXQiOjE3MDk1MzE5OTB9.VAbggbnkEWv4-XLBdruePcYLyk8T52nBZRl097O3VVE'
            },
          ),
          data: datas);

      var cartRes = CartResponse.fromJson(response.data);
      prefs.remove('products');
      prefs.remove('productsQuantities');

      print("cart response: ${cartRes}");
      return HttpResponse(cartRes, response);
    } catch (e) {
      throw DioError(
        error: e.toString(),
        requestOptions: RequestOptions(path: "/agent/signin"),
      );
    }
  }

  @override
  Future<HttpResponse<PaymentResponse>> PayCart(
      String OrderId, double price) async {
    try {
      final response =
          await _dio.post("https://kaps-api.purposeblacketh.com/payment/pay",
              options: Options(
                headers: {
                  'Content-Type': 'application/json',
                  'Authorization':
                      'bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NWRjNTU2OWFjYTcwNzhlYmM0NTA5NzIiLCJyb2xlIjoiQWRtaW4iLCJpYXQiOjE3MDk1MzE5OTB9.VAbggbnkEWv4-XLBdruePcYLyk8T52nBZRl097O3VVE'
                },
              ),
              data: jsonEncode({
                "tranx_id": "KAPS_${OrderId}",
                "return_url":
                    "https://kaps-api.purposeblacketh.com/payment/success/KAPS_${OrderId}",
                "amount": price,
                "subject": "KAPS PRODUCT"
              }));

      print(response.data);
      var PayRes = PaymentResponse.fromJson(response.data);
      return HttpResponse(PayRes, response);
    } catch (e) {
      print(e);
      throw DioError(
        error: e.toString(),
        requestOptions: RequestOptions(path: "/agent/signin"),
      );
    }
  }
}
