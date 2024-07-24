import 'package:employee_management/admin/adminProjectDrawer.dart';
import 'package:employee_management/admin/adminprojectcreate.dart';
import 'package:employee_management/admin/adminprojectshow.dart';
import 'package:employee_management/color/color.dart';
import 'package:employee_management/employee/empdrawer.dart';
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
    page = [AdminprojectShow(), AdminProjectCreate()];
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
              iconTheme: IconThemeData(color: Colors.white),
              toolbarHeight: 65,
              automaticallyImplyLeading: false,
              backgroundColor: ColorPage.colortheme,
              title: Row(
                children: [
                  Image.asset('assets/app_icon/app_icon.jpg'),
                ],
              ),
              actions: [
                CircleAvatar(
                  backgroundColor: Color.fromRGBO(221, 221, 221, 1),
                  child: Text(
                    'SM',
                  ),
                ),

                // ElevatedButton.icon(
                //     style: ButtonStyle(
                //         padding: MaterialStatePropertyAll(EdgeInsets.all(20)),
                //         backgroundColor: MaterialStatePropertyAll(Colors.green),
                //         shape: MaterialStatePropertyAll(
                //             ContinuousRectangleBorder())),
                //     onPressed: () {},
                //     icon: Icon(
                //       Icons.logout,
                //       color: Colors.white,
                //     ),
                //     label: Text(
                //       'Log Out',
                //       style: TextStyle(color: Colors.white),
                //     ))
              ],
            )
          : AppBar(
              leading: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(Icons.arrow_back)),
              iconTheme: IconThemeData(color: Colors.white),
              toolbarHeight: 65,
              backgroundColor: ColorPage.colortheme,
              title: Row(
                children: [
                  Image.asset('assets/app_icon/app_icon.jpg'),
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
