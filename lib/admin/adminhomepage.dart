import 'package:employee_management/admin/adminProjectDrawer.dart';
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
    page = [
      AdminprojectShow(),
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
              backgroundColor: ColorPage.canvasColor,
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
                CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: Icon(Icons.person),
                ),
                Text(
                  '  Sayak Mishra  ',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10, left: 0),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.logout,
                      color: Colors.red,
                    ),
                  ),
                )
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
              toolbarHeight: 65,
              backgroundColor: ColorPage.canvasColor,
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
