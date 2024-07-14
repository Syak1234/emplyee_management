import 'package:employee_management/color/color.dart';
import 'package:employee_management/employee/emp_model/attendancemodel.dart';
import 'package:employee_management/getx/getx.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmpAttendance extends StatefulWidget {
  const EmpAttendance({super.key});

  @override
  State<EmpAttendance> createState() => _EmpAttendanceState();
}

class _EmpAttendanceState extends State<EmpAttendance> {
  @override
  void initState() {
    attendancedata();

    // TODO: implement initState
    super.initState();
  }

  Future attendancedata() async {
    getx.timebreaklist.clear();
    for (int i = 0; i < 15; i++) {
      AttendanceModel btm = AttendanceModel(
          date: '05/10/24',
          logintime: '10.50 AM',
          logouttime: '11:00 AM',
          breaktime: '10min',
          worktime: "8 hours");
      getx.attendancelist.add(btm);
    }
  }

  Getx getx = Get.put(Getx());
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
      body: Card(
        color: Colors.white,
        shadowColor: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 50,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 0, top: 10, bottom: 0),
              child: Row(
                children: [
                  Text(
                    'Attendance',
                    textScaler: TextScaler.linear(2),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 5),
              child: Container(
                color: const Color.fromARGB(255, 57, 161, 247),
                // decoration: decoration,
                // color: Color.fromARGB(255, 19, 7, 240),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Card(
                        elevation: 10,
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
                        elevation: 10,
                        child: Container(
                            decoration: decoration,
                            // color: ColorPage.buttoncolor1,
                            padding: EdgeInsets.all(8),
                            alignment: Alignment.center,
                            // width: 200,
                            child: Text(
                              'Login time',
                              style: TextStyle(
                                  color: ColorPage.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            )),
                      ),
                    ),
                    Flexible(
                      child: Card(
                        elevation: 10,
                        child: Container(
                            decoration: decoration,
                            // color: ColorPage.buttoncolor1,
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(8),
                            // width: 200,
                            child: Text(
                              'Logout time',
                              style: TextStyle(
                                  color: ColorPage.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            )),
                      ),
                    ),
                    Flexible(
                      child: Card(
                        elevation: 10,
                        child: Container(
                            decoration: decoration,
                            // color: ColorPage.buttoncolor1,
                            padding: EdgeInsets.all(8),
                            alignment: Alignment.center,
                            // width: 200,
                            child: Text(
                              'Break time',
                              style: TextStyle(
                                  color: ColorPage.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            )),
                      ),
                    ),
                    Flexible(
                      child: Card(
                        elevation: 10,
                        child: Container(
                            decoration: decoration,
                            // color: ColorPage.buttoncolor1,
                            padding: EdgeInsets.all(8),
                            alignment: Alignment.center,
                            // width: 200,
                            child: Text(
                              'Work time',
                              style: TextStyle(
                                  color: ColorPage.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            )),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Obx(
                () => ListView.builder(
                    shrinkWrap: true,
                    itemCount: getx.attendancelist.length,
                    itemBuilder: (context, index) {
                      var x = getx.attendancelist[index];
                      return Container(

                          // margin: EdgeInsets.only(top: 10),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(width: 0.3),
                            ),
                            // color:
                            //     index % 2 == 0 ? Colors.pink[100] : null
                          ),
                          padding:
                              EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                          // width: 200,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Flexible(
                                child: Container(
                                  decoration: BoxDecoration(
                                      // color: ColorPage.buttoncolor2,
                                      border:
                                          Border(right: BorderSide(width: 0.3))
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
                                      border:
                                          Border(right: BorderSide(width: 0.3))
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
                                  child: Text(x.logintime),
                                ),
                              ),
                              Flexible(
                                child: Container(
                                  decoration: BoxDecoration(
                                      // color: ColorPage.buttoncolor2,
                                      border:
                                          Border(right: BorderSide(width: 0.3))
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
                                  child: Text(x.logouttime),
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
                                  child: Text(x.breaktime),
                                ),
                              ),
                              Flexible(
                                child: Container(
                                  decoration: BoxDecoration(
                                      // color: ColorPage.buttoncolor2,
                                      border:
                                          Border(right: BorderSide(width: 0.3))
                                      // borderRadius: BorderRadius.all(
                                      //   Radius.circular(8),
                                      // ),
                                      ),
                                  padding: EdgeInsets.all(8),
                                  // color: Colors.orange,
                                  alignment: Alignment.center,
                                  // width: 200,
                                  child: Text(
                                    x.worktime,
                                  ),
                                ),
                              ),
                            ],
                          ));
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
