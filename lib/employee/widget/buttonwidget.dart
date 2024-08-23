import 'package:employee_management/color/color.dart';
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
  //  void Function()? onChanged;
  Color color;
  double radius = 0.0;
  ButtonWidget(
    this.text,
    // this.child,
    this.onPressed, {
    this.padding = const EdgeInsets.only(right: 10),
    this.color = ColorPage.red,
    this.radius=0.0,
  
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: ElevatedButton(
        style: buttonStyle.copyWith(
            shape: MaterialStatePropertyAll(ContinuousRectangleBorder(
                borderRadius: BorderRadius.circular(radius))),
            backgroundColor: MaterialStatePropertyAll(color)),
        onPressed: onPressed,
        
        child: Text(
          text,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
