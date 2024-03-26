import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Widget Catagories(String cats, double Sheight) {
  return Container(
      height: Sheight * 0.04,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(cats),
      ));
}
