import 'package:employee_management/admin/adminEmpadd.dart';
import 'package:employee_management/admin/admindashboard.dart';
import 'package:employee_management/employee/empbreak.dart';
import 'package:employee_management/employee/empdashboard.dart';
import 'package:employee_management/employee/empsignup.dart';
import 'package:employee_management/super_admin/adminusercreate.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Employee Management',
      theme: ThemeData(
        textTheme: TextTheme(
          bodyMedium: GoogleFonts.josefinSans().copyWith(),
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: EmpSignUp(),
    );
  }
}
