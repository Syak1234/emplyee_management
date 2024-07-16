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
          gradient: const LinearGradient(
            colors: [accentCanvasColor, canvasColor],
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
      extendedTheme: const SidebarXTheme(
        width: 200,
        decoration: BoxDecoration(
          color: canvasColor,
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
          icon: Icons.calendar_month,
          label: 'Add Employee',
          onTap: () => getx.adminEmpslidebox.value = 1,
        ),
        SidebarXItem(
          icon: Icons.calendar_month,
          label: 'Attendance',
          onTap: () => getx.adminEmpslidebox.value = 2,
        ),
      ],
    );
  }
}
