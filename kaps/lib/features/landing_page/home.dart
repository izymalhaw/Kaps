import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kaps/features/authentication/presentation/bloc/Auth_bloc.dart';
import 'package:kaps/features/authentication/presentation/widgets/alertDialog.dart';
import 'package:kaps/features/landing_page/Info/presentation/bloc/info_blocs_bloc.dart';
import 'package:kaps/features/landing_page/Info/presentation/pages/history.dart';
import 'package:kaps/features/landing_page/Info/presentation/pages/profile.dart';
import 'package:kaps/features/landing_page/NavBar.dart';
import 'package:kaps/features/landing_page/dashboard/presentation/pages/dashboard.dart';
import 'package:kaps/features/landing_page/item_add/presentation/bloc/add_items_bloc.dart';
import 'package:kaps/features/landing_page/item_add/presentation/pages/AddItems.dart';
import 'package:kaps/info_dependecis.dart';
import 'package:kaps/injection_container.dart';
import 'package:shared_preferences/shared_preferences.dart';

class home extends StatefulWidget {
  home({super.key});
  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  String? phone;
  String? location;
  bool? val;
  FocusNode? _nbFocusNode;
  bool nbHasFocus = false;
  String selectedTile = 'Dash Board';
  String? name;
  String? profilePicture; // Default selected tile

  @override
  void initState() {
    super.initState();
    _nbFocusNode = FocusNode();
    _nbFocusNode?.addListener(_onNavBarFocusChanged);
  }

  void _onNavBarFocusChanged() {
    setState(() => nbHasFocus = _nbFocusNode?.hasFocus ?? false);
  }

  @override
  void dispose() {
    _nbFocusNode?.removeListener(_onNavBarFocusChanged);
    _nbFocusNode?.dispose();
    _nbFocusNode = null;
    super.dispose();
  }

  void _onTileSelected(String tileLabel) {
    setState(() {
      selectedTile = tileLabel;
    });
  }

  Future checker() async {
    final prefs = await SharedPreferences.getInstance();
    profilePicture = prefs.getString('ProfilePicture');
    val = prefs.getBool('user') ?? false;
    phone = prefs.getString('phone');
    location = prefs.getString('location');
    name = prefs.getString('name');
    return val;
  }

  @override
  Widget build(BuildContext context) {
    bool check = false;
    return WillPopScope(
      onWillPop: () async {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            shadowColor: Color.fromRGBO(215, 160, 34, 1),
            title: Text("Do you want to Exit?", style: GoogleFonts.aclonica()),
            content: SizedBox.shrink(),
            actions: [
              TextButton(
                child: Text("No", style: GoogleFonts.aclonica()),
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
              ),
              TextButton(
                child: Text("Yes", style: GoogleFonts.aclonica()),
                onPressed: () {
                  setState(() {
                    check = true;
                  });
                  SystemChannels.platform.invokeMethod('SystemNavigator.pop');
                },
              ),
            ],
          ),
        );
        return Future.value(check);
      },
      child: FutureBuilder(
          future: checker(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                if (val == true) {
                  return Scaffold(
                    drawer: NavBar(
                      onTileSelected: _onTileSelected,
                      name: name!,
                      Phone: phone!,
                      ImageCache: profilePicture!,
                    ),
                    appBar: AppBar(
                      toolbarHeight: MediaQuery.of(context).size.height * 0.05,
                      backgroundColor: Color.fromRGBO(215, 160, 34, 1),
                      title: Text(selectedTile, style: GoogleFonts.aclonica()),
                    ),
                    body: Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.05),
                      child: Container(
                        child: _renderSelectedWidget(),
                      ),
                    ),
                  );
                } else {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    Navigator.pushNamed(context, "/SignIn");
                  });
                  return SizedBox.shrink();
                }
              }
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }

  Widget _renderSelectedWidget() {
    switch (selectedTile) {
      case 'Dash Board':
        return DashBoard();
      case 'Add Items':
        return BlocProvider<AddItemsBloc>(
            create: (context) => sl<AddItemsBloc>(),
            child: AddItems(
              Phone: phone!,
              Location: location!,
            ));
      case 'History':
        return BlocProvider<InfoBlocsBloc>(
            create: (context) => sl3<InfoBlocsBloc>(),
            child: history(phone: phone!));
      case 'Profile':
        return profilePage();
      case 'logout':
        return BlocProvider(
          create: (context) => sl<AuthBloc>(),
          child: AlertDialogWidget(message: ""),
        );
      default:
        return DashBoard();
    }
  }
}
