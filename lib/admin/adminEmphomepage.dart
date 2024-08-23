import 'package:employee_management/admin/adminEmpAttendance.dart';
import 'package:employee_management/admin/adminEmpList.dart';
import 'package:employee_management/color/color.dart';
import 'package:employee_management/employee/emp_helppage.dart';
import 'package:employee_management/employee/widget/backbutton.dart';
import 'package:employee_management/tool/bulk_mail_sender.dart';
import 'package:employee_management/tool/bulk_whatsApp_sender.dart';
import 'package:employee_management/tool/googlemap.dart';
import 'package:employee_management/tool/premiumdashboard.dart';
import 'package:employee_management/tool/toolui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sidebarx/sidebarx.dart';

import '../getx/getx.dart';
import 'adminEmpDrawer.dart';
import 'adminEmpadd.dart';
import 'adminEmpfilter.dart';

class AdminEmphomePage extends StatefulWidget {
  const AdminEmphomePage({super.key});

  @override
  State<AdminEmphomePage> createState() => _AdminEmphomePageState();
}

class _AdminEmphomePageState extends State<AdminEmphomePage> {
  Getx getx = Get.put(Getx());
  final _controller = SidebarXController(selectedIndex: 0, extended: true);
  final _key = GlobalKey<ScaffoldState>();

  List<Widget> page = [];

  @override
  void initState() {
    page = [
      AdminEmpList(),
      AdminEmpAdd(),
      AdminEmpAttendance(),
      BusinessSearchScreen(),
      BulkMailSender(),
      BulkWhatsappSender(),
      Container(),
      Container(),
      Tool(),
      PremiumDashBoard(),
      HelpPage(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width < 900;

    return Scaffold(
      key: _key,
      appBar: !isSmallScreen
          ? AppBar(
              // backgroundColor: Colors.teal,
              toolbarHeight: 65,
              leading: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(Icons.arrow_back)),
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
              leading: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(Icons.arrow_back)),
              toolbarHeight: 65,
              iconTheme: IconThemeData(color: Colors.white),
              title: Row(
                children: [
                  Image.asset('assets/app_icon/logo.png'),
                ],
              ),
            ),
      drawer: AdminEmpDrawer(controller: _controller),
      body: Obx(
        () => Row(
          children: [
            if (!isSmallScreen) AdminEmpDrawer(controller: _controller),
            Expanded(
                child: Center(
              child: page[getx.adminEmpslidebox.value],
            ))
          ],
        ),
      ),
    );
  }
}
