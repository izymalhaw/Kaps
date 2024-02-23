import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kaps/features/authentication/presentation/bloc/Auth_bloc.dart';
import 'package:kaps/features/authentication/presentation/pages/Signin.dart';
import 'package:kaps/features/authentication/presentation/pages/Signup.dart';
import 'package:kaps/features/landing_page/dashboard/presentation/pages/dashboard.dart';
import 'package:kaps/injection_container.dart';

void main() async {
  await InitializeDependecies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      routes: {
        '/SignIn': (context) => BlocProvider<AuthBloc>(
              create: (context) => sl<AuthBloc>(),
              child: const SignIn(),
            ),
        '/SingUp': (context) => BlocProvider<AuthBloc>(
              create: (context) => sl<AuthBloc>(),
              child: const SignUp(),
            ),
      },
      home: BlocProvider<AuthBloc>(
        create: (context) => sl<AuthBloc>(),
        child: const DashBoard(),
      ),
    );
  }
}
