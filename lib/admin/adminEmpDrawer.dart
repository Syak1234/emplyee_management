import 'package:employee_management/color/color.dart';
import 'package:employee_management/employee/empdrawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sidebarx/sidebarx.dart';

import '../getx/getx.dart';
import 'adminProjectDrawer.dart';

class AdminEmpDrawer extends StatelessWidget {
  AdminEmpDrawer({
    Key? key,
    required SidebarXController controller,
  })  : _controller = controller,
        super(key: key);

  final SidebarXController _controller;
  Getx getx = Get.put(Getx());
  @override
  Widget build(BuildContext context) {
    return SidebarX(
      controller: _controller,
      theme: SidebarXTheme(
        // padding: EdgeInsets.all(50),
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: canvasColor,
          borderRadius: BorderRadius.circular(5),
        ),
        hoverColor: scaffoldBackgroundColor,
        textStyle: TextStyle(color: Colors.white),
        selectedTextStyle: const TextStyle(color: Colors.white),
        hoverTextStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),

        // selectedItemPadding: EdgeInsets.symmetric(vertical: 15),
        itemTextPadding: const EdgeInsets.only(left: 30),
        selectedItemTextPadding: const EdgeInsets.only(left: 30),
        itemDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: canvasColor),
        ),
        selectedItemDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: actionColor.withOpacity(0.37),
          ),
          gradient: LinearGradient(
            colors: [accentCanvasColor, accentCanvasColor],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.28),
              blurRadius: 30,
            )
          ],
        ),
        iconTheme: IconThemeData(
          color: Colors.white.withOpacity(0.7),
          size: 20,
        ),
        selectedIconTheme: const IconThemeData(
          color: Colors.white,
          size: 20,
        ),
      ),
      extendedTheme: SidebarXTheme(
        width: 200,
        // height: 500,
        // height: MediaQuery.sizeOf(context).height,
        padding: EdgeInsets.all(0),
        // margin: EdgeInsets.only(left: 10, top: 10, bottom: 10, right: 10),
        decoration: BoxDecoration(
          // borderRadius: BorderRadius.circular(5),
          // shape: BoxShape.values[2],
          color: ColorPage.colortheme,
        ),
      ),
      footerDivider: divider,
      // showToggleButton: false,

      headerDivider: Padding(
        padding: EdgeInsets.only(bottom: 10),
      ),

      items: [
        SidebarXItem(
          icon: Icons.home,
          label: 'Employee',
          onTap: () {
            getx.adminEmpslidebox.value = 0;
            debugPrint('Home');
          },
        ),
        SidebarXItem(
          iconBuilder: (selected, hovered) {
            return Image.asset(
              'assets/app_icon/adminEmpIcon/add-user.png',
              width: 25,
              color: Colors.white,
            );
          },
          label: 'Add Employee',
          onTap: () => getx.adminEmpslidebox.value = 1,
        ),
        SidebarXItem(
          // icon: Icons.calendar_month,
          iconBuilder: (selected, hovered) {
            return Image.asset(
              'assets/app_icon/adminEmpIcon/Attendance.png',
              width: 25,
              color: Colors.white,
            );
          },
          label: 'Attendance',
          onTap: () => getx.adminEmpslidebox.value = 2,
        ),
      ],
    );
  }
}

const primaryColor = Color(0xFF685BFF);
var canvasColor = ColorPage.colortheme;
const scaffoldBackgroundColor = Color(0xFF464667);
const accentCanvasColor = Color(0xFF3E3E61);
const white = Colors.white;
final actionColor = const Color(0xFF5F5FA7).withOpacity(0.6);
final divider = Divider(color: white.withOpacity(0.3), height: 1);
