import 'package:board_datetime_picker/board_datetime_picker.dart';
import 'package:employee_management/color/color.dart';
import 'package:employee_management/getx/getx.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminProjectList extends StatefulWidget {
  const AdminProjectList({super.key});

  @override
  State<AdminProjectList> createState() => _AdminProjectListState();
}

class _AdminProjectListState extends State<AdminProjectList> {
  Getx getx = Get.put(Getx());
  TextEditingController datePickerController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
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
                            // prefixIcon: Icon(
                            //   Icons.link,
                            //   // color: Colors.white,
                            // ),
                            // hintStyle: TextStyle(color: Colors.black),
                            hintText: 'KEYWORD',
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
                          controller: datePickerController,
                          decoration: InputDecoration(
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
                              },
                              icon: Icon(
                                Icons.date_range,
                                // color: Colors.white,
                              ),
                            ),
                            // hintStyle: TextStyle(color: Colors.black),
                            hintText: 'DATE',
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
                      hint: Text('Type'.toUpperCase()),
                      items: <String>[
                        'Abc'
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
                        getx.adminprojectlistselectedtypebutton.value = v!;
                      },
                      validator: (value) {
                        if (value == null) {
                          return 'Cannot be null';
                        }
                        return null;
                      },
                    ),
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
                      hint: Text('status'.toUpperCase()),
                      items: <String>[
                        'Abc'
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
                        getx.adminprojectlistselectedstatusbutton.value = v!;
                      },
                      validator: (value) {
                        if (value == null) {
                          return 'Cannot be null';
                        }
                        return null;
                      },
                    ),
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
                      hint: Text('employee'.toUpperCase()),
                      items: <String>[
                        'Abc'
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
                        getx.adminprojectlistselectedemployeebutton.value = v!;
                      },
                      validator: (value) {
                        if (value == null) {
                          return 'Cannot be null';
                        }
                        return null;
                      },
                    ),
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
                          'Search',
                          style: TextStyle(
                              color: ColorPage.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        )),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
