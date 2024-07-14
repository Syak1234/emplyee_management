import 'package:animated_icon/animated_icon.dart';
import 'package:employee_management/color/color.dart';
import 'package:employee_management/employee/empattendance.dart';
import 'package:employee_management/employee/empbreak.dart';
import 'package:employee_management/employee/empdrawer.dart';
import 'package:employee_management/employee/empleave.dart';
import 'package:employee_management/employee/empproject.dart';
import 'package:employee_management/getx/getx.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sidebarx/sidebarx.dart';

class EmpDashboard extends StatefulWidget {
  const EmpDashboard({super.key});

  @override
  State<EmpDashboard> createState() => _EmpDashboardState();
}

class _EmpDashboardState extends State<EmpDashboard> {
  Getx getx = Get.put(Getx());
  final _controller = SidebarXController(selectedIndex: 0, extended: true);
  final _key = GlobalKey<ScaffoldState>();

  List<Widget> l = [];

  @override
  void initState() {
    l = [
      EmpProject(),
      EmpAttendance(),
      const EmpBreakTime(),
      EmpLeave(),
      Container(
        child: Text('data'),
      ),
      Container(
        child: Text('data'),
      ),
      Container(
        child: Text('data'),
      ),
    ];
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width < 700;

    return Scaffold(
      key: _key,
      appBar:
       !isSmallScreen
          ? 
          AppBar(
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
              ],
            )
          : AppBar(
              toolbarHeight: 65,
              backgroundColor: canvasColor,
              iconTheme: IconThemeData(color: Colors.white),
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
            ),
      drawer: ExampleSidebarX(controller: _controller),
      body: Obx(
        () => Row(
          children: [
            if (!isSmallScreen) ExampleSidebarX(controller: _controller),
            Expanded(
                child: Center(
              child: l[getx.slidebox.value],
            ))
          ],
        ),
      ),
    );
  }
}
