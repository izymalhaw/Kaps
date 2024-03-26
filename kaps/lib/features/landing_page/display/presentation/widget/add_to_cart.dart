import 'package:flutter/material.dart';

Widget Addtocart(String add) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      color: Color.fromRGBO(215, 160, 34, 1),
    ),
    child: Row(children: [
      SizedBox(width: 10),
      Text(
        add,
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
      ),
      Icon(Icons.add, color: Colors.white),
      SizedBox(width: 10),
    ]),
  );
}
