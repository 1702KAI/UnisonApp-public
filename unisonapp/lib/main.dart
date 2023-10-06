

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unisonapp/data_classes/addressDetails_data.dart';
import 'package:unisonapp/data_classes/personalDetails_data.dart';
import 'package:unisonapp/components/registration/registration_layout.dart';
import 'package:unisonapp/screens/auth_page.dart';
import 'package:unisonapp/screens/createTasks_page.dart';
import 'package:unisonapp/screens/departmentDetails_page.dart';
import 'package:unisonapp/screens/registrationSuccess_page.dart';
import 'package:unisonapp/screens/welcome_page.dart';
import 'package:unisonapp/utils/config.dart';

import 'components/tasks/tasksView_page.dart';
import 'data_classes/bankDetails_data.dart';
import 'data_classes/departmentDetails_data.dart';
import 'main_layout.dart';
import 'models/authModel.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthModel> (create: (context) => AuthModel()),
        ChangeNotifierProvider.value(value: PersonalDetailDataProvider()),
        ChangeNotifierProvider.value(value: AddressDetailsDataProvider()),
        ChangeNotifierProvider.value(value: BankDetailsDataProvider()),
        ChangeNotifierProvider.value(value: DepartmentDetailsDataProvider()),
      ],
      child: const MyApp(),
    ),
  );

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
              floatingLabelStyle: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
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
        'departmentPage':(context) => const DepartmentDetailsScreen(),
        'registrationSuccess':(context) => const RegistrationSuccessPage(),
        'createTasks':(context) => const CreateTasks(),
        'viewTasks':(context) => const TaskListPage(),
      },
    );
  }
}


