import 'package:employee_management/admin/adminprojectlist.dart';
import 'package:employee_management/color/color.dart';
import 'package:flutter/material.dart';

class AdminprojectShow extends StatefulWidget {
  const AdminprojectShow({super.key});

  @override
  State<AdminprojectShow> createState() => _AdminprojectShowState();
}

class _AdminprojectShowState extends State<AdminprojectShow> {
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
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 0, top: 5, bottom: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 8),
                  child: Text(
                    'Projects',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                    ),
                  ),
                ),
              ],
            ),
          ),
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
                      AdminProjectCard(index: index),
                      AdminProjectCard(index: index),
                      AdminProjectCard(index: index),
                      AdminProjectCard(index: index),
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

class AdminProjectCard extends StatefulWidget {
  final int index;

  const AdminProjectCard({required this.index, Key? key}) : super(key: key);

  @override
  _AdminProjectCardState createState() => _AdminProjectCardState();
}

class _AdminProjectCardState extends State<AdminProjectCard> {
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
