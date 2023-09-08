import 'package:flutter/material.dart';

import '../components/addressDetails_form.dart';
import '../components/bankingDetails_form.dart';
import '../components/personalDetails_form.dart';
import '../utils/config.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              alignment: Alignment.centerLeft,
              child: const Text(
                'Request an account',
                style: TextStyle(
                  fontFamily: 'helveticaFont',
                  color: Config.secondaryColor,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Config.spaceSmall,
            TabBar(
              controller: _tabController,
              labelColor: Config.secondaryColor,
              tabs: const [
                Tab(text: 'Personal Details',),
                Tab(text: 'Address Details'),
                Tab(text: 'Banking Details'),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: const [
                  PersonalDetailsForm(),
                  AddressDetailsForm(),
                  BankingDetailsForm(),
                ],
              ),
            ),
          ],);
        
  }
}