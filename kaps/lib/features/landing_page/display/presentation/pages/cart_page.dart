import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:item_count_number_button/item_count_number_button.dart';
import 'package:kaps/features/authentication/presentation/widgets/constants.dart';
import 'package:kaps/features/landing_page/display/data/model/models.dart';
import 'package:kaps/features/landing_page/display/domain/entites/entities.dart';
import 'package:kaps/features/landing_page/display/presentation/bloc/display_bloc.dart';
import 'package:kaps/features/landing_page/display/presentation/widget/elevated_btns.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class cartPage extends StatefulWidget {
  const cartPage({super.key});

  @override
  State<cartPage> createState() => _cartPageState();
}

class _cartPageState extends State<cartPage> {
  List<String>? products;
  double total = 0;
  List<dynamic> quantities = [];

  @override
  void initState() {
    super.initState();
    loadProducts();
  }

  Future<ImageProvider> _loadImage(String imageUrl) async {
    try {
      final response = await http.get(Uri.parse(imageUrl));
      if (response.statusCode == 200) {
        return NetworkImage(imageUrl);
      } else {
        throw Exception('Failed to load image');
      }
    } catch (e) {
      return AssetImage('assets/images/kaps_splash.png');
    }
  }

  Future<void> loadProducts() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      products = prefs.getStringList('products');
      BlocProvider.of<DisplayBloc>(context).add(cartDataEvent(products!));
    });
  }

  @override
  Widget build(BuildContext context) {
    double Sheight = MediaQuery.of(context).size.height;
    double Swidth = MediaQuery.of(context).size.width;
    return BlocListener<DisplayBloc, DisplayState>(
      listener: (context, state) {
        if (state is cartDataLoadedState) {
          quantities = state.datas.map((item) => item.quantity).toList();
        }
      },
      child: Scaffold(
        bottomSheet: total == 0
            ? SizedBox.shrink()
            : Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.15,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color:
                          Colors.grey.withOpacity(0.5), // Color of the shadow
                      spreadRadius: 5, // Spread radius
                      blurRadius: 7, // Blur radius
                      offset: Offset(0, 3), // Offset of the shadow
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text("Total Price",
                              style: GoogleFonts.montserrat(
                                  fontSize: 18, color: Colors.black)),
                          Spacer(),
                          BlocBuilder<DisplayBloc, DisplayState>(
                            builder: (context, state) {
                              if (state is cartDataLoadedState) {
                                return Text("${total.toString()} ETB",
                                    style: GoogleFonts.montserrat(
                                        fontSize: 18, color: Colors.black));
                              } else {
                                return SizedBox.shrink();
                              }
                            },
                          )
                        ],
                      ),
                    ),
                    Spacer(),
                    ElevatedBtns(
                        PrimaryColor: Color.fromRGBO(215, 160, 34, 1),
                        SecondaryColor: Colors.white,
                        TextDisplay: "Check out",
                        Onpressed: () async {
                          final SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          prefs.setStringList(
                              'productsQuantities',
                              quantities
                                  .map((item) => item.toString())
                                  .toList());
                          Navigator.pushNamed(context, '/checkout');
                        }),
                    Spacer(),
                  ],
                ),
              ),
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(235, 235, 235, 1),
          centerTitle: true,
          title: Row(
            children: [
              Spacer(),
              Text("Cart"),
              Spacer(),
              Icon(Icons.shopping_cart_outlined)
            ],
          ),
        ),
        body: BlocBuilder<DisplayBloc, DisplayState>(
          builder: (context, state) {
            if (state is cartDataLoadedState) {
              //quantities = state.datas.map((item) => item.quantity).toList();
              return Container(
                color: Color.fromRGBO(235, 235, 235, 1),
                child: ListView.builder(
                  itemCount: state.datas.length ?? 0,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 20, 8.0, 8.0),
                      child: Container(
                          height: Sheight * 0.1,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            children: [
                              SizedBox(
                                height: Sheight * 0.2,
                                width: Swidth * 0.2,
                                child: FutureBuilder<ImageProvider>(
                                  future: _loadImage(state.datas[index].file),
                                  builder: (BuildContext context,
                                      AsyncSnapshot<ImageProvider> snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return Center(
                                          child:
                                              CircularProgressIndicator()); // Show a loading indicator while waiting
                                    } else if (snapshot.hasError) {
                                      return Image.asset(
                                        'assets/images/kaps_splash.png',
                                        width: double.infinity,
                                        fit: BoxFit.fill,
                                      );
                                    } else {
                                      return Image(
                                        image: snapshot.data ??
                                            AssetImage(
                                                'assets/images/kaps_splash.png'),
                                        width: double.infinity,
                                        fit: BoxFit.fill,
                                      );
                                    }
                                  },
                                ),
                              ),
                              Column(
                                children: [
                                  Spacer(),
                                  Text(state.datas[index].productname),
                                  Spacer(),
                                  Text(state.datas[index].productprice
                                      .toString()),
                                  Spacer(),
                                ],
                              ),
                              Spacer(),
                              ItemCount(
                                color: Color.fromRGBO(215, 160, 34, 1),
                                initialValue: quantities[index],
                                minValue: state.datas[index].quantity / 4,
                                maxValue: state.datas[index].quantity,
                                decimalPlaces: 0,
                                onChanged: (value) {
                                  setState(() {
                                    quantities[index] = value.toDouble();

                                    total = state.datas.asMap().entries.fold(
                                          0,
                                          (sum, entry) =>
                                              sum +
                                              (entry.value.productprice *
                                                  quantities[entry.key]),
                                        );
                                  });
                                },
                              ),
                              Spacer(),
                              GestureDetector(
                                onTap: () async {
                                  final SharedPreferences prefs =
                                      await SharedPreferences.getInstance();
                                  List<String>? list =
                                      prefs.getStringList('products');

                                  if (list != null &&
                                      list.contains(state.datas[index].id)) {
                                    list.remove(state.datas[index].id);
                                    await prefs.setStringList('products', list);
                                  }
                                  setState(() {});
                                },
                                child: Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                              ),
                              Spacer(),
                            ],
                          )),
                    );
                  },
                ),
              );
            } else {
              return Center(
                  child: CircularProgressIndicator(
                color: Color.fromRGBO(215, 160, 34, 1),
              ));
            }
          },
        ),
      ),
    );
  }
}
