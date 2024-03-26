import 'dart:async';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:kaps/features/authentication/presentation/bloc/Auth_bloc.dart';
import 'package:kaps/features/authentication/presentation/widgets/text.dart';
import 'package:status_alert/status_alert.dart';

import '../widgets/ElevatedBtns.dart';
import '../widgets/TextFields.dart';
import '../widgets/constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignInState();
}

class _SignInState extends State<SignUp> {
  String? fullName;
  String? phoneNumber;
  String? password;
  String? location;
  File? Imgs;
  Uint8List? fileBytes;
  String? fileName;
  String? ftext;

  Future pickFile() async {}

  @override
  Widget build(BuildContext context) {
    AuthBloc authBloc = BlocProvider.of<AuthBloc>(context);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthenticatedState) {
          StatusAlert.show(context,
              duration: Duration(seconds: 3),
              title: 'Successfull',
              subtitle: 'Account Created!',
              configuration: const IconConfiguration(icon: Icons.done),
              maxWidth: width * 0.7);
          Timer(const Duration(seconds: 2), () {
            Navigator.pushNamed(context, "/SignIn");
          });
        } else if (state is ErrorAuthenticationState) {
          StatusAlert.show(context,
              duration: Duration(seconds: 3),
              title: 'Error',
              subtitle: 'Try again!',
              configuration: const IconConfiguration(icon: Icons.error),
              maxWidth: width * 0.7);
          Timer(const Duration(seconds: 2), () {
            Navigator.pushNamed(context, "/SingUp");
          });
        }
      },
      child: Scaffold(
          body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 80),
            child: Form(
              key: null,
              child: SingleChildScrollView(
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Text(AppLocalizations.of(context)!.signUp,
                        style: GoogleFonts.aclonica(fontSize: 30)),
                  ),
                  BlocListener<AuthBloc, AuthState>(
                    listener: (context, state) {
                      if (state is FoundProfileImageState) {
                        setState(() {});
                        Imgs = state.image;
                      } else if (state is ImageError) {
                        StatusAlert.show(context,
                            duration: Duration(seconds: 3),
                            title: 'File not Supported',
                            subtitle: 'Not Supported',
                            configuration:
                                const IconConfiguration(icon: Icons.done),
                            maxWidth: 260);
                        Timer(const Duration(seconds: 2), () {
                          Navigator.pushNamed(context, "/SingUp");
                        });
                      } else {}
                    },
                    child: Center(
                      child: InkWell(
                          child: Imgs != null
                              ? Container(
                                  height: 120,
                                  width: 120,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color: Color.fromRGBO(215, 160, 34, 1),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
                                    child: Image.file(
                                      Imgs!,
                                      fit: BoxFit.fill,
                                    ),
                                  ))
                              : Stack(children: [
                                  Container(
                                    height: 120,
                                    width: 120,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      color: Color.fromRGBO(215, 160, 34, 1),
                                    ),
                                    child: Stack(
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          child: null,
                                        ),
                                        Center(
                                          child: Center(
                                            child: Icon(Icons.add_a_photo),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ]),
                          onTap: () {
                            authBloc.add(ProfileImagePickerEvent());
                          }),
                    ),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                            width * 0.02, 0, width * 0.02, 0),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 20),
                              Text(AppLocalizations.of(context)!.fullname,
                                  style: GoogleFonts.aclonica()),
                              SizedBox(
                                  width: double.infinity,
                                  child: MyTextField(
                                    onItemSelected: (value) {
                                      setState(() {
                                        fullName = value;
                                      });
                                    },
                                    hintText: 'Ato.Egele',
                                    icons: Icons.person_2_outlined,
                                    checkValidity: (value) {
                                      return null;
                                    },
                                    obscurity: false,
                                  )),
                              Text(AppLocalizations.of(context)!.phone,
                                  style: GoogleFonts.aclonica()),
                              SizedBox(
                                width: double.infinity,
                                child: MyTextField(
                                    onItemSelected: (value) {
                                      setState(() {
                                        phoneNumber = value;
                                      });
                                    },
                                    hintText: "+251900000000",
                                    icons: Icons.phone_outlined,
                                    checkValidity: (value) {
                                      return null;
                                    },
                                    obscurity: false),
                              ),
                              Text(AppLocalizations.of(context)!.password,
                                  style: GoogleFonts.aclonica()),
                              SizedBox(
                                width: double.infinity,
                                child: MyTextField(
                                    onItemSelected: (value) {
                                      setState(() {
                                        password = value;
                                      });
                                    },
                                    hintText: "*********",
                                    icons: Icons.lock_outline,
                                    checkValidity: (value) {
                                      return null;
                                    },
                                    obscurity: true),
                              ),
                              Row(
                                children: [
                                  BlocListener<AuthBloc, AuthState>(
                                    listener: (context, state) {
                                      if (state is LocationLoadingState) {
                                        location = "Loading...";
                                      } else if (state is FoundLocationState) {
                                        setState(() {});
                                        location = state.Address;
                                      } else {}
                                    },
                                    child: Container(
                                      width: width * 0.5,
                                      child: ElevatedBtns(
                                        PrimaryColor:
                                            AppColors["baseGoldenColor"]!,
                                        SecondaryColor: AppColors["white"]!,
                                        TextDisplay: location ??
                                            AppLocalizations.of(context)!
                                                .mylocation,
                                        Onpressed: () {
                                          authBloc.add(GetLocationEvent());
                                          //use bloc here
                                        },
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: width * 0.01,
                                  ),
                                  BlocListener<AuthBloc, AuthState>(
                                    listener: (context, state) {
                                      if (state is FilePickerState) {
                                        setState(() {
                                          fileBytes = state.fileBytes;
                                          fileName = state.fileName;
                                          ftext = "loaded";
                                        });
                                      } else if (state is FileError) {
                                        ftext = "try again";
                                      } else {}
                                    },
                                    child: Container(
                                      width: width * 0.4,
                                      child: ElevatedBtns(
                                          PrimaryColor:
                                              AppColors["baseGoldenColor"]!,
                                          SecondaryColor: AppColors["white"]!,
                                          TextDisplay: ftext ??
                                              AppLocalizations.of(context)!
                                                  .files,
                                          Onpressed: () {
                                            authBloc.add(FilePickerEvent());
                                          }),
                                    ),
                                  )
                                ],
                              )
                            ]),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: SizedBox(
                          height: 60,
                          width: 350,
                          child: ElevatedBtns(
                            PrimaryColor: AppColors["baseGoldenColor"]!,
                            SecondaryColor: AppColors['white']!,
                            TextDisplay: AppLocalizations.of(context)!.signUp,
                            Onpressed: () {
                              showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SingleChildScrollView(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            Text(
                                              text,
                                              style: GoogleFonts.aclonica(
                                                  color: Colors.black),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          0.25),
                                              child: SizedBox(
                                                height: 50,
                                                width: 150,
                                                child: ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15)),
                                                    backgroundColor:
                                                        Colors.green,
                                                    shadowColor:
                                                        AppColors['white']!,
                                                  ),
                                                  onPressed: () {
                                                    authBloc.add(SignUpEvent(
                                                      fullName!,
                                                      phoneNumber!,
                                                      location!,
                                                      Imgs!,
                                                      fileBytes,
                                                      fileName,
                                                      password!,
                                                    ));
                                                  },
                                                  child: Icon(Icons.check,
                                                      color:
                                                          AppColors['white']!),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Already have an account?",
                              style: GoogleFonts.aclonica()),
                          InkWell(
                            onTap: () {
                              Navigator.pushNamedAndRemoveUntil(
                                  context, '/SignIn', (route) => false);
                            },
                            child: Text(AppLocalizations.of(context)!.signIn,
                                style:
                                    GoogleFonts.aclonica(color: Colors.blue)),
                          )
                        ],
                      ),
                    ],
                  ),
                ]),
              ),
            ),
          )
        ],
      )),
    );
  }
}
