import 'package:employee_management/color/color.dart';
import 'package:employee_management/employee/empdashboard.dart';
import 'package:employee_management/employee/empproject.dart';
import 'package:employee_management/getx/getx.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sidebarx/sidebarx.dart';

import 'logout.dart';

class ExampleSidebarX extends StatelessWidget {
  ExampleSidebarX({
    Key? key,
    required SidebarXController controller,
  })  : _controller = controller,
        super(key: key);

  final SidebarXController _controller;
  final Getx getx = Get.put(Getx());
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
    return SidebarX(
      showToggleButton: false,
      controller: _controller,
      theme: SidebarXTheme(
        // hoverIconTheme: IconThemeData(color: Colors.transparent),
        hoverTextStyle: TextStyle(color: Colors.white),
        // hoverColor: Colors.transparent,
        // ho
        // height: 30,
        // margin: EdgeInsets.zero,
        // padding: EdgeInsets.zero,
        // itemMargin: EdgeInsets.zero,
        // // itemPadding: EdgeInsets.zero,
        // // selectedItemPadding: EdgeInsets.zero,
        // selectedItemMargin: EdgeInsets.zero,
        // // margin: const EdgeInsets.all(0),
        decoration: BoxDecoration(
          color: canvasColor,
          // borderRadius: BorderRadius.circular(20),
        ),
        // hoverColor: Colors.green,
        textStyle: TextStyle(color: Colors.white),
        selectedTextStyle: const TextStyle(color: Colors.white),
        // hoverTextStyle: const TextStyle(
        //   // color: Colors.white,
        //   fontWeight: FontWeight.w500,
        // ),
        itemTextPadding: const EdgeInsets.only(left: 30),
        selectedItemTextPadding: const EdgeInsets.only(left: 30),

        selectedItemDecoration: BoxDecoration(
          // borderRadius: BorderRadius.circular(10),

          gradient: LinearGradient(
            colors: [ColorPage.red, ColorPage.red],
          ),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 7, 22, 45).withOpacity(0.28),
              blurRadius: 0,
            )
          ],
        ),
        iconTheme: IconThemeData(
          color: Colors.white.withOpacity(0.7),
          size: 20,
        ),
        selectedIconTheme:
            const IconThemeData(color: Colors.white, size: 20, weight: 800),
      ),
      extendedTheme: SidebarXTheme(
        width: 200,
        decoration: BoxDecoration(
          color: ColorPage.colortheme,
        ),
      ),
      footerDivider: divider,
      // showToggleButton: false,

      // headerDivider: Padding(
      //   // padding: EdgeInsets.only(bottom: 10),
      // ),

      items: [
        SidebarXItem(
          icon: Icons.home,
          label: 'Project',
          onTap: () {
            getx.slidebox.value = 0;
            // if (_navigatorKey.currentState?.canPop() ?? false) {
            //   _navigatorKey.currentState?.popUntil((route) => route.isFirst);
            // } else {
            //   // Navigator.of(context).pushReplacement(
            //   //     MaterialPageRoute(builder: (_) => EmpDashboard()));
            // }
            debugPrint('Project');
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
          label: 'GMB Extractor',
          // selectable: ,
          onTap: () => getx.slidebox.value = 4,
        ),
        // SidebarXItem(
        //   icon: Icons.chat,
        //   label: 'Bulk Whatsapp',
        //   // selectable: ,
        //   onTap: () => getx.slidebox.value = 5,
        // ),
        SidebarXItem(
          icon: Icons.logout,
          label: 'Bulk Email Sender',
          // selectable: false,
          onTap: () => getx.slidebox.value = 5,
        ),

        SidebarXItem(
          icon: Icons.chat,
          label: 'Bulk WhatsApp Sender',
          // selectable: false,
          onTap: () => getx.slidebox.value = 6,
        ),
        SidebarXItem(
          icon: Icons.help,
          label: 'Auto Dialer',
          // selectable: false,
          onTap: () => getx.slidebox.value = 7,
        ),
        SidebarXItem(
          icon: Icons.help,
          label: 'Chat',
          // selectable: false,
          onTap: () => getx.slidebox.value = 8,
        ),
        SidebarXItem(
          icon: Icons.logout,
          label: 'Tools',
          // selectable: ,
          onTap: () => getx.slidebox.value = 9,
        ),
        SidebarXItem(
          icon: Icons.help,
          label: 'Help',
          // selectable: false,
          onTap: () => getx.slidebox.value = 10,
        ),
        SidebarXItem(
          icon: Icons.logout,
          label: 'Logout',
          // selectable: false,
          onTap: () => logout(context),
        ),
      ],
    );
  }
}

const primaryColor = Color(0xFF685BFF);
const canvasColor = Color.fromARGB(255, 7, 22, 45);
// const scaffoldBackgroundColor = Color(0xFF464667);
// const accentCanvasColor = Color(0xFF3E3E61);
const white = Colors.white;
// final actionColor = const Color(0xFF5F5FA7).withOpacity(0.6);
final divider = Divider(color: white.withOpacity(0.3), height: 1);
