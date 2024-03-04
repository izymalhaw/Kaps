import 'package:flutter/material.dart';

Widget feeds(double Height, double Width) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      border: Border.all(color: Colors.grey),
      borderRadius: BorderRadius.circular(10),
    ),
    height: Height * 0.1,
    width: Width * 0.76,
    child: Row(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(20),
          ),
          alignment: Alignment.topLeft,
          height: Height * 0.1,
          width: Width * 0.2,
          child: Image.network(
              "https://th.bing.com/th/id/R.9e5bbcd67eab8a75e4c02c6613766c8c?rik=BuwAibNFJ2pR2Q&pid=ImgRaw&r=0"),
        ),
        Container(
          height: Height * 0.1,
          width: Width * 0.5,
          child: Text(
              "----------------------------------------------------------------------------------------------------------------------------------------------------"),
        ),
      ],
    ),
  );
}
