import 'package:flutter/cupertino.dart';
import 'package:unisonapp/components/button.dart';
import 'package:unisonapp/utils/config.dart';

class MyAnimatedImage extends StatefulWidget {
  const MyAnimatedImage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyAnimatedImageState createState() => _MyAnimatedImageState();
}

class _MyAnimatedImageState extends State<MyAnimatedImage> {
  bool showText = false;
  double _logoYPosition = 0.0;

  @override
  void initState() {
    super.initState();
    // Delay showing the text for 2 seconds
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        showText = true;
      });
    });

    // Animate the logo bounce for 2 seconds
    Future.delayed(const Duration(seconds: 2), () {
      for (int i = 0; i < 5; i++) {
        Future.delayed(Duration(milliseconds: 200 * i), () {
          setState(() {
            _logoYPosition = -30.0; // Move the logo up
          });
        });
        Future.delayed(Duration(milliseconds: 200 * i + 100), () {
          setState(() {
            _logoYPosition = 0.0; // Bring the logo back down
          });
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut,
            transform: Matrix4.translationValues(0, _logoYPosition, 0),
            child: Image.asset(
              'assets/logos/Metana Logo - Black.png',
              width: 250,
            ),
          ),
          const SizedBox(height: 20),
          AnimatedOpacity(
            opacity: showText ? 1.0 : 0.0,
            duration: const Duration(seconds: 1),
            child: const Text(
              'Check your email for your workspace credentials',
              style: TextStyle(fontSize: 20),
            ),
          ),
          Config.spaceSmall,
          Button(
              width: 200,
              title: 'Login',
              onPressed: () {
                Navigator.pushNamed(context, '/');
              },
              disable: false)
        ],
      ),
    );
  }
}
