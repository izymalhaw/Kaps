import 'package:flutter/material.dart';

Widget SelectNav(
    Icon I, String T, Icon? F, BuildContext context, void Function()? func) {
  return GestureDetector(
    onTap: func ?? () {},
    child: Container(
      decoration: BoxDecoration(
          border: Border.all(color: Color.fromRGBO(251, 249, 249, 0))),
      child: Row(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.01,
          ),
          I,
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.05,
          ),
          Text(
            T,
            style: TextStyle(),
          ),
          Spacer(),
          F ?? SizedBox.shrink(),
        ],
      ),
    ),
  );
}
