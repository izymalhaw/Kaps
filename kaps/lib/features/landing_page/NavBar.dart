import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';

typedef OnTileSelected = void Function(String tileLabel);

class NavBar extends StatelessWidget {
  final OnTileSelected onTileSelected;
  final String name;
  final String Phone;
  final String ImageCache;

  const NavBar({
    Key? key,
    required this.onTileSelected,
    required this.name,
    required this.Phone,
    required this.ImageCache,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(name, style: GoogleFonts.aclonica()),
            accountEmail: Text(Phone, style: GoogleFonts.aclonica()),
            decoration: BoxDecoration(
              color: Color.fromRGBO(215, 160, 34, 1),
            ),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://kaps-api.purposeblacketh.com/" + ImageCache),
            ),
          ),
          ListTile(
            title: Text(AppLocalizations.of(context)!.dashboard,
                style: GoogleFonts.aclonica()),
            splashColor: Color.fromRGBO(215, 160, 34, 1),
            onTap: () => onTileSelected('DashBoard'),
          ),
          ListTile(
            title: Text(AppLocalizations.of(context)!.addItems,
                style: GoogleFonts.aclonica()),
            onTap: () => onTileSelected('Add Items'),
          ),
          ListTile(
            title: Text(AppLocalizations.of(context)!.history,
                style: GoogleFonts.aclonica()),
            onTap: () => onTileSelected('History'),
          ),
          ListTile(
            title: Text(AppLocalizations.of(context)!.profile,
                style: GoogleFonts.aclonica()),
            onTap: () => onTileSelected('Profile'),
          ),
          ListTile(
            title: Text(AppLocalizations.of(context)!.logout,
                style: GoogleFonts.aclonica()),
            onTap: () => onTileSelected('logout'),
          ),
          // Add more tiles as needed
        ],
      ),
    );
  }
}
