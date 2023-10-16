import 'package:flutter/material.dart';
import 'package:unisonapp/animations/bouncingAnimation.dart';

import '../utils/config.dart';

class RegistrationSuccessPage extends StatefulWidget{
  const RegistrationSuccessPage({Key? key}) : super(key: key);

  @override
  State<RegistrationSuccessPage> createState() => _RegistrationSuccessPageState();
}

class _RegistrationSuccessPageState extends State<RegistrationSuccessPage> {
  
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
            const Center(
              child: Column(
                children: [
                  SizedBox(height: 400,),
                 MyAnimatedImage(),
                ],
              ),
            ),
            Config.spaceSmall,
          ],
        ),
      ),
    );
  }
}