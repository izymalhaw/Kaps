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

class cartPage extends StatefulWidget {
  const cartPage({super.key});

  @override
  State<cartPage> createState() => _cartPageState();
}

class _cartPageState extends State<cartPage> {
  List<String>? products;
  double total = 0;
  List<double> quantities = [];

  @override
  void initState() {
    super.initState();
    loadProducts();
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
    return Scaffold(
      bottomSheet: Container(
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
                        total = state.datas.asMap().entries.fold(
                              0,
                              (sum, entry) =>
                                  sum +
                                  (entry.value.productprice *
                                      quantities[entry.key]),
                            );

                        return Text("${total.toString()} ETB",
                            style: GoogleFonts.montserrat(
                                fontSize: 18, color: Colors.black));
                      } else {
                        return Text("0",
                            style: GoogleFonts.montserrat(
                                fontSize: 18, color: Colors.black));
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
                  await prefs.remove('products');
                  setState(() {});
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
            state.datas.forEach((item) {
              print(item.quantity);
              quantities.add(item.quantity);
            });
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
                              child: Image.network(
                                  "https://kaps-api.purposeblacketh.com/${state.datas[index].file}"),
                            ),
                            Column(
                              children: [
                                Spacer(),
                                Text(state.datas[index].productname),
                                Spacer(),
                                Text(
                                    state.datas[index].productprice.toString()),
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
                                });
                              },
                            ),
                            Spacer(),
                            Icon(
                              Icons.delete,
                              color: Colors.red,
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
    );
  }
}
