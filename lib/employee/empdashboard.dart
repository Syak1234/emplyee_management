import 'package:employee_management/tool/bulk_mail_sender.dart';
import 'package:employee_management/tool/bulk_whatsApp_sender.dart';
import 'package:employee_management/tool/googlemap.dart';
import 'package:employee_management/tool/premiumdashboard.dart';
import 'package:employee_management/tool/tool.dart';
import 'package:employee_management/color/color.dart';
import 'package:employee_management/employee/empattendance.dart';
import 'package:employee_management/employee/empbreak.dart';
import 'package:employee_management/employee/empdrawer.dart';
import 'package:employee_management/employee/empleave.dart';
import 'package:employee_management/employee/empproject.dart';
import 'package:employee_management/getx/getx.dart';
import 'package:employee_management/tool/toolui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sidebarx/sidebarx.dart';

import 'emp_helppage.dart';

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
      BusinessSearchScreen(),
      BulkMailSender(),

      BulkWhatsappSender(),
      Container(),
      Container(),
      Tool(),
      PremiumDashBoard(),
      HelpPage(),
      // Container(
      //   child: Text('data'),
      // ),
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
              // backgroundColor: Colors.teal,
              toolbarHeight: 65,
              automaticallyImplyLeading: false,
              title: Row(
                children: [
                  Image.asset(
                    'assets/app_icon/logo.png',
                    // width: 1,
                  ),
                ],
              ),
              actions: [
                // CircleAvatar()

                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Container(
                    decoration: BoxDecoration(
                        border:
                            Border.all(width: 2, color: ColorPage.buttoncolor1),
                        borderRadius: BorderRadius.circular(
                          80,
                        )),
                    child: CircleAvatar(
                      backgroundColor: ColorPage.red,
                      child: Text(
                        'SN',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            )
          : AppBar(
              toolbarHeight: 65,
              iconTheme: IconThemeData(color: Colors.white),
              title: Row(
                children: [
                  Image.asset('assets/app_icon/logo.png'),
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
