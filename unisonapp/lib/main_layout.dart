// import 'dart:convert';

// import 'package:dio/dio.dart';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:unisonapp/providers/dio_provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:unisonapp/providers/dio_provider.dart';
import 'package:unisonapp/screens/home_page.dart';
import 'package:unisonapp/utils/config.dart';

import 'components/button.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({Key? key}) : super(key: key);

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  // Variable declaration
  int currentPage = 0;
  final PageController _page = PageController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  Map<String, dynamic> user = {};


  // Function to handle the logo click
  void _handleLogoClick() {
    _scaffoldKey.currentState?.openDrawer(); // Open the drawer
  }

    Future<void> getData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token') ?? '';

    if (token.isNotEmpty && token != '') {
      final response = await DioProvider().getUser(token);
      if (response != null) {
        setState(() {
          user = json.decode(response);
        });
      }
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  // Function to build the Drawer
Widget buildDrawer() {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          decoration: const BoxDecoration(
            color: Config.paintColor,
          ),
          child: Text(
            user['first_name'], // Remove 'const' here
            style: const TextStyle(
              color: Config.secondaryColor,
              fontSize: 24,
            ),
          ),
        ),
        ListTile(
          title: const Text('Tasks'),
          onTap: () {
            Navigator.pushNamed(context, 'viewTasks');
          },
        ),
        ListTile(
          title: const Text('Item 2'),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ],
    ),
  );
}


  // Function to open the drawer
  void _openCreateDrawer(BuildContext context) {
    showGeneralDialog(
        context: context,
        barrierDismissible: true,
        barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
        barrierColor: Colors.black.withOpacity(0.5),
        transitionDuration: const Duration(milliseconds: 300),
        pageBuilder: (context, animation1, animation2) {
          return Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Config.heightSize / 2,
              width: Config.widthSize,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: Column(
                children: [
                  Text(
                    'Create',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  Button(
                    width: double.infinity,
                    title: 'Tasks',
                    onPressed: () {
                      Navigator.pushNamed(context, 'createTasks');
                      // Handle "Tasks" button tap
                    },
                    disable: false,
                    textColor: Colors.black,

                  ),
                  Button(
                    width: double.infinity,
                    title: 'Contact',
                    onPressed: () {
                      // Handle "Contact" button tap
                    },
                    disable: false,
                    textColor: Colors.black,

                  ),
                  Button(
                    width: double.infinity,
                    title: 'Company',
                    onPressed: () {
                      // Handle "Company" button tap
                    },
                    disable: false,
                    textColor: Colors.black,

                  ),
                  Button(
                    width: double.infinity,
                    title: 'Email',
                    onPressed: () {
                      // Handle "Email" button tap
                    },
                    disable: false,
                    textColor: Colors.black,

                  ),
                  Button(
                    width: double.infinity,
                    title: 'Ticket',
                    onPressed: () {
                      // Handle "Ticket" button tap
                    },
                    disable: false,
                    textColor: Colors.black,

                  ),
                  Button(
                    width: double.infinity,
                    title: 'Social Post',
                    onPressed: () {
                      // Handle "Social Post" button tap
                    },
                    disable: false,
                    textColor: Colors.black,

                  ),
                ],
              ),
            ),
          );
        },
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: CustomScrollView(
        slivers: [
          // Define the app bar
          SliverAppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Home', style: TextStyle(color: Colors.black)),
                GestureDetector(
                  onTap: _handleLogoClick, // Handle the logo click
                  child: Image.asset(
                    'assets/logos/icon logo (1).png',
                    width: 40,
                  ),
                ),
              ],
            ),
            backgroundColor: Config.paintColor,
            elevation: 0, // Set the app bar color to white
          ),
          // Define the page content
          SliverFillRemaining(
            child: PageView(
              controller: _page,
              onPageChanged: (index) {
                setState(() {
                  currentPage = index;
                });
              },
              children: const <Widget>[
                HomePage(),
              ],
            ),
          ),
        ],
      ),
      drawer: buildDrawer(),
      bottomNavigationBar: Container(
        color: Config
            .primaryColor, // Set the background color of the BottomNavigationBar
        child: BottomNavigationBar(
          currentIndex: currentPage,
          selectedItemColor: const Color.fromARGB(
              255, 0, 0, 0), // Set your desired selected item color here
          unselectedItemColor: const Color.fromARGB(
              255, 0, 0, 0), // Set your desired unselected item color here
          onTap: (page) {
            if (page == 2) {
              // Open the create drawer
              _openCreateDrawer(context);
            } else if (page == 4) {
              // Open the menu drawer
              _scaffoldKey.currentState?.openDrawer();
            } else {
              setState(() {
                currentPage = page;
                _page.animateToPage(
                  page,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                );
              });
            }
          },
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.house),
              label: 'Home',
              backgroundColor: Config.primaryColor,
            ),
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.solidCalendarCheck),
              label: 'Appointments',
              backgroundColor: Config.primaryColor,
            ),
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.plus),
              label: 'Create',
              backgroundColor: Config.primaryColor,
            ),
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.message),
              label: 'Chat',
              backgroundColor: Config.primaryColor,
            ),
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.bars),
              label: 'Menu',
              backgroundColor: Config.primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
