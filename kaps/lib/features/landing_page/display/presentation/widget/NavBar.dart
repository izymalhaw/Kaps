import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kaps/features/landing_page/display/presentation/widget/select_nav.dart';

typedef OnTileSelected = void Function(String tileLabel);

class NavBar extends StatefulWidget {
  final OnTileSelected onTileSelected;
  final String name;
  final String Phone; // Changed to lowerCamelCase
  final String ImageCache; // Changed to lowerCamelCase

  NavBar({
    Key? key,
    required this.onTileSelected,
    required this.name,
    required this.Phone, // Changed to lowerCamelCase
    required this.ImageCache, // Changed to lowerCamelCase
  }) : super(key: key);

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  String selectedLanguage = 'English';
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          ListTile(
            title: Row(
              children: [
                Icon(Icons.arrow_back),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.2,
                ),
                Text(
                  "Setting",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            onTap: () => {},
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          ListTile(
            title:
                Text('General', style: TextStyle(fontWeight: FontWeight.bold)),
            onTap: () => (),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          Padding(
            padding: EdgeInsets.fromLTRB(
                MediaQuery.of(context).size.width * 0.02,
                0,
                MediaQuery.of(context).size.width * 0.02,
                0),
            child: Column(
              children: [
                SelectNav(Icon(Icons.logout), "Agent Registration",
                    Icon(Icons.arrow_forward_ios), context, () {
                  Navigator.pushNamed(context, '/SignIn');
                }),
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),

                // Default value

                SelectNav(Icon(Icons.language_outlined), "Language",
                    Icon(Icons.arrow_forward_ios), context, () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Select Language'),
                        content: DropdownButton<String>(
                          value: selectedLanguage,
                          elevation: 16,
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedLanguage = newValue!;
                            });
                            Navigator.of(context).pop(); // Close the dialog
                          },
                          items: <String>['English', 'Amharic']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      );
                    },
                  );
                }),
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                SelectNav(Icon(Icons.lock_outline), "Security",
                    Icon(Icons.arrow_forward_ios), context, null),
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          ListTile(
            title: Text(
              "Preferences",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(
                MediaQuery.of(context).size.width * 0.02,
                0,
                MediaQuery.of(context).size.width * 0.02,
                0),
            child: Column(children: [
              SelectNav(Icon(Icons.live_help_outlined), "Help & Support", null,
                  context, null),
            ]),
          ),
        ],
      ),
    );
  }
}
