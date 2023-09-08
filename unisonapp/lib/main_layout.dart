import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:font_awesome_flutter/font_awesome_flutter.dart'
    show FaIcon, FontAwesomeIcons;
import 'package:unisonapp/screens/home_page.dart';
import 'package:unisonapp/utils/config.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({Key? key}) : super(key: key);

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  //variable declaration
  int currentPage = 0;
  final PageController _page = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
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
     bottomNavigationBar: Container(
  color: Config.primaryColor,// Set the background color of the BottomNavigationBar
  child: BottomNavigationBar(
    currentIndex: currentPage,
    selectedItemColor: Color.fromARGB(255, 0, 0, 0), // Set your desired selected item color here
    unselectedItemColor: const Color.fromARGB(255, 0, 0, 0), // Set your desired unselected item color here
    onTap: (page) {
      setState(() {
        currentPage = page;
        _page.animateToPage(
          page,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      });
    },
    items: const <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: FaIcon(FontAwesomeIcons.house),
        label: 'Home',
        backgroundColor: Config.primaryColor
      ),
      BottomNavigationBarItem(
        icon: FaIcon(FontAwesomeIcons.solidCalendarCheck),
        label: 'Appointments',
        backgroundColor: Config.primaryColor

      ),
      BottomNavigationBarItem(
        icon: FaIcon(FontAwesomeIcons.plus),
        label: 'Create',
        backgroundColor: Config.primaryColor

      ),
      BottomNavigationBarItem(
        icon: FaIcon(FontAwesomeIcons.message),
        label: 'Chat',
        backgroundColor: Config.primaryColor

      ),
      BottomNavigationBarItem(
        icon: FaIcon(FontAwesomeIcons.bars),
        label: 'Menu',
        backgroundColor: Config.primaryColor
      ),
    ],
  ),
),
      
    );
  }
}
