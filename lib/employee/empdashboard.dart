import 'package:employee_management/employee/empattendance.dart';
import 'package:employee_management/employee/empbreak.dart';
import 'package:employee_management/employee/empdrawer.dart';
import 'package:employee_management/employee/empleave.dart';
import 'package:employee_management/getx/getx.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:sidebar_drawer/sidebar_drawer.dart';
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
      Container(
        child: Text('data'),
      ),
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
    final isSmallScreen = MediaQuery.of(context).size.width < 600;

    return Scaffold(
      key: _key,
      appBar: isSmallScreen
          ? AppBar(
              backgroundColor: canvasColor,
              title: Text(
                'ABC',
                style: TextStyle(color: Colors.white),
              ),
              leading: IconButton(
                onPressed: () {
                  // if (!Platform.isAndroid && !Platform.isIOS) {
                  //   _controller.setExtended(true);
                  // }
                  _key.currentState?.openDrawer();
                },
                icon: const Icon(Icons.menu),
              ),
            )
          : null,
      // appBar: isSmallScreen

      drawer: ExampleSidebarX(controller: _controller),
      body: Obx(
        () => Row(
          children: [
            if (!isSmallScreen) ExampleSidebarX(controller: _controller),
            Expanded(
                child: Center(
              child: l[getx.slidebox.value],
            ))
            // Expanded(
            //   child: Center(
            //     child: ScreensExample(
            //       controller: _controller,
            //     ),
            //   ),
            // ),
            // Expanded(child: Center(child: Text('data'))),
            // Expanded(child: Center(child: Text('data1'))),
          ],
        ),
      ),
    );
  }
}
