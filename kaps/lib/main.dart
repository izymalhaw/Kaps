import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:kaps/features/authentication/presentation/bloc/Auth_bloc.dart';
import 'package:kaps/features/authentication/presentation/pages/Signin.dart';
import 'package:kaps/features/authentication/presentation/pages/Signup.dart';
import 'package:kaps/features/landing_page/NavBar.dart';
import 'package:kaps/features/landing_page/dashboard/presentation/pages/dashboard.dart';
import 'package:kaps/features/landing_page/home.dart';
import 'package:kaps/features/landing_page/item_add/presentation/bloc/add_items_bloc.dart';
import 'package:kaps/features/landing_page/item_add/presentation/pages/AddItems.dart';
import 'package:kaps/info_dependecis.dart';
import 'package:kaps/injection_container.dart';
import 'package:kaps/items_dependencies.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:kaps/l10n/bloc/language_bloc.dart';
import 'package:kaps/splash.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  await InitializeDependecies();
  await ItemsInitializeDependecies();
  await InfoInitializeDependecies();
  runApp(BlocProvider(
    create: (context) => LanguageBloc(),
    child: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    BlocProvider.of<LanguageBloc>(context).add(LanguageLoading('en'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageBloc, LanguageState>(
      builder: (context, state) {
        if (state is LanguageLoadingState) {
          return MaterialApp(
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            locale: Locale(state.lang),
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            routes: {
              '/home': (context) => BlocProvider<AuthBloc>(
                    create: (context) => sl<AuthBloc>(),
                    child: home(),
                  ),
              '/AddItems': (context) => BlocProvider<AddItemsBloc>(
                    create: (context) => sl<AddItemsBloc>(),
                    child: AddItems(
                      Phone: '',
                      Location: '',
                    ),
                  ),
              '/SignIn': (context) => BlocProvider<AuthBloc>(
                    create: (context) => sl<AuthBloc>(),
                    child: const SignIn(),
                  ),
              '/SingUp': (context) => BlocProvider<AuthBloc>(
                    create: (context) => sl<AuthBloc>(),
                    child: const SignUp(),
                  ),
            },
            home: SplashScreen(),
          );
        }
        return MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: Locale('en'),
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          routes: {
            '/home': (context) => home(),
            '/AddItems': (context) => BlocProvider<AddItemsBloc>(
                  create: (context) => sl<AddItemsBloc>(),
                  child: AddItems(
                    Phone: '',
                    Location: '',
                  ),
                ),
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
            child: home(),
            //const DashBoard(),
          ),
        );
      },
    );
  }
}
