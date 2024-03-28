import 'package:flutter/material.dart';

class checkoutPage extends StatefulWidget {
  const checkoutPage({super.key});

  @override
  State<checkoutPage> createState() => _checkoutPageState();
}

class _checkoutPageState extends State<checkoutPage> {
  @override
  Widget build(BuildContext context) {
    double Sheight = MediaQuery.of(context).size.height;
    double Swidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Checkout"),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Color.fromRGBO(235, 235, 235, 1),
          child: Column(children: [
            Container(
                height: Sheight * 0.5,
                decoration: BoxDecoration(
                  border: Border.all(),
                ),
                child: Text("a"))
          ]),
        ),
      ),
    );
  }
}
