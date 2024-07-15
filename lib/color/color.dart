import 'package:flutter/material.dart';

class ColorPage {
  static const white = Colors.white;
  static const colorbg = Color.fromARGB(255, 221, 238, 248);
  static const colortheme = Color.fromARGB(255, 14, 14, 28);
  static const buttoncolor1 = Color.fromARGB(255, 6, 6, 223);
  static var buttoncolor2 = Colors.blue[100];
  static BoxDecoration decoration = BoxDecoration(
    gradient: const LinearGradient(
      colors: [
        Color.fromARGB(255, 5, 103, 249),
        Colors.blue,
      ],
    ),
  );

  static  const canvasColor = Color.fromARGB(255, 24, 31, 50);
}
