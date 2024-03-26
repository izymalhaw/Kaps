import 'package:flutter/material.dart';

Widget search(String Txt, double Swidth, double Sheight) {
  return Container(
      width: Swidth * 0.4,
      height: Sheight * 0.03,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Text(Txt, style: TextStyle(color: Colors.grey[700])),
          Spacer(),
          Icon(Icons.search, color: Colors.grey[700]),
        ],
      ));
}
