import 'package:employee_management/color/color.dart';
import 'package:flutter/material.dart';

class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton.filled(
            // style: ButtonStyle(
            // backgroundColor: MaterialStatePropertyAll(
            //     ColorPage.smallbuttoncolor)),
            color: ColorPage.white,
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back)),
      ],
    );
  }
}
