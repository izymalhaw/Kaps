import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kaps/features/landing_page/display/presentation/bloc/display_bloc.dart';
import 'package:kaps/features/landing_page/display/presentation/widget/TextFields.dart';
import 'package:kaps/features/landing_page/display/presentation/widget/elevated_btns.dart';
import 'package:shared_preferences/shared_preferences.dart';

class checkoutPage extends StatefulWidget {
  const checkoutPage({super.key});

  @override
  State<checkoutPage> createState() => _checkoutPageState();
}

class _checkoutPageState extends State<checkoutPage> {
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? email;
  String? country;
  String? region;
  String? town;
  String? streetAddress;

  @override
  void initState() {
    _loadSavedData();
    super.initState();
  }

  void _loadSavedData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      List<String>? customerInfo = prefs.getStringList('CustomerInfo');
      firstName = customerInfo![0];
      lastName = customerInfo![1];
      phoneNumber = customerInfo![2];
      email = customerInfo![3];
      country = customerInfo![4];
      town = customerInfo![5];
      region = customerInfo![6];
      streetAddress = customerInfo![7];
    });
  }

  @override
  Widget build(BuildContext context) {
    double Sheight = MediaQuery.of(context).size.height;
    double Swidth = MediaQuery.of(context).size.width;
    return BlocBuilder<DisplayBloc, DisplayState>(
      builder: (context, state) {
        if (state is CompleteState) {
          final String OrderId = state.datas.orderId.toString();
          final double price = state.datas.price.totalPrice.toDouble();
          return Scaffold(
            body: SingleChildScrollView(
              child: Container(
                color: Color.fromRGBO(235, 235, 235, 1),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 50.0),
                  child: Column(
                    children: [
                      Container(
                          height: MediaQuery.of(context).size.height * 0.3,
                          width: MediaQuery.of(context).size.width * 0.8,
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(215, 160, 34, 1),
                              border: Border.all(
                                  color: Color.fromRGBO(215, 160, 34, 1))),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 8),
                            child: Center(
                              child: Text(
                                "Your Order Has been Recived Click To Continue",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 32),
                              ),
                            ),
                          )),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.5,
                        width: MediaQuery.of(context).size.width * 0.8,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.white,
                            )),
                        child: Column(
                          children: [
                            Text("Order Id: $OrderId"),
                            Divider(),
                            Text("Total Price: $price"),
                            Divider(),
                            
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            bottomSheet: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.1,
              color: Color.fromRGBO(235, 235, 235, 1),
              child: Column(
                children: [
                  Spacer(),
                  ElevatedBtns(
                      PrimaryColor: Color.fromRGBO(215, 160, 34, 1),
                      SecondaryColor: Colors.white,
                      TextDisplay: "Complete Order",
                      Onpressed: () async {
                        BlocProvider.of<DisplayBloc>(context)
                            .add(payOrderEvent(OrderId, price));
                      }),
                  Spacer(),
                ],
              ),
            ),
          );
        }
        return Scaffold(
          bottomSheet: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.1,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5), // Color of the shadow
                  spreadRadius: 5, // Spread radius
                  blurRadius: 7, // Blur radius
                  offset: Offset(0, 3), // Offset of the shadow
                ),
              ],
            ),
            child: Column(
              children: [
                Spacer(),
                ElevatedBtns(
                    PrimaryColor: Color.fromRGBO(215, 160, 34, 1),
                    SecondaryColor: Colors.white,
                    TextDisplay: "Place Order",
                    Onpressed: () async {
                      final SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      setState(() {
                        prefs.setStringList('CustomerInfo', [
                          firstName!,
                          lastName!,
                          phoneNumber!,
                          email!,
                          country!,
                          region!,
                          town!,
                          streetAddress!,
                        ]);
                        BlocProvider.of<DisplayBloc>(context)
                            .add(placeOrderEvent());
                      });
                    }),
                Spacer(),
              ],
            ),
          ),
          appBar: AppBar(
            centerTitle: true,
            title: Text("Checkout",
                style:
                    GoogleFonts.montserrat(fontSize: 22, color: Colors.black)),
            backgroundColor: Color.fromRGBO(235, 235, 235, 1),
          ),
          body: SingleChildScrollView(
            child: Container(
              color: Color.fromRGBO(235, 235, 235, 1),
              height: Sheight,
              width: Swidth,
              child: Column(children: [
                Container(
                  alignment: Alignment.topLeft,
                  width: Swidth * 0.9,
                  decoration: BoxDecoration(
                    border: Border.all(),
                  ),
                  child: Column(
                    children: [
                      Text("Contact Information",
                          style: GoogleFonts.montserrat(
                              fontSize: 16, color: Colors.black)),
                      Row(
                        children: [
                          MyTextField(
                            onItemSelected: (value) {
                              setState(() {
                                firstName = value;
                              });
                            },
                            hintText: firstName ?? '   First Name',
                            checkValidity: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your informations correctly';
                              }
                              return null;
                            },
                            obscurity: false,
                            x: 0.39,
                          ),
                          Spacer(),
                          MyTextField(
                            onItemSelected: (value) {
                              setState(() {
                                lastName = value;
                              });
                            },
                            hintText: lastName ?? '   Last Name',
                            checkValidity: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your informations correctly';
                              }
                              return null;
                            },
                            obscurity: false,
                            x: 0.38,
                          )
                        ],
                      ),
                      MyTextField(
                        onItemSelected: (value) {
                          setState(() {
                            phoneNumber = value;
                          });
                        },
                        hintText: phoneNumber ?? '   Phone Number',
                        checkValidity: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your informations correctly';
                          }
                          return null;
                        },
                        obscurity: false,
                        x: 0.9,
                      ),
                      MyTextField(
                        onItemSelected: (value) {
                          setState(() {
                            email = value;
                          });
                        },
                        hintText: email ?? '   Email Address',
                        checkValidity: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your informations correctly';
                          }
                          return null;
                        },
                        obscurity: false,
                        x: 0.9,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: Sheight * 0.05,
                ),
                Container(
                  alignment: Alignment.topLeft,
                  width: Swidth * 0.9,
                  decoration: BoxDecoration(
                    border: Border.all(),
                  ),
                  child: Column(
                    children: [
                      Text("Address",
                          style: GoogleFonts.montserrat(
                              fontSize: 16, color: Colors.black)),
                      Row(
                        children: [
                          MyTextField(
                            onItemSelected: (value) {
                              setState(() {
                                country = value;
                              });
                            },
                            hintText: country ?? '   Country',
                            checkValidity: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your informations correctly';
                              }
                              return null;
                            },
                            obscurity: false,
                            x: 0.39,
                          ),
                          Spacer(),
                          MyTextField(
                            onItemSelected: (value) {
                              setState(() {
                                region = value;
                              });
                            },
                            hintText: region ?? '   Region',
                            checkValidity: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your informations correctly';
                              }
                              return null;
                            },
                            obscurity: false,
                            x: 0.38,
                          )
                        ],
                      ),
                      MyTextField(
                        onItemSelected: (value) {
                          setState(() {
                            town = value;
                          });
                        },
                        hintText: town ?? '   Town/City',
                        checkValidity: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your informations correctly';
                          }
                          return null;
                        },
                        obscurity: false,
                        x: 0.9,
                      ),
                      MyTextField(
                        onItemSelected: (value) {
                          setState(() {
                            streetAddress = value;
                          });
                        },
                        hintText: streetAddress ?? '   Street Address',
                        checkValidity: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your informations correctly';
                          }
                          return null;
                        },
                        obscurity: false,
                        x: 0.9,
                      ),
                    ],
                  ),
                )
              ]),
            ),
          ),
        );
      },
    );
  }
}
