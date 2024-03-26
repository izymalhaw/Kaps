import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

Widget Loading(BuildContext context) {
  return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/kaps_splash.png"),
            fit: BoxFit.cover),
      ),
      child: Column(
        children: [
          Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.7),
            child: Container(
              child: LoadingAnimationWidget.bouncingBall(
                color: Color.fromRGBO(215, 160, 34, 1),
                size: MediaQuery.of(context).size.height * 0.15,
              ),
            ),
          ),
        ],
      ));
}
