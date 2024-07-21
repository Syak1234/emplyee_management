import 'dart:async';
import 'dart:math';

import 'package:elegant_notification/elegant_notification.dart';
import 'package:elegant_notification/resources/arrays.dart';
import 'package:elegant_notification/resources/stacked_options.dart';
import 'package:employee_management/color/color.dart';
import 'package:employee_management/employee/emp_model/breaktimemodel.dart';
import 'package:employee_management/getx/getx.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class EmpBreakTime extends StatefulWidget {
  const EmpBreakTime({super.key});

  @override
  State<EmpBreakTime> createState() => _EmpBreakTimeState();
}

class _EmpBreakTimeState extends State<EmpBreakTime> {
  Getx getx = Get.put(Getx());
  DateTime? _startTime;
  DateTime? _endTime;
  Duration? _difference;
  @override
  void initState() {
    gettimebreakdata();

    // TODO: implement initState
    super.initState();
  }

  String _formatTime(DateTime time) {
    return "${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}:${time.second.toString().padLeft(2, '0')}";
  }

  Future<void> showBreaktimeDilaog(BuildContext context) async {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.circular(10)),
          content: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Time Break',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Colors.red),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Obx(() => Visibility(
                          visible: getx.endtime.value,
                          child: Text(
                            getx.breaktimer.value,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ))
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Obx(
                      () => Visibility(
                        visible: !getx.endtime.value,
                        child: Card(
                          elevation: 10,
                          child: InkWell(
                            onTap: () {
                              Get.back();
                            },
                            child: Container(
                                decoration: BoxDecoration(
                                    // borderRadius: BorderRadius.circular(10),
                                    gradient: const LinearGradient(colors: [
                                  Color.fromARGB(255, 249, 17, 5),
                                  Colors.red,
                                ])),
                                // color: ColorPage.buttoncolor1,
                                padding: const EdgeInsets.all(8),
                                alignment: Alignment.center,
                                width: 180,
                                child: const Text(
                                  'Cancel',
                                  style: TextStyle(
                                      color: ColorPage.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                )),
                          ),
                        ),
                      ),
                    ),
                    Obx(
                      () => Visibility(
                        visible: !getx.endtime.value,
                        child: Card(
                          elevation: 10,
                          child: InkWell(
                            onTap: () {
                              getx.endtime.value = true;
                              _startTime = DateTime(
                                  DateTime.now().year,
                                  DateTime.now().month,
                                  DateTime.now().day,
                                  DateTime.now().hour,
                                  DateTime.now().minute,
                                  DateTime.now().second);
                              Timer.periodic(const Duration(seconds: 1),
                                  (timer) {
                                getx.breaktimer.value =
                                    _formatTime(DateTime.now());
                              });
                            },
                            child: Container(
                                decoration: decoration,
                                // color: ColorPage.buttoncolor1,
                                padding: const EdgeInsets.all(8),
                                alignment: Alignment.center,
                                width: 180,
                                child: const Text(
                                  'Start Time',
                                  style: TextStyle(
                                      color: ColorPage.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                )),
                          ),
                        ),
                      ),
                    ),
                    Obx(
                      () => Visibility(
                        visible: getx.endtime.value,
                        child: Card(
                          elevation: 10,
                          child: InkWell(
                            onTap: () {
                              Get.back();
                              getx.endtime.value = false;
                              _endTime = DateTime(
                                  DateTime.now().year,
                                  DateTime.now().month,
                                  DateTime.now().day,
                                  DateTime.now().hour,
                                  DateTime.now().minute,
                                  DateTime.now().second);
                              _difference = _endTime!.difference(_startTime!);
                              print(_difference);
                              BreakTimeModel btm = BreakTimeModel(
                                  date: _getCurrentDate(),
                                  startbreak: _startTime.toString(),
                                  endbreak: _endTime.toString(),
                                  timetaken: _difference.toString());
                              getx.timebreaklist.add(btm);

                              ElegantNotification.success(
                                width: 360,
                                title: const Text("Update"),
                                description:
                                    const Text("Your data has been updated"),
                              ).show(context);
                            },
                            child: Container(
                                decoration: const BoxDecoration(
                                    // borderRadius: BorderRadius.circular(10),
                                    gradient: LinearGradient(colors: [
                                  Color.fromARGB(255, 249, 17, 5),
                                  Colors.red,
                                ])),
                                // color: ColorPage.buttoncolor1,
                                padding: const EdgeInsets.all(8),
                                alignment: Alignment.center,
                                width: 180,
                                child: const Text(
                                  'End Time',
                                  style: TextStyle(
                                      color: ColorPage.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                )),
                          ),
                        ),
                      ),
                    )
                  ],
                )
                //  / Customize the loading message
              ],
            ),
          ),
        );
      },
    );

    // Delay for 3 seconds
  }

  String _getCurrentDate() {
    DateTime now = DateTime.now();
    return "${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}";
  }

  Future gettimebreakdata() async {
    getx.timebreaklist.clear();
    for (int i = 0; i < 15; i++) {
      BreakTimeModel btm = BreakTimeModel(
          date: '05/10/24',
          startbreak: '10.50 AM',
          endbreak: '11:00 AM',
          timetaken: '10min');
      getx.timebreaklist.add(btm);
    }
  }

  BoxDecoration decoration = BoxDecoration(
      // borderRadius: BorderRadius.circular(10),
      gradient: const LinearGradient(colors: [
    Color.fromARGB(255, 5, 103, 249),
    Colors.blue,
  ])
      // color: Color.fromARGB(81, 14, 14, 28),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Color.fromARGB(255, 24, 31, 50),
        //   centerTitle: true,
        //   title: Text(
        //     'Break Time'.toUpperCase(),
        //     style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        //   ),
        // actions: [
        //   Padding(
        //     padding: const EdgeInsets.only(right: 10),
        //     child: ElevatedButton(
        //       onPressed: () {
        //         showBreaktimeDilaog(context);
        //       },
        //       child: Text(
        //         'Start Break',
        //         style: TextStyle(color: Colors.white),
        //       ),
        //       style: ButtonStyle(
        //           padding: MaterialStatePropertyAll(EdgeInsets.all(15)),
        //           backgroundColor: MaterialStatePropertyAll(Colors.red),
        //           shape: MaterialStatePropertyAll(ContinuousRectangleBorder(
        //             borderRadius: BorderRadius.circular(15),
        //           ))),
        //     ),
        //   ),
        //   // CircleAvatar()
        //   AnimateIcon(
        //     key: UniqueKey(),
        //     onTap: () {},
        //     iconType: IconType.continueAnimation,
        //     height: 70,
        //     width: 70,
        //     color: ColorPage.buttoncolor1,
        //     animateIcon: AnimateIcons.bell,
        //   )
        // ],
        // ),
        body: getx.timebreaklist.isNotEmpty
            ? Card(
                color: Colors.white,
                shadowColor: Colors.white,
                surfaceTintColor: Colors.white,
                elevation: 50,
                child: Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 0, top: 15, bottom: 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Break Time',
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: ElevatedButton(
                            onPressed: () {
                              showBreaktimeDilaog(context);
                            },
                            child: Text(
                              'Start Break',
                              style: TextStyle(color: Colors.white),
                            ),
                            style: ButtonStyle(
                                padding: MaterialStatePropertyAll(
                                    EdgeInsets.all(15)),
                                backgroundColor:
                                    MaterialStatePropertyAll(ColorPage.red),
                                shape: MaterialStatePropertyAll(
                                    ContinuousRectangleBorder(
                                  borderRadius: BorderRadius.circular(0),
                                ))),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 15, bottom: 0, left: 20, right: 20),
                      child: Container(
                        color: const Color.fromARGB(255, 57, 161, 247),
                        // decoration: decoration,
                        // color: Color.fromARGB(255, 19, 7, 240),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Card(
                                elevation: ColorPage.elevation,
                                child: Container(
                                    decoration: decoration,
                                    alignment: Alignment.center,
                                    // width: 200,
                                    padding: EdgeInsets.all(8),
                                    child: Text(
                                      'Date',
                                      style: TextStyle(
                                          color: ColorPage.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    )),
                              ),
                            ),
                            Flexible(
                              child: Card(
                                elevation: 2,
                                child: Container(
                                    decoration: decoration,
                                    // color: ColorPage.buttoncolor1,
                                    padding: EdgeInsets.all(8),
                                    alignment: Alignment.center,
                                    // width: 200,
                                    child: Text(
                                      'Break Start',
                                      style: TextStyle(
                                          color: ColorPage.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    )),
                              ),
                            ),
                            Flexible(
                              child: Card(
                                elevation: ColorPage.elevation,
                                child: Container(
                                    decoration: decoration,
                                    // color: ColorPage.buttoncolor1,
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.all(8),
                                    // width: 200,
                                    child: Text(
                                      'Break End',
                                      style: TextStyle(
                                          color: ColorPage.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    )),
                              ),
                            ),
                            Flexible(
                              child: Card(
                                elevation: ColorPage.elevation,
                                child: Container(
                                    decoration: decoration,
                                    // color: ColorPage.buttoncolor1,
                                    padding: EdgeInsets.all(8),
                                    alignment: Alignment.center,
                                    // width: 200,
                                    child: Text(
                                      'Time Taken',
                                      style: TextStyle(
                                          color: ColorPage.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    )),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Obx(
                        () => Padding(
                          padding: const EdgeInsets.only(
                              top: 15, bottom: 0, left: 20, right: 20),
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: getx.timebreaklist.length,
                              itemBuilder: (context, index) {
                                var x = getx.timebreaklist[index];
                                return Container(

                                    // margin: EdgeInsets.only(top: 10),
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(width: 0.3),
                                      ),
                                      // color:
                                      //     index % 2 == 0 ? Colors.pink[100] : null
                                    ),
                                    padding: EdgeInsets.symmetric(
                                        vertical: 2, horizontal: 5),
                                    // width: 200,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Flexible(
                                          child: Container(
                                            decoration: BoxDecoration(
                                                // color: ColorPage.buttoncolor2,
                                                border: Border(
                                                    right:
                                                        BorderSide(width: 0.3))
                                                // borderRadius: BorderRadius.all(
                                                //   Radius.circular(8),
                                                // ),
                                                ),
                                            padding: EdgeInsets.all(8),
                                            // color: Colors.orange,
                                            alignment: Alignment.center,
                                            // width: 200,
                                            child: Text(
                                              x.date,
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          child: Container(
                                            decoration: BoxDecoration(
                                                // color: ColorPage.buttoncolor2,
                                                border: Border(
                                                    right:
                                                        BorderSide(width: 0.3))
                                                // borderRadius: BorderRadius.all(
                                                //   Radius.circular(8),
                                                // ),
                                                ),
                                            // decoration: BoxDecoration(
                                            //     color: ColorPage.buttoncolor2,
                                            //     borderRadius: BorderRadius.all(
                                            //         Radius.circular(8))),
                                            padding: EdgeInsets.all(8),
                                            // decoration: decoration,
                                            // padding: EdgeInsets.all(10),
                                            // color: Colors.orange,
                                            alignment: Alignment.center,
                                            // width: 200,
                                            child: Text(x.startbreak),
                                          ),
                                        ),
                                        Flexible(
                                          child: Container(
                                            decoration: BoxDecoration(
                                                // color: ColorPage.buttoncolor2,
                                                border: Border(
                                                    right:
                                                        BorderSide(width: 0.3))
                                                // borderRadius: BorderRadius.all(
                                                //   Radius.circular(8),
                                                // ),
                                                ),
                                            // decoration: decoration,
                                            // decoration: BoxDecoration(
                                            //     color: ColorPage.buttoncolor2,
                                            //     borderRadius: BorderRadius.all(
                                            //         Radius.circular(8))),
                                            padding: EdgeInsets.all(8),
                                            // color: Colors.orange,
                                            alignment: Alignment.center,
                                            // width: 200,
                                            child: Text(x.endbreak),
                                          ),
                                        ),
                                        Flexible(
                                          child: Container(
                                            decoration: BoxDecoration(
                                                // color: ColorPage.buttoncolor2,

                                                // borderRadius: BorderRadius.all(
                                                //   Radius.circular(8),
                                                // ),
                                                ),
                                            // decoration: decoration,
                                            // decoration: BoxDecoration(
                                            //     color: ColorPage.buttoncolor2,
                                            //     borderRadius: BorderRadius.all(
                                            //         Radius.circular(8))),
                                            padding: EdgeInsets.all(8),
                                            // color: Colors.orange,
                                            alignment: Alignment.center,
                                            // width: 200,
                                            child: Text(x.timetaken),
                                          ),
                                        ),
                                      ],
                                    ));
                              }),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : Center(child: CircularProgressIndicator())

        // Column(
        //   children: [
        //     for (int i = 0; i < 4; i++)
        //       Padding(
        //         padding: EdgeInsets.symmetric(vertical: 10),
        //         child: Row(
        //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //           children: [
        //             Container(
        //                 width: 200,
        //                 // color: Colors.blue,
        //                 child: MaterialButton(
        //                     padding: EdgeInsets.all(20),
        //                     onPressed: () {},
        //                     child: Text(''))),
        //             Container(
        //                 // color: Colors.amber,
        //                 width: 200,
        //                 child: MaterialButton(
        //                     padding: EdgeInsets.all(20),
        //                     onPressed: () {},
        //                     child: Text('Data'))),
        //             Container(
        //                 // color: Color.fromARGB(255, 231, 9, 197),
        //                 width: 200,
        //                 child: MaterialButton(
        //                     padding: EdgeInsets.all(20),
        //                     onPressed: () {},
        //                     child: Text('Data'))),
        //             Container(
        //                 // color: Colors.brown,
        //                 width: 200,
        //                 child: MaterialButton(
        //                     padding: EdgeInsets.all(20),
        //                     onPressed: () {},
        //                     child: Text('Data')))
        //           ],
        //         ),
        //       )

        //   ],
        // ));

        );
  }
}
