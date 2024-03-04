import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kaps/features/authentication/domain/usecases/get_farmer_data.dart';
import 'package:kaps/features/authentication/presentation/bloc/Auth_bloc.dart';
import 'package:kaps/features/authentication/presentation/widgets/ElevatedBtns.dart';
import 'package:kaps/features/authentication/presentation/widgets/Switch.dart';
import 'package:kaps/features/authentication/presentation/widgets/TextFields.dart';
import 'package:kaps/features/authentication/presentation/widgets/constants.dart';
import 'package:kaps/injection_container.dart';
import 'package:kaps/l10n/bloc/language_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool isSwitched = true;
  bool status = false;
  String phone = "", password = "";

  @override
  Widget build(BuildContext context) {
    double Screen_height = MediaQuery.of(context).size.height;
    double Screen_width = MediaQuery.of(context).size.width;
    String selectedValue = "am";
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is LoadingAuthState) {
          Center(
            child: CircularProgressIndicator(
              color: AppColors['baseGoldenColor'],
            ),
          );
        } else if (state is AuthenticatedState) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("WORKING"),
          ));
          Navigator.pushReplacementNamed(context, '/home',
              arguments: selectedValue);
        } else if (state is ErrorAuthenticationState) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("ERROR"),
          ));
        }
      },
      child: Scaffold(
          body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(top: Screen_height * 0.1),
            child: Form(
              child: SingleChildScrollView(
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(children: [
                      Text(AppLocalizations.of(context)!.loginAccount, style: GoogleFonts.aclonica()),
                      const Spacer(),
                      Center(
                          child: DropdownButton(
                        icon: Icon(Icons.language),
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedValue = newValue!;
                            BlocProvider.of<LanguageBloc>(context)
                                .add(LanguageLoading(selectedValue));
                          });
                        },
                        items: <String>['en', 'am']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ))
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
                              Text(AppLocalizations.of(context)!.helloWelcome,
                                  style: GoogleFonts.aclonica()),
                              const SizedBox(height: 30),
                              Text(AppLocalizations.of(context)!.phone,
                                  style: GoogleFonts.aclonica()),
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
                                  onItemSelected: (value) {
                                    setState(
                                      () {
                                        phone = value.toString();
                                      },
                                    );
                                  },
                                  hintText: '+2519111111111',
                                  icons: Icons.phone,
                                  obscurity: false,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(AppLocalizations.of(context)!.password,
                                  style: GoogleFonts.aclonica()),
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
                                  onItemSelected: (value) {
                                    setState(
                                      () {
                                        password = value.toString();
                                      },
                                    );
                                  },
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
                            PrimaryColor: AppColors["baseGoldenColor"] ??
                                Color.fromRGBO(215, 160, 34, 1),
                            SecondaryColor: AppColors["grey"] ?? Colors.grey,
                            TextDisplay: AppLocalizations.of(context)!.signIn,
                            Onpressed: () {
                              BlocProvider.of<AuthBloc>(context).add(
                                  SignInEvent(
                                      PhoneNumber: phone, Password: password));
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            left: Screen_width * 0.1,
                            right: Screen_width * 0.1),
                        child: Row(children: <Widget>[
                          Expanded(
                              child: Divider(
                            thickness: 2,
                          )),
                          Text("  Don't have an account?   ",
                              style: GoogleFonts.aclonica()),
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
                            padding: EdgeInsets.fromLTRB(Screen_width * 0.1,
                                Screen_height * 0.0005, Screen_width * 0.1, 0),
                            child: SizedBox(
                              height: Screen_height * 0.075,
                              width: Screen_width * 0.9,
                              child: ElevatedBtns(
                                PrimaryColor: Colors.grey.shade300,
                                SecondaryColor: Colors.grey,
                                TextDisplay:
                                    AppLocalizations.of(context)!.signUp,
                                Onpressed: () {
                                  Navigator.pushNamed(context, '/SingUp');
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: Screen_height * 0.05),
                      Text(
                        'Purpose Black Ethiopia',
                        style: GoogleFonts.aclonica(),
                      ),
                      Text(
                        'V 0.0.1',
                        style: GoogleFonts.aclonica(),
                      ),
                    ],
                  )
                ]),
              ),
            ),
          )
        ],
      )),
    );
  }
}
