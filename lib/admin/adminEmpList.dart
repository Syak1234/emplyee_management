import 'package:employee_management/admin/adminEmpfilter.dart';
import 'package:employee_management/admin/adminprojectlist.dart';
import 'package:employee_management/color/color.dart';
import 'package:employee_management/employee/widget/searchWidget.dart';
import 'package:flutter/material.dart';

class AdminEmpList extends StatefulWidget {
  const AdminEmpList({super.key});

  @override
  State<AdminEmpList> createState() => _AdminEmpListState();
}

class _AdminEmpListState extends State<AdminEmpList> {
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
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          SearchBarWidget(),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: 7,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      AdminEmpCard(index: index),
                      AdminEmpCard(index: index),
                      AdminEmpCard(index: index),
                      AdminEmpCard(index: index),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class AdminEmpCard extends StatefulWidget {
  final int index;

  const AdminEmpCard({required this.index, Key? key}) : super(key: key);

  @override
  _AdminEmpCardState createState() => _AdminEmpCardState();
}

class _AdminEmpCardState extends State<AdminEmpCard> {
  bool _isHovered = false;
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
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
                padding: const EdgeInsets.all(8),
                alignment: Alignment.center,
                height: 45,
                child: Text(
                  'Project ${widget.index}',
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
      ),
    );
  }
}
