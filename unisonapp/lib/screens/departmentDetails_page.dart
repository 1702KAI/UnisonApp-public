import 'package:flutter/material.dart';
import '../components/registration/departmentDetails_form.dart';
import '../utils/config.dart';

class DepartmentDetailsScreen extends StatefulWidget {
  const DepartmentDetailsScreen({Key? key}) : super(key: key);
  @override
  State<DepartmentDetailsScreen> createState() =>
      _DepartmentDetailsScreenState();
}

class _DepartmentDetailsScreenState extends State<DepartmentDetailsScreen> {
// Store the selected department as a String
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
            const DepartmentDetailsForm(),
            
          ],
        ),
      ),
    );
  }
}
