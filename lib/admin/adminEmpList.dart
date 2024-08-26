import 'package:employee_management/admin/adminEmpfilter.dart';
import 'package:employee_management/admin/admin_model/usermodel.dart';
import 'package:employee_management/admin/adminemployeeapi/listempapi.dart';
import 'package:employee_management/admin/adminprojectlist.dart';
import 'package:employee_management/color/color.dart';
import 'package:employee_management/employee/widget/searchWidget.dart';
import 'package:employee_management/getx/getx.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminEmpList extends StatefulWidget {
  const AdminEmpList({super.key});

  @override
  State<AdminEmpList> createState() => _AdminEmpListState();
}

class _AdminEmpListState extends State<AdminEmpList> {
  Getx getx = Get.find<Getx>();
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getx.users.isEmpty ? listEmployee(context) : null;
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Navigator(
        onGenerateRoute: (routeSettings) {
          return MaterialPageRoute(
            builder: (context) => AdminEmpListPage(),
          );
        },
      ),
    );
  }
}

class AdminEmpListPage extends StatelessWidget {
  Getx getx = Get.find<Getx>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 0, top: 1, bottom: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 0),
                  child: Text(
                    'Employee',
                    style: TextStyle(
                        color: Color.fromARGB(255, 7, 22, 45),
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          SearchBarWidget(),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: Obx(
              () => getx.users.isNotEmpty
                  ? GridView.builder(
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 5, // Number of columns
                        childAspectRatio: 5, // Aspect ratio of each card
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemCount: getx.users.length,
                      itemBuilder: (context, index) {
                        return AdminEmpCard(
                            username: getx.users[index], index: index);
                      },
                    )
                  : Center(
                      child: CircularProgressIndicator(),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}

class AdminEmpCard extends StatefulWidget {
  final int index;
  User username;
  AdminEmpCard({required this.username, required this.index, Key? key})
      : super(key: key);

  @override
  _AdminEmpCardState createState() => _AdminEmpCardState();
}

class _AdminEmpCardState extends State<AdminEmpCard> {
  bool _isHovered = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
      ),
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: Card(
          elevation: ColorPage.elevation,
          // color: Colors.red,
          // shadowColor: Colors.red,
          // surfaceTintColor: Colors.red,
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AdminEmpFilter(),
                  ));
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 0.5,
                  color: _isHovered ? Colors.white : ColorPage.buttoncolor1,
                ),
                borderRadius: BorderRadius.circular(5),
                color: _isHovered ? ColorPage.buttoncolor1 : ColorPage.white,
              ),
              padding: EdgeInsets.all(8),
              alignment: Alignment.center,
              height: 45,
              child: Text(
                widget.username.name,
                style: TextStyle(
                  color: _isHovered ? ColorPage.white : ColorPage.colortheme,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
