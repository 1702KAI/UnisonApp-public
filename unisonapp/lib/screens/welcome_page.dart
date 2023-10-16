import 'package:flutter/material.dart';
import 'package:unisonapp/components/button.dart';
import 'package:unisonapp/utils/config.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);
  static const String routeName = '/welcome';

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
            child:Center(
              child: Column(
                children: <Widget>[
                  Config.spaceHuge,
                  Config.spaceHuge,
                  Config.spaceMedium,
                  Image.asset('assets/logos/Metana Logo - Black.png',width: 300,),
                  Config.spaceMedium,
                  const Text(
                    'Hey! Welcome',
                    style: TextStyle(
                      fontFamily: 'helveticaFont',
                      color: Config.secondaryColor,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Config.spaceSmall,
                  Container(
                    alignment: Alignment.center,
                    child: const Text(
                    'We are excited to have you onboard our team, \nLet\'s Freaking Go!',
                    style: TextStyle(
                      fontFamily: 'helveticaFont',
                      color: Config.secondaryColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    
                    ),
                  ),
                  ),
                  Config.spaceMedium,
                  Button(
                    width: 200, 
                    title: "Get Started", 
                    onPressed: (){
                      Navigator.pushNamed(context, 'register');
                    }, 
                    textColor: Config.secondaryColor,
                    disable: false,)
                  
                ],
              ),
            ), 
          ),
    );
  }
}
