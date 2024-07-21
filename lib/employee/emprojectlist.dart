import 'dart:io';

import 'package:csv/csv.dart';
import 'package:employee_management/color/color.dart';
import 'package:employee_management/employee/widget/searchDropDown.dart';
import 'package:employee_management/employee/widget/textFormFieldWidget.dart';
import 'package:employee_management/export/csvexport.dart';
import 'package:employee_management/export/excelexport.dart';
import 'package:employee_management/getx/getx.dart';
import 'package:excel/excel.dart' as excelsheet;
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

class EmpProjectList extends StatefulWidget {
  EmpProjectList({super.key});
  @override
  State<EmpProjectList> createState() => _EmpProjectListState();
}

class _EmpProjectListState extends State<EmpProjectList> {
  TextEditingController datePickerController = TextEditingController();
  bool _isHovered = false;

  Getx getx = Get.put(Getx());
  // BoxDecoration decoration = const BoxDecoration(
  //     gradient: LinearGradient(colors: [
  //   Color.fromARGB(255, 5, 103, 249),
  //   Colors.blue,
  // ]));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildTextFormField(
                  controller: TextEditingController(),
                  icon: Icons.link,
                  flex: 3,
                  // flex: 2,
                  hintText: 'Backlink',
                  // items: [],
                  // onChanged: (v) {},
                  validator: (p0) {},
                ),
                buildTextFormField(
                  controller: TextEditingController(),
                  icon: Icons.link,
                  flex: 2,
                  // flex: 2,
                  hintText: 'Keywords',
                  // items: [],
                  // onChanged: (v) {},
                  validator: (p0) {},
                ),
                buildDropdownFormField(
                  flex: 1,
                  // flex: 2,
                  hintText: 'Type',
                  // items: [],
                  // onChanged: (v) {},
                  validator: (p0) {}, items: [], onChanged: (S) {},
                ),
                buildDropdownFormField(
                  flex: 1,
                  // flex: 2,
                  hintText: 'Status',
                  // items: [],
                  // onChanged: (v) {},
                  validator: (p0) {},
                  items: [
                    'Active',
                    'Pending',
                  ],
                  onChanged: (S) {},
                ),
                buildTextFormField(
                  controller: TextEditingController(),
                  hintText: 'Remark',
                  icon: Icons.abc,
                  validator: (p0) {},
                  flex: 1,
                ),
                Flexible(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: MouseRegion(
                      onEnter: (_) => setState(() => _isHovered = true),
                      onExit: (_) => setState(() => _isHovered = false),
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: _isHovered
                                  ? ColorPage.buttoncolor1
                                  : Colors.green,
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
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: exportButton(
                      ElevatedButton.icon(
                          style: ButtonStyle(
                              padding: MaterialStatePropertyAll(
                                EdgeInsets.all(15),
                              ),
                              backgroundColor:
                                  MaterialStatePropertyAll(ColorPage.red),
                              shape: MaterialStatePropertyAll(
                                  ContinuousRectangleBorder(
                                      borderRadius: BorderRadius.circular(5)))),
                          onPressed: () {
                            createExcel();
                          },
                          icon: Icon(
                            Icons.file_present_rounded,
                            color: Colors.white,
                          ),
                          label: Text(
                            'Excel',
                            style: TextStyle(color: Colors.white),
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 8,
                    ),
                    child: exportButton(
                      ElevatedButton.icon(
                          style: ButtonStyle(
                              padding: MaterialStatePropertyAll(
                                EdgeInsets.all(15),
                              ),
                              backgroundColor:
                                  MaterialStatePropertyAll(ColorPage.red),
                              shape: MaterialStatePropertyAll(
                                  ContinuousRectangleBorder(
                                      borderRadius: BorderRadius.circular(5)))),
                          onPressed: () {
                            createCSV();
                          },
                          icon: Icon(
                            Icons.file_present_rounded,
                            color: Colors.white,
                          ),
                          label: Text(
                            'CSV',
                            style: TextStyle(color: Colors.white),
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: exportButton(
                      ElevatedButton.icon(
                          style: ButtonStyle(
                              padding: MaterialStatePropertyAll(
                                EdgeInsets.all(15),
                              ),
                              backgroundColor:
                                  MaterialStatePropertyAll(ColorPage.red),
                              shape: MaterialStatePropertyAll(
                                  ContinuousRectangleBorder(
                                      borderRadius: BorderRadius.circular(5)))),
                          onPressed: () {
                            // createCSV();
                          },
                          icon: Icon(
                            Icons.file_present_rounded,
                            color: Colors.white,
                          ),
                          label: Text(
                            'PDF',
                            style: TextStyle(color: Colors.white),
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 0),
                    child: exportButton(
                      ElevatedButton.icon(
                          style: ButtonStyle(
                              padding: MaterialStatePropertyAll(
                                EdgeInsets.all(15),
                              ),
                              backgroundColor:
                                  MaterialStatePropertyAll(ColorPage.red),
                              shape: MaterialStatePropertyAll(
                                  ContinuousRectangleBorder(
                                      borderRadius: BorderRadius.circular(5)))),
                          onPressed: () {
                            createCSV();
                          },
                          icon: Icon(
                            Icons.file_present_rounded,
                            color: Colors.white,
                          ),
                          label: Text(
                            'Print',
                            style: TextStyle(color: Colors.white),
                          )),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 10),
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
                        elevation: ColorPage.elevation,
                        child: Container(
                            decoration: ColorPage.decoration,
                            alignment: Alignment.center,
                            // width: 200,
                            padding: EdgeInsets.all(8),
                            child: Text(
                              'Backlink',
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
                        elevation: ColorPage.elevation,
                        child: Container(
                            decoration: ColorPage.decoration,
                            // color: ColorPage.buttoncolor1,
                            padding: EdgeInsets.all(8),
                            alignment: Alignment.center,
                            // width: 200,
                            child: Text(
                              'Keyword',
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
                        elevation: ColorPage.elevation,
                        child: Container(
                            decoration: ColorPage.decoration,
                            // color: ColorPage.buttoncolor1,
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(8),
                            // width: 200,
                            child: Text(
                              'Type',
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
                        elevation: ColorPage.elevation,
                        child: Container(
                            decoration: ColorPage.decoration,
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
                    Flexible(
                      flex: 1,
                      child: Card(
                        elevation: ColorPage.elevation,
                        child: Container(
                            decoration: ColorPage.decoration,
                            // color: ColorPage.buttoncolor1,
                            padding: EdgeInsets.all(8),
                            alignment: Alignment.center,
                            // width: 200,
                            child: Text(
                              'Remark',
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
                        elevation: ColorPage.elevation,
                        child: Container(
                            decoration: ColorPage.decoration,
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
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 15,
                  itemBuilder: (context, index) {
                    // var x = getx.leavelist[index];
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
                                // width: MediaQuery.sizeOf(context).width - 1000,
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
                                  overflow: TextOverflow.ellipsis,
                                  'https//:google.com kjskkenjwoijweoijoij fewiiufhiufjhdffd/dflkndffdlkhhjdfbjfdkfdbkfd',
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
                                child: Text('Keyword'),
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
                                // decoration: decoration,
                                // decoration: BoxDecoration(
                                //     color: ColorPage.buttoncolor2,
                                //     borderRadius: BorderRadius.all(
                                //         Radius.circular(8))),
                                padding: EdgeInsets.all(8),
                                // color: Colors.orange,
                                alignment: Alignment.center,
                                // width: 200,
                                child: Text('Type'),
                              ),
                            ),
                            Flexible(
                              flex: 1,
                              child: Container(
                                decoration: BoxDecoration(
                                    border:
                                        Border(right: BorderSide(width: 0.3))
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
                                  'Status',
                                  // style: const TextStyle(color: Colors.red),
                                ),
                              ),
                            ),
                            Flexible(
                              flex: 1,
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border(
                                        right: BorderSide(
                                            width:
                                                0.3)) // color: ColorPage.buttoncolor2,

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
                                  'Remark',
                                  // style: const TextStyle(color: Colors.red),
                                ),
                              ),
                            ),
                            Flexible(
                              flex: 1,
                              child: Container(
                                decoration: BoxDecoration(
                                    border:
                                        Border(right: BorderSide(width: 0.3))
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
                                  '20min',
                                  // style: const TextStyle(color: Colo),
                                ),
                              ),
                            ),
                          ],
                        ));
                  }),
            ),
          ],
        ),
      ),
    );
  }

  Widget exportButton(Widget button) {
    return Container(
      child: Card(child: button),
    );
  }
}
