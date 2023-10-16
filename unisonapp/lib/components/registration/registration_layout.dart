import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unisonapp/utils/config.dart';
import 'package:unisonapp/utils/formState_manager.dart';
import 'addressDetails_form.dart';
import 'bankingDetails_form.dart';
import 'personalDetails_form.dart';
import '../../data_classes/personalDetails_data.dart';

class RegistrationLayout extends StatefulWidget {
  const RegistrationLayout({Key? key}) : super(key: key);

  @override
  State<RegistrationLayout> createState() => _RegistrationLayoutState();
}

class _RegistrationLayoutState extends State<RegistrationLayout>
    with SingleTickerProviderStateMixin {
  int currentPage = 0;
  late TabController _tabController;
  late PersonalDetailsData personalDetailsData =
      Provider.of<PersonalDetailDataProvider>(context).personalDetailsData;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  // Define the changeTabIndex function here
  void changeTabIndex(int index) {
    setState(() {
      currentPage = index;
      _tabController.animateTo(currentPage);
    });
  }

  void validationChanged(bool isValid) {
    setState(() {
      if (isValid) {
        currentPage++;
        _tabController.animateTo(currentPage);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    final List<GlobalKey<FormState>> formKeys = [
      GlobalKey<FormState>(),
      GlobalKey<FormState>(),
      GlobalKey<FormState>(),
    ];
    final List<bool> formValidations = [false, false, false];

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
              onTap: (index) {
                // create a switch statement to handle the different cases
                if (index > 0 && !formValidations[index - 1]) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Please fill out the previous form first.'),
                    ),
                  );
                } else {
                  _tabController.animateTo(index);
                }
              },
              tabs: const [
                Tab(
                  text: 'Personal Details',
                ),
                Tab(
                  text: 'Address Details',
                ),
                Tab(
                  text: 'Banking Details',
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  KeepAliveWrapper(
                      key: formKeys[0],
                      child: PersonalDetailsForm(
                        onValidationChanged: validationChanged,
                        changeTabIndex: changeTabIndex,
                      )),
                  KeepAliveWrapper(
                      key: formKeys[1],
                      child: AddressDetailsForm(
                        onValidationChanged: validationChanged,
                        changeTabIndex: changeTabIndex,
                      )),
                  KeepAliveWrapper(
                      key: formKeys[2],
                      child: BankingDetailsForm(
                        onValidationChanged: validationChanged,
                        changeTabIndex: changeTabIndex,
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
