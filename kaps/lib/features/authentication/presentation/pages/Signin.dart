import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool isSwitched = true;

  bool status = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 70),
          child: Form(
            // key: _formKey,
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
                      child: Switch(
                        value: isSwitched,
                        onChanged: (value) {
                          setState(() {
                            isSwitched = value;
                            print(isSwitched);
                          });
                        },
                        activeTrackColor: Colors.yellow,
                        activeColor: Colors.white,
                        inactiveThumbColor: Colors.white,
                        inactiveTrackColor: Colors.yellow,
                      ),
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
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                controller: TextEditingController(
                                    text: ""), //agent.email),
                                onChanged: (value) {
                                  /* agent.phone = value;
                                  phone = value; */
                                },
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Enter something';
                                  }
                                  // else if (!RegExp(r"^\+[1-9]{1}[0-9]{7,11}$")
                                  //     .hasMatch(value)) {
                                  //   return 'Invalid Phone Number';
                                  // }0
                                  else {
                                    return null;
                                  }
                                },
                                decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 15),
                                    prefixIcon: const Icon(
                                      Icons.phone,
                                      color: Colors.grey,
                                    ),
                                    hintText: '+25191234567831',
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                            color: Colors.grey)),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                            color: Colors.grey)),
                                    errorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                            color: Colors.red)),
                                    focusedErrorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                            color: Colors.red))),
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
                          ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 0, 30, 20),
                      child: TextFormField(
                        // obscureText: true,
                        controller:
                            TextEditingController(text: ""), //agent.email),
                        onChanged: (value) {
                          //agent.password = value;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Value can't be empty";
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 15),
                          prefixIcon: const Icon(
                            Icons.lock_outline,
                            color: Colors.grey,
                          ),
                          hintText: '*********',
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color: Colors.grey)),
                          errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color: Colors.red)),
                          focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color: Colors.red)),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SizedBox(
                        height: 60,
                        width: 325,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              backgroundColor: Colors.yellow,
                              shadowColor: Colors.grey),
                          onPressed: () {
                            /* if (_formKey.currentState!.validate()) {
                              save();
                            } else {
                              // ignore: avoid_print
                              print('not ok');
                            } */
                          },
                          child: Text(
                            'SignIn',
                            style: GoogleFonts.inter(
                                fontSize: 18, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    Container(
                        child: status
                            ? const Column(
                                children: [
                                  Text(
                                    'Incorrect Credential',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  )
                                ],
                              )
                            : const Text('')),
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
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15)),
                                  backgroundColor: Colors.grey.shade300,
                                  shadowColor: Colors.grey),
                              onPressed: () {
                                /* Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const SignUp())); */
                              },
                              child: Text(
                                'SignUp',
                                style: GoogleFonts.inter(
                                    fontSize: 18, color: Colors.white),
                              ),
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
