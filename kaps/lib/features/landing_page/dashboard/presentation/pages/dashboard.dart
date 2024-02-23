import 'package:flutter/material.dart';

import '../widgets/boxes.dart';
import '../widgets/charts.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    double Height = MediaQuery.of(context).size.height;
    double Width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(children: [
        Padding(
          padding:
              EdgeInsets.fromLTRB(Width * 0.005, Height * 0.1, Width * 0.3, 0),
          child: Text(
            'Farmer DashBoard',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: Height * 0.05,
        ),
        Padding(
          padding:
              EdgeInsets.fromLTRB(Width * 0.05, 0, Width * 0.05, Height * 0.05),
          child: Boxes(Height, Width),
        ),
        SizedBox(
          height: Height * 0.01,
        ),
        Padding(
          padding:
              EdgeInsets.fromLTRB(Width * 0.05, 0, Width * 0.05, Height * 0.05),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                charts("Trendig Products", "Onion in kilos"),
                SizedBox(
                  width: Width * 0.1,
                ),
                charts("Trendig Products", "Coffee in Metric Ton"),
                SizedBox(
                  width: Width * 0.1,
                ),
                charts("Trendig Products", "Teff in Metric quintals"),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
