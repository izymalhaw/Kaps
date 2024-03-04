import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kaps/features/authentication/presentation/bloc/Auth_bloc.dart';

class AlertDialogWidget extends StatelessWidget {
  final String message;

  AlertDialogWidget({required this.message});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shadowColor: Color.fromRGBO(215, 160, 34, 1),
      title: Text("Do you want to logout?", style: GoogleFonts.aclonica()),
      content: SizedBox.shrink(),
      actions: [
        TextButton(
          child: Text("No", style: GoogleFonts.aclonica()),
          onPressed: () {
            Navigator.pushNamed(context, '/home');
          },
        ),
        TextButton(
          child: Text("yes", style: GoogleFonts.aclonica()),
          onPressed: () {
            BlocProvider.of<AuthBloc>(context).add(AuthLogoutRequested());
            Navigator.pushNamedAndRemoveUntil(
                context, "/SignIn", (route) => false);
          },
        ),
      ],
    );
  }
}
