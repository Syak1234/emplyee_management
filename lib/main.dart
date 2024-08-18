// import 'package:employee_management/admin/admindashboard.dart';
// import 'package:employee_management/tool/tool.dart';
import 'package:employee_management/color/color.dart';
import 'package:employee_management/employee/splash.dart';
import 'package:employee_management/employee/widget/themewidget.dart';
// import 'package:employee_management/employee/empsignup.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Employee Management',
      theme: theme,
      home: SplashScreen(),
    );
  }
}
