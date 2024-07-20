import 'package:employee_management/color/color.dart';
import 'package:employee_management/employee/emprojectlist.dart';
import 'package:employee_management/getx/getx.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmpProject extends StatefulWidget {
  const EmpProject({super.key});

  @override
  State<EmpProject> createState() => _EmpProjectState();
}

class _EmpProjectState extends State<EmpProject> {
  BoxDecoration decoration = BoxDecoration(
    gradient: const LinearGradient(
      colors: [
        Color.fromARGB(255, 5, 103, 249),
        Colors.blue,
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Navigator(
        onGenerateRoute: (routeSettings) {
          return MaterialPageRoute(
            builder: (context) => ProjectsListScreen(),
          );
        },
      ),
    );
  }
}

class ProjectsListScreen extends StatelessWidget {
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
                  margin: EdgeInsets.symmetric(vertical: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ProjectCard(index: index),
                      ProjectCard(index: index),
                      ProjectCard(index: index),
                      ProjectCard(index: index),
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

class ProjectCard extends StatefulWidget {
  final int index;

  const ProjectCard({required this.index, Key? key}) : super(key: key);

  @override
  _ProjectCardState createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _isHovered = false;
  Getx getx = Get.put(Getx());

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: MouseRegion(
          onEnter: (_) => setState(() => _isHovered = true),
          onExit: (_) => setState(() => _isHovered = false),
          child: Card(
            elevation: ColorPage.elevation,
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EmpProjectList(),
                    ));
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 0.5,
                    color: _isHovered ? Colors.white : ColorPage.buttoncolor1,
                  ),
                  color: _isHovered
                      ? ColorPage.buttoncolor1
                      : Color.fromARGB(255, 244, 242, 242),
                  borderRadius: BorderRadius.circular(5),
                ),
                padding: const EdgeInsets.all(8),
                alignment: Alignment.center,
                height: 45,
                child: Text(
                  'Project ${widget.index}',
                  style: TextStyle(
                    color: _isHovered ? Colors.white : ColorPage.colortheme,
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
