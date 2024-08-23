import 'package:employee_management/admin/adminProjectDrawer.dart';
import 'package:employee_management/admin/adminprojectcreate.dart';
import 'package:employee_management/admin/adminprojectshow.dart';
import 'package:employee_management/color/color.dart';
import 'package:employee_management/employee/emp_helppage.dart';
import 'package:employee_management/employee/empdrawer.dart';
import 'package:employee_management/tool/bulk_mail_sender.dart';
import 'package:employee_management/tool/bulk_whatsApp_sender.dart';
import 'package:employee_management/tool/googlemap.dart';
import 'package:employee_management/tool/premiumdashboard.dart';
import 'package:employee_management/tool/toolui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:sidebarx/sidebarx.dart';

import '../getx/getx.dart';

class AdminHomePage extends StatefulWidget {
  const AdminHomePage({super.key});

  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  Getx getx = Get.put(Getx());
  final _controller = SidebarXController(selectedIndex: 0, extended: true);
  final _key = GlobalKey<ScaffoldState>();

  List<Widget> page = [];

  @override
  void initState() {
    page = [
      AdminprojectShow(),
      AdminProjectCreate(),
      BusinessSearchScreen(),
      BulkMailSender(),
      BulkWhatsappSender(),
      Container(),
      Container(),
      Tool(),
      PremiumDashBoard(),
      HelpPage(),
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
              leading: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(Icons.arrow_back)),
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
      drawer: AdminProjectDrawer(controller: _controller),
      body: Obx(
        () => Row(
          children: [
            if (!isSmallScreen) AdminProjectDrawer(controller: _controller),
            Expanded(
                child: Center(
              child: page[getx.adminprojectslidebox.value],
            ))
          ],
        ),
      ),
    );
  }
}
