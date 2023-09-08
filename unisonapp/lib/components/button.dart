import 'package:flutter/material.dart';

import '../utils/config.dart';

class Button extends StatelessWidget {
  final double width;
  final String title;
  final Function() onPressed;
  final bool disable;
  final Color? textColor;

  const Button({
    Key? key,
    required this.width,
    required this.title,
    required this.onPressed,
    required this.disable,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Config.primaryColor,
          foregroundColor: textColor ?? Colors.white,
        ),
        onPressed: disable ? null : onPressed,
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}