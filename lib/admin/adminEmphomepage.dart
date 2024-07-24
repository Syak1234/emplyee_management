import 'package:employee_management/admin/adminEmpAttendance.dart';
import 'package:employee_management/admin/adminEmpList.dart';
import 'package:employee_management/color/color.dart';
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
    page = [AdminEmpList(), AdminEmpAdd(), AdminEmpAttendance()];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width < 900;

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
              backgroundColor: ColorPage.canvasColor,
              title: Row(
                children: [
                  Image.asset('assets/app_icon/app_icon.jpg'),
                ],
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: CircleAvatar(
                    backgroundColor: Color.fromRGBO(221, 221, 221, 1),
                    child: Text('SM'),
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
              backgroundColor: ColorPage.canvasColor,
              // iconTheme: IconThemeData(color: Colors.white),
              title: Row(
                children: [
                  Image.asset('assets/app_icon/app_icon.jpg'),
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
