import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:kaps/features/landing_page/display/presentation/bloc/display_bloc.dart';
import 'package:kaps/features/landing_page/display/presentation/widget/NavBar.dart';
import 'package:kaps/features/landing_page/display/presentation/widget/add_to_cart.dart';
import 'package:kaps/features/landing_page/display/presentation/widget/catagories.dart';
import 'package:kaps/features/landing_page/display/presentation/widget/search.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:status_alert/status_alert.dart';

class displayProducts extends StatefulWidget {
  const displayProducts({super.key});

  @override
  State<displayProducts> createState() => _displayProductsState();
}

class _displayProductsState extends State<displayProducts> {
  String selectedTile = 'Dash Board';
  String add = 'ADD';
  bool beacon = false;
  @override
  void initState() {
    BlocProvider.of<DisplayBloc>(context).add(DisplayInitialEvent());
    super.initState();
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

  void _onTileSelected(String tileLabel) {
    setState(() {
      selectedTile = tileLabel;
    });
  }

  @override
  Widget build(BuildContext context) {
    double Sheight = MediaQuery.of(context).size.height;
    double Swidth = MediaQuery.of(context).size.width;
    return BlocBuilder<DisplayBloc, DisplayState>(
      builder: (context, state) {
        if (state is DisplayInitial) {
          return Scaffold(
            drawer: NavBar(
              onTileSelected: _onTileSelected,
              name: "",
              Phone: "",
              ImageCache: "",
            ),
            body: Container(
              child: Center(
                child: CircularProgressIndicator(
                    color: Color.fromRGBO(215, 160, 34, 1)),
              ),
            ),
          );
        }
        if (state is DisplayLoadedState) {
          return Scaffold(
            drawer: NavBar(
              onTileSelected: _onTileSelected,
              name: "",
              Phone: "",
              ImageCache: "",
            ),
            appBar: AppBar(
              backgroundColor: Color.fromRGBO(215, 160, 34, 1),
              title: Row(children: [
                Text("KAPS"),
                Spacer(),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    Icons.person_outline_rounded,
                    size: 35,
                  ),
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                Stack(
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, "/cart");
                        },
                        child: Icon(Icons.shopping_cart_outlined)),
                    beacon
                        ? Positioned(
                            top: -MediaQuery.of(context).size.height * 0.035,
                            left: MediaQuery.of(context).size.width * 0.03,
                            child: Text(
                              ".",
                              style: TextStyle(
                                  fontSize: 36,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red),
                            ),
                          )
                        : SizedBox.shrink()
                  ],
                ),
              ]),
            ),
            body: Container(
              color: Color.fromRGBO(235, 235, 235, 1),
              child: Column(
                children: [
                  /* Padding(
                    padding: EdgeInsets.fromLTRB(Swidth * 0.15, 0, 0, 0),
                    child: Container(
                      child: search("search", Swidth, Sheight),
                    ),
                  ), */
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Container(
                        width: MediaQuery.of(context).size.width * 1.0,
                        child: Row(
                          children: [
                            Catagories('Vegitables', Sheight),
                            Spacer(),
                            Catagories('Fruits', Sheight),
                            Spacer(),
                            Catagories('Crops and Cerals', Sheight),
                            Spacer(),
                            Catagories('Comodities', Sheight),
                            Spacer(),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GridView.builder(
                      padding: EdgeInsets.all(8),
                      itemCount: state.products.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                        childAspectRatio: 0.7,
                      ),
                      itemBuilder: (context, index) {
                        var product = state.products[index];
                        var discount = 10;

                        return Card(
                          surfaceTintColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          elevation: 4,
                          child: GestureDetector(
                            onTap: () {
                              /* Navigator.pushNamed(context, '/ProductPage',
                                  arguments: state.products[index]); */
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                        elevation: 4,
                                        backgroundColor:
                                            Color.fromARGB(0, 255, 255, 255),
                                        content: SingleChildScrollView(
                                          child: Column(
                                            children: [
                                              Container(
                                                height: Sheight * 0.25,
                                                width: Swidth,
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  10),
                                                          topRight:
                                                              Radius.circular(
                                                                  10)),
                                                  child: FutureBuilder<
                                                      ImageProvider>(
                                                    future: _loadImage(
                                                        "https://kaps-api.purposeblacketh.com/" +
                                                            state
                                                                .products[index]
                                                                .file),
                                                    builder: (BuildContext
                                                            context,
                                                        AsyncSnapshot<
                                                                ImageProvider>
                                                            snapshot) {
                                                      if (snapshot
                                                              .connectionState ==
                                                          ConnectionState
                                                              .waiting) {
                                                        return Center(
                                                            child:
                                                                CircularProgressIndicator()); // Show a loading indicator while waiting
                                                      } else if (snapshot
                                                          .hasError) {
                                                        return Image.asset(
                                                          'assets/images/kaps_splash.png',
                                                          width:
                                                              double.infinity,
                                                          fit: BoxFit.fill,
                                                        );
                                                      } else {
                                                        return Image(
                                                          image: snapshot
                                                                  .data ??
                                                              AssetImage(
                                                                  'assets/images/kaps_splash.png'),
                                                          width:
                                                              double.infinity,
                                                          fit: BoxFit.fill,
                                                        );
                                                      }
                                                    },
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width: Swidth,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(10),
                                                    bottomRight:
                                                        Radius.circular(10),
                                                  ),
                                                ),
                                                child: Column(
                                                  children: [
                                                    Text(
                                                        "Product Description: ${state.products[index].productdescription}"),
                                                    Text(
                                                        "Product Quantity: ${state.products[index].quantity}"),
                                                    Text(
                                                        "Product Unit: ${state.products[index].unit}"),
                                                    Text(
                                                        "Minimum Checkout: ${state.products[index].quantity / 4} ${state.products[index].unit}"),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ));
                                  });
                            },
                            child: Column(
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: Stack(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.vertical(
                                              top: Radius.circular(10),
                                            ),
                                            child: FutureBuilder<ImageProvider>(
                                              future: _loadImage(
                                                  "https://kaps-api.purposeblacketh.com/" +
                                                      state.products[index]
                                                          .file),
                                              builder: (BuildContext context,
                                                  AsyncSnapshot<ImageProvider>
                                                      snapshot) {
                                                if (snapshot.connectionState ==
                                                    ConnectionState.waiting) {
                                                  return CircularProgressIndicator(); // Show a loading indicator while waiting
                                                } else if (snapshot.hasError) {
                                                  return Image.asset(
                                                    'assets/images/kaps_splash.png',
                                                    width: double.infinity,
                                                    fit: BoxFit.cover,
                                                  );
                                                } else {
                                                  return Image(
                                                    image: snapshot.data ??
                                                        AssetImage(
                                                            'assets/images/kaps_splash.png'),
                                                    width: double.infinity,
                                                    fit: BoxFit.cover,
                                                  );
                                                }
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Stack(
                                    children: [
                                      ListTile(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(10),
                                            bottomRight: Radius.circular(10),
                                          ),
                                        ),
                                        tileColor: Colors.white,
                                        title: Text(
                                          state.products[index].productname,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        subtitle: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                                'Price: ${state.products[index].productprice} ETB'),
                                          ],
                                        ),
                                      ),
                                      Positioned(
                                        top: Sheight * 0.1,
                                        left: Swidth * 0.25,
                                        child: GestureDetector(
                                            onTap: () async {
                                              final SharedPreferences prefs =
                                                  await SharedPreferences
                                                      .getInstance();
                                              List<String> existingProducts =
                                                  prefs.getStringList(
                                                          'products') ??
                                                      [];
                                              if (existingProducts.contains(
                                                  state.products[index].id)) {
                                                existingProducts.remove(
                                                    state.products[index].id);
                                              } else {
                                                existingProducts.add(
                                                    state.products[index].id);
                                              }
                                              await prefs.setStringList(
                                                  'products', existingProducts);
                                              setState(() {
                                                beacon = true;
                                              });
                                            },
                                            child: Addtocart(add)),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        } else if (state is DisplayError) {
          StatusAlert.show(
            context,
            duration: Duration(seconds: 3),
            title: 'Error',
            subtitle: 'Try again!',
            configuration: const IconConfiguration(icon: Icons.error),
          );
          Timer(const Duration(seconds: 2), () {
            Navigator.pushNamed(context, "/SingUp");
          });
          return SizedBox.shrink();
        } else {
          return Container(
            child: Center(
              child: CircularProgressIndicator(
                color: Color.fromRGBO(215, 160, 34, 1),
              ),
            ),
          );
        }
      },
    );
  }
}
