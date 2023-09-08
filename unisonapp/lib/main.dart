
import 'package:flutter/material.dart';
import 'package:unisonapp/registration_layout.dart';
import 'package:unisonapp/screens/auth_page.dart';
import 'package:unisonapp/screens/welcome_page.dart';
import 'package:unisonapp/utils/config.dart';

import 'main_layout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  //for push navigator
  static final navigatorKey = GlobalKey<NavigatorState>();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      title: 'Flutter Doctor App',
      theme: ThemeData(
          //pre -dfiner input decoration
          inputDecorationTheme: const InputDecorationTheme(
              labelStyle: TextStyle(color: Config.secondaryColor),
              focusColor: Config.primaryColor,
              border: Config.outlinedBorder,
              focusedBorder: Config.focusBorder,
              errorBorder: Config.errorBorder,
              enabledBorder: Config.outlinedBorder,
              floatingLabelStyle: TextStyle(color: Config.primaryColor),
              prefixIconColor: Colors.black38),
              scaffoldBackgroundColor: Colors.white,
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
              backgroundColor: Config.primaryColor,
              selectedItemColor: Colors.white,
              showSelectedLabels: true,
              showUnselectedLabels: false,
              unselectedItemColor: Colors.grey.shade700,
              elevation: 10,
              type: BottomNavigationBarType.fixed,
          )),
      darkTheme: ThemeData.dark(), // standard dark theme
      themeMode: ThemeMode.system,
      initialRoute: '/', 
      routes: {
        //this is the initial route of the app
        '/': (context) => const AuthPage(),
        'main': (context) => const MainLayout(),
        'register' :(context) =>  const RegistrationLayout(),
        'welcome':(context) => const WelcomePage(),
      },
    );
  }
}


