
import 'package:flutter/material.dart';

class Config{
  static MediaQueryData? mediaQueryData;
  static double? screenWidth;
  static double? screenHeight;


// these has to be initialized first as we need constant values for them
  void init(BuildContext context){
    mediaQueryData = MediaQuery.of(context);
    screenWidth = mediaQueryData!.size.width;
    screenHeight = mediaQueryData!.size.height;
  }

  // learnings about operators
  /* ! :  "postfix non-null assertion operator." It is used to assert to the Dart analyzer that a variable is non-nullable,
  even if its type suggests that it could be nullable. When you use ! after a nullable variable, 
  you are telling Dart that you are sure the value won't be null at runtime, 
  and the analyzer should not raise a null safety warning for that specific usage.

  " ? : null-aware operator" or "conditional access operator." It is used for checking nullability and performing operations accordingly 
  without causing a null pointer exception. The operator allows you to safely access properties or call methods on nullable objects.
  
   */


  static get widthSize => screenWidth!;
  static get heightSize => screenHeight!;

  static const spaceSmall = SizedBox(
    height: 25,);
  static final spaceMedium = SizedBox(
    height: screenHeight! * 0.05,);
  static final spaceLarge = SizedBox(
    height: screenHeight! * 0.08,);
static final spaceHuge = SizedBox(
  height: screenHeight != null ? screenHeight! * 0.1 : 0,
);
  
  final TextStyle helveticaFont = const TextStyle(
  fontFamily: 'Helvetica', // Set the font family to Helvetica
  fontSize: 16, // Set the desired font size
  fontWeight: FontWeight.normal, // Set the desired font weight
  // You can add more font properties here if needed
);


  //textform field border

  static const outlinedBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(8)),
  );

  static const focusBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(8)),
    borderSide: BorderSide(color: Color.fromARGB(255, 49, 114, 83),),
  );
  
  static const errorBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(8)),
    borderSide: BorderSide(color: Colors.red,),
  );


  static const primaryColor = Color(0xFFD0FC02);
  static const secondaryColor = Color(0xFF000000);
  
}

