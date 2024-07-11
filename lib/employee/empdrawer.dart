import 'package:employee_management/employee/empbreak.dart';
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
      headerBuilder: (context, extended) {
        return SizedBox(
          height: 100,
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: CircleAvatar(child: Icon(Icons.person)),
          ),
        );
      },
      items: [
        SidebarXItem(
          icon: Icons.home,
          label: 'Projects',
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
          // selectable: false,
          onTap: () => getx.slidebox.value = 3,
        ),
        SidebarXItem(
          icon: Icons.query_builder,
          // label: 'Apply for Leave',
          // selectable: false,
          onTap: () => getx.slidebox.value = 4,
          label: 'FAQ',
        ),
        SidebarXItem(
          icon: Icons.help,
          // label: 'Apply for Leave',
          selectable: false,
          onTap: () => getx.slidebox.value = 5,
          label: 'Help Videos',
        ),
        SidebarXItem(
          icon: Icons.logout,
          // label: 'Apply for Leave',
          selectable: false,
          onTap: () => getx.slidebox.value = 6,
          label: 'Logout',
        ),
      ],
    );
  }

  void _showDisabledAlert(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Item disabled for selecting',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
    );
  }
}

class ScreensExample extends StatelessWidget {
  const ScreensExample({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final SidebarXController controller;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        final pageTitle = getTitleByIndex(controller.selectedIndex, context);
        switch (controller.selectedIndex) {
          case 0:
            return ListView.builder(
              padding: const EdgeInsets.only(top: 10),
              itemBuilder: (context, index) => Container(
                height: 100,
                width: double.infinity,
                margin: const EdgeInsets.only(bottom: 10, right: 10, left: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Theme.of(context).canvasColor,
                  boxShadow: const [BoxShadow()],
                ),
              ),
            );
          default:
            return Text(
              pageTitle.toString(),
              style: theme.textTheme.headlineSmall,
            );
        }
      },
    );
  }
}

Object getTitleByIndex(int index, BuildContext context) {
  switch (index) {
    case 0:
      return showDialog(
          context: context,
          builder: (context) {
            return EmpBreakTime();
          });
    case 1:
      return 'Search';
    case 2:
      return 'People';
    case 3:
      return 'Favorites';
    case 4:
      return 'Custom iconWidget';
    case 5:
      return 'Profile';
    case 6:
      return 'Settings';
    default:
      return 'Not found page';
  }
}

const primaryColor = Color(0xFF685BFF);
const canvasColor = Color.fromARGB(255, 24, 31, 50);
const scaffoldBackgroundColor = Color(0xFF464667);
const accentCanvasColor = Color(0xFF3E3E61);
const white = Colors.white;
final actionColor = const Color(0xFF5F5FA7).withOpacity(0.6);
final divider = Divider(color: white.withOpacity(0.3), height: 1);
