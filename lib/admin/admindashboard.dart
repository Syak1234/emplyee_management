// // import 'package:employee_management/admin/adminEmpadd.dart';
// import 'package:employee_management/admin/adminhomepage.dart';
// import 'package:employee_management/color/color.dart';
// import 'package:flutter/material.dart';
// // import 'package:flutter/rendering.dart';
// import 'package:flutter/widgets.dart';
// import 'package:get/get.dart';

// import 'adminEmphomepage.dart';

// class AdminDashboard extends StatefulWidget {
//   const AdminDashboard({super.key});

//   @override
//   State<AdminDashboard> createState() => _AdminDashboardState();
// }

// class _AdminDashboardState extends State<AdminDashboard> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         flexibleSpace: Container(
//           decoration: BoxDecoration(
//               gradient: LinearGradient(colors: [
//             ColorPage.colortheme,
//             Color.fromARGB(255, 24, 24, 35),
//           ])),
//         ),
//         title: Text(
//           'Admin Dashboard'.toUpperCase(),
//           textScaler: TextScaler.linear(1.5),
//         ),
//         titleTextStyle: TextStyle(
//           color: Colors.white,
//         ),
//         // backgroundColor: ColorPage.colortheme,
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Card(
//                   elevation: 40,
//                   child: InkWell(
//                     onTap: () {
//                       Get.to(() => AdminEmphomePage());
//                     },
//                     child: Container(
//                       alignment: Alignment.center,
//                       child: Text(
//                         'Employee',
//                         style: TextStyle(color: Colors.white),
//                         textScaler: TextScaler.linear(1.5),
//                       ),
//                       width: 200,
//                       // color: Colors.red,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(10),
//                         gradient: LinearGradient(
//                           colors: [
//                             ColorPage.colortheme,
//                             Color.fromARGB(255, 61, 61, 69),
//                           ],
//                         ),
//                       ),
//                       height: 200,
//                     ),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Card(
//                   elevation: 40,
//                   child: InkWell(
//                     onTap: () {
//                       Get.to(() => AdminHomePage());
//                     },
//                     child: Container(
//                         alignment: Alignment.center,
//                         width: 200,
//                         height: 200,
//                         child: Text(
//                           'Project',
//                           style: TextStyle(color: Colors.white),
//                           textScaler: TextScaler.linear(1.5),
//                         ),
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(10),
//                             gradient: LinearGradient(colors: [
//                               Colors.blue,
//                               Color.fromARGB(255, 31, 10, 217)
//                             ]))),
//                   ),
//                 ),
//               )
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }import 'package:employee_management/color/color.dart';
import 'package:employee_management/admin/adminEmphomepage.dart';
import 'package:employee_management/admin/adminhomepage.dart';
import 'package:employee_management/color/color.dart';
import 'package:employee_management/employee/empdashboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Color(0xFFF5F7FA), // Light background color for a clean look
      appBar: AppBar(
        title: Image.asset(
          'assets/app_icon/logo.png',
          height: 40, // Adjust the logo height if needed
        ),
        elevation: 2,
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: ColorPage.buttoncolor1),
            onPressed: () {
              // Handle notifications tap
            },
          ),
          IconButton(
            icon: Icon(Icons.account_circle, color: ColorPage.buttoncolor1),
            onPressed: () {
              // Handle profile tap
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Welcome Message
              Text(
                'Welcome Shubham Gupta',
                style: TextStyle(
                  fontSize: 25, // Increased font size for prominence
                  fontWeight: FontWeight.bold, // Made the text bold
                  color: Color(0xFF0C2740), // Dark blue to match branding
                ),
              ),
              SizedBox(height: 15),
              // Enhanced Overview Section Title
              Row(
                children: [
                  Container(
                    width: 5,
                    height: 30,
                    color: Color(0xFFDE1F26), // Red accent for visual emphasis
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Overview',
                    style: TextStyle(
                      fontSize: 28, // Slightly increased font size
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF333333),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              // Dashboard Cards Row
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _buildDashboardCard(
                    context,
                    title: 'Employees',
                    subtitle: 'Manage your team',
                    color1: Color(
                        0xFFDE1F26), // Red color similar to the button and header in the image
                    color2: Color(0xFFA21420), // Darker shade of red
                    icon: Icons.people,
                    onTap: () {
                      Get.to(() => AdminEmphomePage());
                    },
                  ),
                  SizedBox(width: 50),
                  _buildDashboardCard(
                    context,
                    title: 'Projects',
                    subtitle: 'View active projects',
                    color1: Colors.blueAccent,
                    color2: Colors.blue, // Darker shade of blue
                    icon: Icons.work_outline,
                    onTap: () {
                      Get.to(() => AdminHomePage());
                    },
                  ),
                ],
              ),
              SizedBox(height: 30),
              // Additional Features Section
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _buildFeatureCard(
                    context,
                    title: 'Attendance',
                    description: 'Track employee attendance',
                    icon: Icons.access_time,
                    color: Color.fromARGB(255, 24, 38, 243),
                  ),
                  SizedBox(width: 50),
                  _buildFeatureCard(
                    context,
                    title: 'Reports',
                    description: 'Generate performance reports',
                    icon: Icons.bar_chart,
                    color: Colors.orangeAccent,
                  ),
                ],
              ),
              SizedBox(height: 30),
              // Recent Activity Section
              Text(
                'Recent Activity',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF333333),
                ),
              ),
              SizedBox(height: 20),
              _buildActivityItem(
                icon: Icons.check_circle,
                color: Colors.green,
                title: 'New task completed',
                subtitle: 'Task "Design UI for CRM" was completed by John Doe',
              ),
              _buildActivityItem(
                icon: Icons.message,
                color: Colors.blue,
                title: 'New message received',
                subtitle: 'Message from Client X regarding Project Y',
              ),
              _buildActivityItem(
                icon: Icons.update,
                color: Colors.orange,
                title: 'Project deadline extended',
                subtitle:
                    'Project "Website Redesign" deadline moved to Sept 30',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDashboardCard(BuildContext context,
      {required String title,
      required String subtitle,
      required Color color1,
      required Color color2,
      required IconData icon,
      required void Function()? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width *
            0.28, // Adjust width to make it responsive
        height: 180, // Height to accommodate content
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [color1, color2],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(icon, size: 40, color: Colors.white),
              SizedBox(height: 20),
              Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto',
                ),
              ),
              SizedBox(height: 10),
              Text(
                subtitle,
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                  fontFamily: 'Roboto',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureCard(BuildContext context,
      {required String title,
      required String description,
      required IconData icon,
      required Color color}) {
    return GestureDetector(
      onTap: () {
        // Handle feature card tap
      },
      child: Container(
        width: MediaQuery.of(context).size.width *
            0.28, // Adjust width to make it responsive
        height: 150, // Slightly shorter height for feature cards
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(icon, size: 30, color: Colors.white),
              SizedBox(height: 20),
              Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto',
                ),
              ),
              SizedBox(height: 10),
              Text(
                description,
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                  fontFamily: 'Roboto',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActivityItem({
    required IconData icon,
    required Color color,
    required String title,
    required String subtitle,
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        leading: Icon(icon, color: color, size: 40),
        title: Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(subtitle),
      ),
    );
  }
}
