import 'package:flutter/material.dart';

Widget Boxes(double Height, double Width) {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      children: [
        Container(
          height: Height * 0.1,
          width: Width * 0.4,
          decoration: BoxDecoration(
              color: Colors.grey,
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10)),
          child: Center(
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                  Width * 0.01, Height * 0.025, Width * 0.01, Height * 0.01),
              child: Column(
                children: [
                  Text(
                    "Products Added",
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    "0",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          width: Width * 0.1,
        ),
        Container(
          height: Height * 0.1,
          width: Width * 0.4,
          decoration: BoxDecoration(
              color: Colors.grey,
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10)),
          child: Center(
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                  Width * 0.01, Height * 0.025, Width * 0.01, Height * 0.01),
              child: Column(
                children: [
                  Text(
                    "Locations",
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    "1",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          width: Width * 0.1,
        ),
        Container(
          height: Height * 0.1,
          width: Width * 0.4,
          decoration: BoxDecoration(
              color: Colors.grey,
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10)),
          child: Center(
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                  Width * 0.01, Height * 0.025, Width * 0.01, Height * 0.01),
              child: Column(
                children: [
                  Text(
                    "Items On List",
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    "9",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
