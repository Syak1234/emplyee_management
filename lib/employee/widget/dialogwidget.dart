import 'package:employee_management/color/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future dialog(BuildContext context,
    {String title = "",
    Widget? child,
    String buttonname2 = "Start",
    String buttonname1 = "Cancel",
    void Function()? onPressed1,
    void Function()? onPressed2}) {
  return showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return AlertDialog.adaptive(
        shape:
            ContinuousRectangleBorder(borderRadius: BorderRadius.circular(10)),
        // icon: Icon(Icons.logout),
        title: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold, color: ColorPage.red),
        ),
        content: child,
        actions: [
          Card(
            elevation: 5,
            child: InkWell(
              onTap: onPressed1,
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
                    buttonname1,
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
              onTap: onPressed2,
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
                  child: Text(
                    buttonname2.toString(),
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
