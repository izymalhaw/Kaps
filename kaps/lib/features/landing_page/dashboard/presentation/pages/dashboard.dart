import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:kaps/features/landing_page/dashboard/presentation/widgets/feeds.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
    return SingleChildScrollView(
      child: Column(children: [
        Padding(
          padding:
              EdgeInsets.fromLTRB(Width * 0.05, 0, Width * 0.05, Height * 0.05),
          child: Boxes(Height, Width),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(
              Width * 0.05, 0, Width * 0.05, Height * 0.001),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                charts("Farmers Sells", "Yearly Sales Analysis"),
                Padding(
                  padding:
                      EdgeInsets.only(right: Width * 0.6, left: Width * 0.05),
                  child: Row(
                    children: [
                      Text(
                        "Feeds",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Icon(Icons.newspaper_sharp),
                    ],
                  ),
                ),
                Container(
                  height: Height * 0.3,
                  width: Width * 0.85,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
