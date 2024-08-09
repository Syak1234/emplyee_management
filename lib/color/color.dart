import 'package:flutter/material.dart';

class ColorPage {
  static const red = Color.fromARGB(255, 184, 15, 10);
  static const white = Colors.white;
  static const smallbuttoncolor = Color.fromARGB(255, 31, 84, 169);
  // static  const
  static const colorbg = Color.fromARGB(255, 221, 238, 248);
  static var colortheme = Color.fromARGB(255, 7, 22, 45);
  static var buttoncolor1 = Color.fromARGB(255, 7, 22, 45);
  static var buttoncolor2 = Colors.blue[100];
  static BoxDecoration decoration = BoxDecoration(
    gradient: const LinearGradient(
      colors: [ColorPage.red, ColorPage.red],
    ),
  );
static  const   green  =Colors.green;
  static const canvasColor = Color.fromARGB(255, 7, 22, 45);
  static const elevation = 2.0;
  static final decoration1 = BoxDecoration(boxShadow: [
    BoxShadow(
        color: Colors.grey,
        offset: Offset(0, 2),
        spreadRadius: -1,
        blurRadius: 5)
  ]);
}
