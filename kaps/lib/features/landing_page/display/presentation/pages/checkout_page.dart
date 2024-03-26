import 'package:flutter/material.dart';

class checkoutPage extends StatefulWidget {
  const checkoutPage({super.key});

  @override
  State<checkoutPage> createState() => _checkoutPageState();
}

class _checkoutPageState extends State<checkoutPage> {
  @override
  Widget build(BuildContext context) {
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
                decoration: BoxDecoration(
                  border: Border.all(),
                ),
                child: Text(""))
          ]),
        ),
      ),
    );
  }
}
