import 'package:animated_icon/animated_icon.dart';
import 'package:employee_management/color/color.dart';
import 'package:employee_management/employee/empdrawer.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AppBar(
              toolbarHeight: 65,
              automaticallyImplyLeading: false,
              backgroundColor: canvasColor,
              title: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/app_icon/exa1.jpg'),
                    radius: 28,
                  ),
                  Container(
                    // width: 300,
                    child: Text(
                      ' Nexa CRM',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ],
              ),
              actions: [
                // CircleAvatar()
                AnimateIcon(
                  key: UniqueKey(),
                  onTap: () {},
                  iconType: IconType.continueAnimation,
                  height: 70,
                  width: 70,
                  color: ColorPage.buttoncolor1,
                  animateIcon: AnimateIcons.bell,
                )
              ],);
  }
  
}