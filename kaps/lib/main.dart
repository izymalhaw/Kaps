import 'package:flutter/material.dart';
import 'package:kaps/features/authentication/presentation/pages/Signin.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      routes: {
        '/SignIn':(context)=>const SignIn(),
      },
      home: SignIn(),
    );
  }
}