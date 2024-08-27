import 'package:employee_management/color/color.dart';
import 'package:employee_management/employee/Emplogin.dart';
import 'package:employee_management/employee/emp_api/logoutapi.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future logout(BuildContext context) {
  return showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return AlertDialog.adaptive(
        shape:
            ContinuousRectangleBorder(borderRadius: BorderRadius.circular(10)),
        // icon: Icon(Icons.logout),
        title: Text(
          'Logout',
          style: TextStyle(fontWeight: FontWeight.bold, color: ColorPage.red),
        ),
        content: Text(
          'Are you sure you want to logout?',
          style: TextStyle(color: ColorPage.buttoncolor1),
        ),
        actions: [
          Card(
            elevation: 5,
            child: InkWell(
              onTap: () {
                Get.back();
              },
              child: Container(
                  decoration: BoxDecoration(
                    color: ColorPage.white,
                    borderRadius: BorderRadius.circular(5),
                    // gradient: const LinearGradient(colors: [
                    // Color.fromARGB(255, 249, 17, 5),
                    // Colors.red,
                    // ])
                  ),
                  // color: ColorPage.buttoncolor1,
                  padding: const EdgeInsets.all(8),
                  alignment: Alignment.center,
                  width: 180,
                  child: Text(
                    'Cancel',
                    style: TextStyle(
                        color: ColorPage.buttoncolor1,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  )),
            ),
          ),
          Card(
            elevation: 5,
            child: InkWell(
              onTap: () {
                logoutApi(context);
              },
              child: Container(
                  decoration: BoxDecoration(
                      color: ColorPage.red,
                      borderRadius: BorderRadius.circular(5)
                      // borderRadius: BorderRadius.circular(10),
                      ),
                  // color: ColorPage.buttoncolor1,
                  padding: const EdgeInsets.all(8),
                  alignment: Alignment.center,
                  width: 180,
                  child: const Text(
                    'Logout',
                    style: TextStyle(
                        color: ColorPage.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  )),
            ),
          ),
        ],
      );
    },
  );
}
