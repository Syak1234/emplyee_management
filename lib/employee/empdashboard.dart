
import 'package:employee_management/admin/tool/tool.dart';
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

  List<Widget> page = [];

  @override
  void initState() {
    page = [
      EmpProject(),
      EmpAttendance(),
      const EmpBreakTime(),
      EmpLeave(),
      MainScreen(),
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
      appBar: !isSmallScreen
          ? AppBar(
              toolbarHeight: 65,
              automaticallyImplyLeading: false,
              backgroundColor: canvasColor,
              title: Row(
                children: [
                  Image.asset(
                    'assets/app_icon/app_icon.jpg',
                    // width: 1,
                  ),
                ],
              ),
              actions: [
                // CircleAvatar()
               
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: CircleAvatar(
                    backgroundColor: Color.fromRGBO(221, 221, 221, 1),
                    child: Text(
                      'SN',
                    ),
                  ),
                ),
              ],
            )
          : AppBar(
              toolbarHeight: 65,
              backgroundColor: canvasColor,
              iconTheme: IconThemeData(color: Colors.white),
              title: Row(
                children: [
                  Image.asset('assets/app_icon/app_icon.jpg'),
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
              child: page[getx.slidebox.value],
            ))
          ],
        ),
      ),
    );
  }
}
