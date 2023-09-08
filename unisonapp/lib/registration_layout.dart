import 'package:flutter/material.dart';
import 'package:unisonapp/components/bankingDetails_form.dart';
import 'package:unisonapp/components/personalDetails_form.dart';
import 'package:unisonapp/utils/config.dart';

import 'components/addressDetails_form.dart';


class RegistrationLayout extends StatefulWidget {
  const RegistrationLayout({Key? key}) : super(key: key);

  @override
  State<RegistrationLayout> createState() => _RegistrationLayoutState();
}

class _RegistrationLayoutState extends State<RegistrationLayout>
    with SingleTickerProviderStateMixin {
  int currentPage = 0;
  // final PageController _page = PageController();
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
    Config().init(context);
    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        body: SafeArea(
            child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Config.spaceHuge,
            Center(
              child: Column(
                children: [
                  Image.asset(
                    'assets/logos/Metana Logo - Black.png',
                    width: 250,
                  ),
                ],
              ),
            ),
            Config.spaceSmall,
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
          ],
        )));
  }
}




