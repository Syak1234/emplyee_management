import 'package:employee_management/tool/tool.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ButtonWidget extends StatelessWidget {
  EdgeInsetsGeometry padding;
  // Widget child;
  String text;
  void Function()? onPressed;
  ButtonWidget(
this.text,
    // this.child,
    this.onPressed, {
    this.padding = const EdgeInsets.only(right: 10),
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: ElevatedButton(
        style: buttonStyle,
        onPressed: onPressed,
        child: Text(
        text ,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
