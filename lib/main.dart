// import 'package:employee_management/admin/admindashboard.dart';
// import 'package:employee_management/tool/tool.dart';
import 'package:employee_management/color/color.dart';
import 'package:employee_management/employee/empdashboard.dart';
import 'package:employee_management/employee/empsignup.dart';
import 'package:employee_management/employee/splash.dart';
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
      theme: ThemeData(
        appBarTheme: AppBarTheme(
            color: ColorPage.white,
            shape: Border(
                bottom: BorderSide(color: ColorPage.buttoncolor1, width: 0.3))),
        inputDecorationTheme: InputDecorationTheme(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(255, 7, 22, 45)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(255, 7, 22, 45)),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(255, 7, 22, 45)),
          ),
        ),

        // Define border color for OutlinedButton
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            side: BorderSide(color: Color.fromARGB(255, 7, 22, 45)),
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: ColorPage.buttoncolor1,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey),
        buttonTheme: ButtonThemeData(
            // textTheme: ButtonTextTheme.normal,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.white)),
        scaffoldBackgroundColor: ColorPage.white,
        // cardColor: Colors.red,

        // backgroundColor: Color.fromARGB(255, 101, 114, 167),
        textTheme: TextTheme(
          bodyMedium: GoogleFonts.josefinSans().copyWith(
            color: Color.fromARGB(255, 7, 22, 45),
          ),
          bodyLarge: GoogleFonts.josefinSans().copyWith(
            color: Color.fromARGB(255, 7, 22, 45),
          ),
          bodySmall: GoogleFonts.josefinSans().copyWith(
            color: Color.fromARGB(255, 7, 22, 45),
          ),
          displayMedium: GoogleFonts.josefinSans().copyWith(
            color: Color.fromARGB(255, 7, 22, 45),
          ),
          displaySmall: GoogleFonts.josefinSans().copyWith(
            color: Color.fromARGB(255, 7, 22, 45),
          ),
          displayLarge: GoogleFonts.josefinSans().copyWith(
            color: Color.fromARGB(255, 7, 22, 45),
          ),
          labelLarge: GoogleFonts.josefinSans().copyWith(
            color: Color.fromARGB(255, 7, 22, 45),
          ),
          labelMedium: GoogleFonts.josefinSans().copyWith(
            color: Color.fromARGB(255, 7, 22, 45),
          ),
          labelSmall: GoogleFonts.josefinSans().copyWith(
            color: Color.fromARGB(255, 7, 22, 45),
          ),
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color.fromARGB(255, 7, 22, 45),
        ),

        // useMaterial3: true,
      ),
      home: SplashScreen(),
    );
  }
}
