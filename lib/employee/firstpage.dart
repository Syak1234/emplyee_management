import 'package:employee_management/color/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0x181f32),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                elevation: 10,
                child: InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: const LinearGradient(colors: [
                            Color.fromARGB(255, 249, 17, 5),
                            Colors.red,
                          ])),
                      // color: ColorPage.buttoncolor1,
                      padding: const EdgeInsets.all(60),
                      alignment: Alignment.center,
                      width: 180,
                      child: const Text(
                        'Admin',
                        style: TextStyle(
                            color: ColorPage.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      )),
                ),
              ),
              Card(
                elevation: 10,
                child: InkWell(
                  onTap: () {},
                  child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: const LinearGradient(colors: [
                            Color.fromARGB(255, 5, 103, 249),
                            Colors.blue,
                          ])),
                      // color: ColorPage.buttoncolor1,
                      padding: const EdgeInsets.all(60),
                      alignment: Alignment.center,
                      width: 180,
                      child: const Text(
                        'User',
                        style: TextStyle(
                            color: ColorPage.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      )),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
