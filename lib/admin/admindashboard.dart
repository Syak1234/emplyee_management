import 'package:employee_management/admin/adminEmpadd.dart';
import 'package:employee_management/admin/adminhomepage.dart';
import 'package:employee_management/color/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'adminEmphomepage.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({super.key});

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            ColorPage.colortheme,
            Color.fromARGB(255, 24, 24, 35),
          ])),
        ),
        title: Text(
          'Admin Dashboard'.toUpperCase(),
          textScaler: TextScaler.linear(1.5),
        ),
        titleTextStyle: TextStyle(
          color: Colors.white,
        ),
        // backgroundColor: ColorPage.colortheme,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: 40,
                  child: InkWell(
                    onTap: () {
                      Get.to(() => AdminEmphomePage());
                    },
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        'Employee',
                        style: TextStyle(color: Colors.white),
                        textScaler: TextScaler.linear(1.5),
                      ),
                      width: 200,
                      // color: Colors.red,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: const LinearGradient(
                          colors: [
                            ColorPage.colortheme,
                            Color.fromARGB(255, 61, 61, 69),
                          ],
                        ),
                      ),
                      height: 200,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: 40,
                  child: InkWell(
                    onTap: () {
                      Get.to(() => AdminHomePage());
                    },
                    child: Container(
                        alignment: Alignment.center,
                        width: 200,
                        height: 200,
                        child: Text(
                          'Project',
                          style: TextStyle(color: Colors.white),
                          textScaler: TextScaler.linear(1.5),
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(colors: [
                              Colors.blue,
                              Color.fromARGB(255, 31, 10, 217)
                            ]))),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
