import 'dart:io';

import 'package:csv/csv.dart';
import 'package:employee_management/color/color.dart';
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

  Getx getx = Get.put(Getx());
  BoxDecoration decoration = const BoxDecoration(
      gradient: LinearGradient(colors: [
    Color.fromARGB(255, 5, 103, 249),
    Colors.blue,
  ]));

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
                Flexible(
                  flex: 2,
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
                                borderSide:
                                    BorderSide(width: 0.5, color: Colors.grey)),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 0.5, color: Colors.grey)),
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 0.5, color: Colors.grey)),
                            prefixIcon: Icon(
                              Icons.link,
                              // color: Colors.white,
                            ),
                            // hintStyle: TextStyle(color: Colors.black),
                            hintText: 'Backlink',
                            // helperText: '',
                          ),
                        )),
                  ),
                ),
                Flexible(
                  flex: 2,
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
                                borderSide:
                                    BorderSide(width: 0.5, color: Colors.grey)),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 0.5, color: Colors.grey)),
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 0.5, color: Colors.grey)),
                            prefixIcon: Icon(
                              Icons.key,
                              // color: Colors.white,
                            ),
                            // hintStyle: TextStyle(color: Colors.black),
                            hintText: 'keyword',
                            // helperText: '',
                          ),
                        )),
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: Card(
                    elevation: 4,
                    child: DropdownButtonFormField<String>(
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        // prefixIcon: Icon(
                        //   Icons.type_specimen,
                        //   color: Colors.grey,
                        // ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 0.5, color: Colors.grey),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 0.5, color: Colors.grey),
                        ),
                        border: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 0.5, color: Colors.grey),
                        ),
                      ),
                      hint: Text('Type'),
                      items: <String>[
                        "Classified ads",
                        "Business Listing",
                        "Infographic Submission",
                        "Image Submission",
                        "PDF Submission",
                        "PPT Submission",
                        "Guest Posting",
                        "Blog Submission",
                        "Article Submission",
                        "Comment Posting",
                        "Q&A Submission",
                        "Web Blog Submission",
                        "Video Submission",
                        "Map Listing",
                        "Directory Submission",
                        "Ping Submission",
                        "Social Bookmarking",
                        "GMB Posting",
                        "Profile Creation",
                        "Press Release",
                        "Forum Submission",
                        "Event Submission",
                        "Other Listings",
                        "Website Audit",
                        "Competitor Analysis",
                        "Keyword Research",
                        "Meta Setup"
                      ].map<DropdownMenuItem<String>>((String e) {
                        return DropdownMenuItem(
                          value: e,
                          child: Text(
                            e,
                            overflow: TextOverflow.ellipsis,
                          ),
                        );
                      }).toList(),
                      onChanged: (v) {
                        getx.projecttype.value = v!;
                      },
                      validator: (value) {
                        if (value == null) {
                          return 'Cannot be null';
                        }
                        return null;
                      },
                      isExpanded: true,
                    ),
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
                            prefixIcon: IconButton(
                                onPressed: () async {
                                  // final result =
                                  //     await showBoardDateTimeMultiPicker(
                                  //   context: context,
                                  //   pickerType: DateTimePickerType.datetime,
                                  // );
                                  // datePickerController.text =
                                  //     '${result?.start}${result!.end}';
                                  // setState(() {});
                                  // // onTapFunction(context: context);
                                },
                                icon: Icon(Icons.stars_outlined)),
                            filled: true,
                            fillColor: ColorPage.white,
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 0.5, color: Colors.grey)),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 0.5, color: Colors.grey)),
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 0.5, color: Colors.grey)),
                            // prefixIcon: Icon(
                            //   Icons.date_range_rounded,
                            //   color: Colors.white,
                            // ),
                            // hintStyle: TextStyle(color: ColorPage.white),

                            hintText: 'Status',
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
                                borderSide:
                                    BorderSide(width: 0.5, color: Colors.grey)),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 0.5, color: Colors.grey)),
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 0.5, color: Colors.grey)),
                            hintText: 'Remark',
                            // helperText: '',
                            // hintStyle: TextStyle(),
                          ),
                        )),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: InkWell(
                    onTap: () {},
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
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: exportButton(
                    ElevatedButton.icon(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.red),
                            shape: MaterialStatePropertyAll(
                                ContinuousRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)))),
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
                  padding: const EdgeInsets.only(right: 8),
                  child: exportButton(
                    ElevatedButton.icon(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.red),
                            shape: MaterialStatePropertyAll(
                                ContinuousRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)))),
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
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.red),
                            shape: MaterialStatePropertyAll(
                                ContinuousRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)))),
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
                  padding: const EdgeInsets.only(right: 8),
                  child: exportButton(
                    ElevatedButton.icon(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.red),
                            shape: MaterialStatePropertyAll(
                                ContinuousRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)))),
                        onPressed: () {
                          createCSV();
                        },
                        icon: Icon(
                          Icons.file_present_rounded,
                          color: Colors.white,
                        ),
                        label: Text(
                          'Printer',
                          style: TextStyle(color: Colors.white),
                        )),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 10),
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
                        elevation: 10,
                        child: Container(
                            decoration: decoration,
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
                        elevation: 10,
                        child: Container(
                            decoration: decoration,
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
                        elevation: 10,
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
