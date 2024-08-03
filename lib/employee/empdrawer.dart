import 'package:employee_management/color/color.dart';
import 'package:employee_management/getx/getx.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sidebarx/sidebarx.dart';

class ExampleSidebarX extends StatelessWidget {
  ExampleSidebarX({
    Key? key,
    required SidebarXController controller,
  })  : _controller = controller,
        super(key: key);

  final SidebarXController _controller;
  final Getx getx = Get.put(Getx());

  @override
  Widget build(BuildContext context) {
    return SidebarX(
      showToggleButton: false,
      controller: _controller,
      theme: SidebarXTheme(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: canvasColor,
          borderRadius: BorderRadius.circular(20),
        ),
        hoverColor: scaffoldBackgroundColor,
        textStyle: TextStyle(color: Colors.white),
        selectedTextStyle: const TextStyle(color: Colors.white),
        hoverTextStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
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
        decoration: BoxDecoration(
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
          label: 'Home',
          onTap: () {
            getx.slidebox.value = 0;
            debugPrint('Home');
          },
        ),
        SidebarXItem(
          icon: Icons.calendar_month,
          label: 'Attendance',
          onTap: () => getx.slidebox.value = 1,
        ),
        SidebarXItem(
          icon: Icons.breakfast_dining,
          label: 'Break Time',
          onTap: () => getx.slidebox.value = 2,
        ),
        SidebarXItem(
          icon: Icons.time_to_leave,
          label: 'Apply for Leave',
          onTap: () => getx.slidebox.value = 3,
        ),
        SidebarXItem(
          icon: Icons.logout,
          label: 'Tools',
          // selectable: ,
          onTap: () => getx.slidebox.value = 4,
        ),
        SidebarXItem(
          icon: Icons.help,
          label: 'Help',
          selectable: false,
          onTap: () => getx.slidebox.value = 5,
        ),
        SidebarXItem(
          icon: Icons.logout,
          label: 'Logout',
          selectable: false,
          onTap: () => getx.slidebox.value = 6,
        ),
      ],
    );
  }
}

const primaryColor = Color(0xFF685BFF);
const canvasColor = Color.fromRGBO(30, 31, 31, 1);
const scaffoldBackgroundColor = Color(0xFF464667);
const accentCanvasColor = Color(0xFF3E3E61);
const white = Colors.white;
final actionColor = const Color(0xFF5F5FA7).withOpacity(0.6);
final divider = Divider(color: white.withOpacity(0.3), height: 1);
