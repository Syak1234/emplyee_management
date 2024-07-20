import 'package:flutter/material.dart';

class ColorPage {
  static const red = Color.fromARGB(255, 230, 35, 21);
  static const white = Colors.white;
  static const colorbg = Color.fromARGB(255, 221, 238, 248);
  static var colortheme = Color.fromRGBO(30, 31, 31, 1);
  static const buttoncolor1 = Color.fromARGB(255, 2, 1, 24);
  static var buttoncolor2 = Colors.blue[100];
  static BoxDecoration decoration = BoxDecoration(
    gradient: const LinearGradient(
      colors: [
        Color.fromARGB(255, 5, 103, 249),
        Colors.blue,
      ],
    ),
  );

  static const canvasColor = Color.fromRGBO(30, 31, 31, 1);
  static const elevation = 2.0;
}
