import 'package:board_datetime_picker/board_datetime_picker.dart';
import 'package:employee_management/color/color.dart';
import 'package:employee_management/employee/emp_model/leavemodel.dart';
import 'package:employee_management/getx/getx.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class EmpLeave extends StatefulWidget {
  const EmpLeave({super.key});

  @override
  State<EmpLeave> createState() => _EmpLeaveState();
}

class _EmpLeaveState extends State<EmpLeave> {
  @override
  void initState() {
    leavedata();

    // TODO: implement initState
    super.initState();
  }

  Future leavedata() async {
    getx.timebreaklist.clear();
    for (int i = 0; i < 15; i++) {
      LeaveModel btm = LeaveModel(
          reason: "abjsjd",
          choosedate: "15/06/2024",
          noofdays: "15",
          status: "panding");
      getx.leavelist.add(btm);
    }
  }

  Getx getx = Get.put(Getx());
  BoxDecoration decoration = const BoxDecoration(
      // borderRadius: BorderRadius.circular(10),
      gradient: LinearGradient(colors: [
    Color.fromARGB(255, 5, 103, 249),
    Colors.blue,
  ])
      // color: Color.fromARGB(81, 14, 14, 28),
      );

  TextEditingController datePickerController = TextEditingController();
  onTapFunction({required BuildContext context}) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      lastDate: DateTime.now(),
      firstDate: DateTime(2015),
      initialDate: DateTime.now(),
    );
    if (pickedDate == null) return;
    datePickerController.text = DateFormat('yyyy-MM-dd').format(pickedDate);
  }

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
                    'Leave',
                    textScaler: TextScaler.linear(2),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 10),
              child: Container(
                // decoration: BoxDecoration(boxShadow: [
                //   BoxShadow(
                //       color: Colors.grey,
                //       offset: Offset(2, 2),
                //       blurRadius: 50,
                //       spreadRadius: 2)
                // ]),
                // color: const Color.fromARGB(255, 57, 161, 247),
                // decoration: decoration,
                // color: Color.fromARGB(255, 19, 7, 240),
                child:
                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 3,
                      child: Card(
                        elevation: 4,
                        child: Container(
                            // decoration: decoration,
                            alignment: Alignment.center,
                            // width: 200,
                            // padding: EdgeInsets.all(8),
                            child: TextFormField(
                              maxLines: 1,
                              decoration: const InputDecoration(
                                filled: true,
                                fillColor: ColorPage.white,
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 0.5, color: Colors.grey)),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 0.5, color: Colors.grey)),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 0.5, color: Colors.grey)),
                                prefixIcon: Icon(
                                  Icons.report,
                                  // color: Colors.white,
                                ),
                                // hintStyle: TextStyle(color: Colors.black),
                                hintText: 'Reason',
                                // helperText: '',
                              ),
                            )),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Card(
                        elevation: 4,
                        child: Container(
                            // decoration: decoration,
                            // color: ColorPage.buttoncolor1,
                            // padding: EdgeInsets.all(8),
                            alignment: Alignment.center,
                            // width: 200,
                            child: TextFormField(
                              controller: datePickerController,
                              // readOnly: true,
                              decoration: InputDecoration(
                                suffixIcon: IconButton(
                                    onPressed: () async {
                                      final result =
                                          await showBoardDateTimeMultiPicker(
                                        context: context,
                                        pickerType: DateTimePickerType.datetime,
                                      );
                                      datePickerController.text =
                                          '${result?.start}${result!.end}';
                                      setState(() {});
                                      // onTapFunction(context: context);
                                    },
                                    icon: Icon(Icons.date_range)),
                                filled: true,
                                fillColor: ColorPage.white,
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 0.5, color: Colors.grey)),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 0.5, color: Colors.grey)),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 0.5, color: Colors.grey)),
                                // prefixIcon: Icon(
                                //   Icons.date_range_rounded,
                                //   color: Colors.white,
                                // ),
                                // hintStyle: TextStyle(color: ColorPage.white),

                                hintText: 'Choose Date',
                                // helperText: '',
                              ),
                            )),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Card(
                        elevation: 4,
                        child: Container(
                            // decoration: decoration,
                            // color: ColorPage.buttoncolor1,
                            alignment: Alignment.center,
                            // padding: EdgeInsets.all(8),
                            // width: 200,
                            child: TextFormField(
                              decoration: const InputDecoration(
                                filled: true,
                                fillColor: ColorPage.white,
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 0.5, color: Colors.grey)),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 0.5, color: Colors.grey)),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 0.5, color: Colors.grey)),
                                hintText: 'No.of days',
                                // helperText: '',
                                // hintStyle: TextStyle(),
                              ),
                            )),
                      ),
                    ),
                    Flexible(
                      // flex: 1,
                      child: InkWell(
                        onTap: () {},
                        child: Card(
                          margin: EdgeInsets.all(0),
                          elevation: 4,
                          child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.green,
                              ),

                              // decoration: BoxDecoration(
                              //     // borderRadius: BorderRadius.circular(10),
                              //     gradient: const LinearGradient(colors: [
                              //   Color.fromARGB(255, 249, 46, 5),
                              //   Colors.red,
                              // ])
                              //     // color: Color.fromARGB(81, 14, 14, 28),
                              //     ),
                              // color: ColorPage.buttoncolor1,
                              padding: EdgeInsets.symmetric(vertical: 14),
                              alignment: Alignment.center,
                              // width: 200,
                              child: Text(
                                'Submit',
                                style: TextStyle(
                                    color: ColorPage.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              )),
                        ),
                      ),
                    ),
                  ],
                ),
             
              ),
            ),
            
            Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 0),
              child: Container(
                color: const Color.fromARGB(255, 57, 161, 247),
                // decoration: decoration,
                // color: Color.fromARGB(255, 19, 7, 240),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 3,
                      child: Card(
                        elevation: 10,
                        child: Container(
                            decoration: decoration,
                            alignment: Alignment.center,
                            // width: 200,
                            padding: EdgeInsets.all(8),
                            child: Text(
                              'Reason',
                              style: TextStyle(
                                  color: ColorPage.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            )),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Card(
                        elevation: 10,
                        child: Container(
                            decoration: decoration,
                            // color: ColorPage.buttoncolor1,
                            padding: EdgeInsets.all(8),
                            alignment: Alignment.center,
                            // width: 200,
                            child: Text(
                              'Choose Date',
                              style: TextStyle(
                                  color: ColorPage.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            )),
                      ),
                    ),
                    Flexible(
                      // flex: 1,
                      child: Card(
                        elevation: 10,
                        child: Container(
                            decoration: decoration,
                            // color: ColorPage.buttoncolor1,
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(8),
                            // width: 200,
                            child: Text(
                              'No.of Days',
                              style: TextStyle(
                                  color: ColorPage.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            )),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Card(
                        elevation: 10,
                        child: Container(
                            decoration: decoration,
                            // color: ColorPage.buttoncolor1,
                            padding: EdgeInsets.all(8),
                            alignment: Alignment.center,
                            // width: 200,
                            child: Text(
                              'Status',
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
                () => ListView.builder(
                    shrinkWrap: true,
                    itemCount: getx.leavelist.length,
                    itemBuilder: (context, index) {
                      var x = getx.leavelist[index];
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
                                flex: 3,
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
                                    x.reason,
                                  ),
                                ),
                              ),
                              Flexible(
                                flex: 1,
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
                                  child: Text(x.choosedate),
                                ),
                              ),
                              Flexible(
                                // flex: ,
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
                                  child: Text(x.noofdays),
                                ),
                              ),
                              Flexible(
                                flex: 1,
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
                                  child: Text(
                                    x.status,
                                    style: const TextStyle(color: Colors.red),
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
