import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  bool? val;

  Future checker() async {
    final prefs = await SharedPreferences.getInstance();
    val = prefs.getBool('user') ?? false;
    return val;
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    Future.delayed(Duration(seconds: 5), () {
      Navigator.of(context).pushReplacementNamed('/home');
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: SystemUiOverlay.values,
    );
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: checker(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Scaffold(
                body: Center(
              child: Container(
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
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.7),
                        child: Container(
                          child: LoadingAnimationWidget.bouncingBall(
                            color: Color.fromRGBO(215, 160, 34, 1),
                            size: MediaQuery.of(context).size.height * 0.15,
                          ),
                        ),
                      ),
                    ],
                  )),
            ));
          } else if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              if (val == true) {
                return Scaffold(
                    body: Center(
                  child: Container(
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
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.7),
                            child: Container(
                              child: LoadingAnimationWidget.bouncingBall(
                                color: Color.fromRGBO(215, 160, 34, 1),
                                size: MediaQuery.of(context).size.height * 0.15,
                              ),
                            ),
                          ),
                        ],
                      )),
                ));
              } else {
                return Scaffold(
                    body: Center(
                  child: Container(
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
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.7),
                            child: Container(
                              child: LoadingAnimationWidget.bouncingBall(
                                color: Color.fromRGBO(215, 160, 34, 1),
                                size: MediaQuery.of(context).size.height * 0.15,
                              ),
                            ),
                          ),
                        ],
                      )),
                ));
              }
            }
          }
          return Scaffold(
              body: Center(
            child: Container(
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
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.7),
                      child: Container(
                        child: LoadingAnimationWidget.bouncingBall(
                          color: Color.fromRGBO(215, 160, 34, 1),
                          size: MediaQuery.of(context).size.height * 0.15,
                        ),
                      ),
                    ),
                  ],
                )),
          ));
        });
  }
}
