
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../utils/config.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> medCat = [
    {"icon": FontAwesomeIcons.userDoctor, "Category": "General"},
    {"icon": FontAwesomeIcons.heartPulse, "Category": "Cardiology"},
    {"icon": FontAwesomeIcons.lungs, "Category": "Respirations"},
    {"icon": FontAwesomeIcons.hand, "Category": "Dermatology"},
    {"icon": FontAwesomeIcons.personPregnant, "Category": "Gynecology"},
    {"icon": FontAwesomeIcons.teeth, "Category": "Dental"},
  ];
  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return const Scaffold(
      backgroundColor: Colors.white,
        body: Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 15,
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Imeth',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Config.secondaryColor,
                    ),
                  ),
                  // SizedBox(
                  //     child: CircleAvatar(
                  //   radius: 30,
                  //   backgroundImage:
                  //       Image.asset('assets/profile-pics/imeth-prof.jpeg'),
                  // )),
                ],
              ),
              
            ],
          ),
        ),
      ),
    ));
  }
}
