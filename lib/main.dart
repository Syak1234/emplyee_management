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
        scaffoldBackgroundColor: Color.fromARGB(255, 244, 245, 249),
        // cardColor: Colors.red,

        // backgroundColor: Color.fromARGB(255, 101, 114, 167),
        textTheme: TextTheme(
          bodyMedium: GoogleFonts.josefinSans().copyWith(),
          bodyLarge: GoogleFonts.josefinSans().copyWith(),
          bodySmall: GoogleFonts.josefinSans().copyWith(),
          // bodyText1: GoogleFonts.josefinSans().copyWith(),
          displayMedium: GoogleFonts.josefinSans().copyWith(),
          displaySmall: GoogleFonts.josefinSans().copyWith(),
          // bodyText2: GoogleFonts.josefinSans().copyWith(),
          displayLarge: GoogleFonts.josefinSans().copyWith(),
          labelLarge: GoogleFonts.josefinSans().copyWith(),
          labelMedium: GoogleFonts.josefinSans().copyWith(),
          labelSmall: GoogleFonts.josefinSans().copyWith(),
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.black,
        ),

        useMaterial3: true,
      ),
      home: EmpSignUp(),
    );
  }
}
