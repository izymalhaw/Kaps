import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kaps/features/authentication/presentation/widgets/ElevatedBtns.dart';
import 'package:kaps/features/authentication/presentation/widgets/Switch.dart';
import 'package:kaps/features/authentication/presentation/widgets/TextFields.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool isSwitched = true;

  bool status = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 70),
          child: Form(
            child: SingleChildScrollView(
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(children: [
                    Text('Login Account',
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w600, fontSize: 17)),
                    const Spacer(),
                    Center(
                      child: SwitchWidget(
                          isSwitched: isSwitched,
                          onSwitchChanged: (value) {
                            isSwitched = value;
                          }),
                    )
                  ]),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Hello, Welcome back to your account',
                              style: GoogleFonts.inter(
                                  fontSize: 14.5,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                            ),
                            const SizedBox(height: 30),
                            Text(
                              'Phone Number',
                              style: GoogleFonts.inter(
                                  fontSize: 16, color: Colors.black),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: MyTextField(
                                checkValidity: (value) {
                                  return value!.isEmpty
                                      ? 'Phone cant be empty'
                                      : null;
                                },
                                onItemSelected: (value) {},
                                hintText: '+2519111111111',
                                icons: Icons.phone,
                                obscurity: false,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Password',
                              style: GoogleFonts.inter(
                                  fontSize: 16, color: Colors.black),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: MyTextField(
                                checkValidity: (value) {
                                  return value!.isEmpty
                                      ? 'Password cant be Empty'
                                      : null;
                                },
                                onItemSelected: (value) {},
                                hintText: '*********',
                                icons: Icons.lock_outline,
                                obscurity: true,
                              ),
                            ),
                          ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SizedBox(
                        height: 60,
                        width: 325,
                        child: ElevatedBtns(
                          PrimaryColor: Colors.yellow,
                          SecondaryColor: Colors.grey,
                          TextDisplay: 'SignIn',
                          Onpressed: () {},
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: Row(children: <Widget>[
                        Expanded(
                            child: Divider(
                          thickness: 2,
                        )),
                        Text("  Don't have an account?   "),
                        Expanded(
                            child: Divider(
                          thickness: 2,
                        )),
                      ]),
                    ),
                    Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(30, 20, 20, 20),
                          child: SizedBox(
                            height: 60,
                            width: 325,
                            child: ElevatedBtns(
                              PrimaryColor: Colors.grey.shade300,
                              SecondaryColor: Colors.grey,
                              TextDisplay: 'SignUp',
                              Onpressed: () {},
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 90),
                    Text(
                      'Purpose Black Ethiopia',
                      style: GoogleFonts.inter(
                          fontSize: 12, color: Colors.grey.shade300),
                    ),
                    Text(
                      'V 0.0.1',
                      style: GoogleFonts.inter(
                          fontSize: 12, color: Colors.grey.shade300),
                    ),
                  ],
                )
              ]),
            ),
          ),
        )
      ],
    ));
  }
}
