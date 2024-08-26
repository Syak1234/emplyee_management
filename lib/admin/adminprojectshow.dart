import 'package:employee_management/admin/admin_model/projectlistmodel.dart';
import 'package:employee_management/admin/adminprojectapi/projectlistapi.dart';
import 'package:employee_management/admin/adminprojectlist.dart';
import 'package:employee_management/color/color.dart';
import 'package:employee_management/employee/widget/searchWidget.dart';
import 'package:employee_management/getx/getx.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminprojectShow extends StatefulWidget {
  const AdminprojectShow({super.key});

  @override
  State<AdminprojectShow> createState() => _AdminprojectShowState();
}

class _AdminprojectShowState extends State<AdminprojectShow> {
  Getx getx = Get.find<Getx>();
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getx.projectlist.isEmpty ? projectlist() : null;
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
            builder: (context) => AdminProjectsListScreen(),
          );
        },
      ),
    );
  }
}

class AdminProjectsListScreen extends StatelessWidget {
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
                    'Projects',
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
          Expanded(
            child: Obx(
              () => getx.projectlist.isNotEmpty
                  ? GridView.builder(
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 5, // Number of columns
                        childAspectRatio: 5, // Aspect ratio of each card
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemCount: getx.projectlist.length,
                      itemBuilder: (context, index) {
                        return AdminProjectCard(
                            project: getx.projectlist[index], index: index);
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

class AdminProjectCard extends StatefulWidget {
  final int index;
  Project project;
  AdminProjectCard({required this.project, required this.index, Key? key})
      : super(key: key);

  @override
  _AdminProjectCardState createState() => _AdminProjectCardState();
}

class _AdminProjectCardState extends State<AdminProjectCard> {
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
                    builder: (context) => AdminProjectList(),
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
              padding: const EdgeInsets.all(8),
              alignment: Alignment.center,
              height: 45,
              child: Text(
                widget.project.projectName,
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
