import 'package:board_datetime_picker/board_datetime_picker.dart';
import 'package:employee_management/color/color.dart';
import 'package:employee_management/employee/widget/searchDropDown.dart';
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
  bool _isHovered = false;
  TextEditingController datePickerController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 0, top: 15, bottom: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Projects',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 15, bottom: 0, left: 20, right: 20),
              child: Form(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Container(
                            decoration: ColorPage.decoration1,
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
                                        width: 0.5, color: Colors.black)),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 0.5, color: Colors.black)),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 0.5, color: Colors.black)),
                                // prefixIcon: Icon(
                                //   Icons.link,
                                //   // color: Colors.white,
                                // ),
                                // hintStyle: TextStyle(color: Colors.black),
                                labelText: 'Keyword',
                                // helperText: '',
                              ),
                            )),
                      ),
                    ),
                    Flexible(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Container(
                            decoration: ColorPage.decoration1,
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
                                    borderSide: BorderSide(
                                        width: 0.5, color: Colors.black)),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 0.5, color: Colors.black)),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 0.5, color: Colors.black)),
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
                                labelText: 'Date',
                                // helperText: '',
                              ),
                            )),
                      ),
                    ),
                    buildDropdownFormField(
                      flex: 2,
                      hintText: 'Type',
                      items: [
                        "Classified ads",
                        "Business Listing",
                        "Image Submission",
                        "PDF Submission",
                        "PPT Submission",
                        "Guest Posting",
                        "Blog Submission",
                        "Article Submission",
                        "Comment Posting",
                        "Q&A Submission",
                        "Web Blog",
                        "Video Submission",
                        "Map Listing",
                        "Directory",
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
                        "Meta Setup",
                        "Infographic",
                      ],
                      onChanged: (v) {
                        getx.projecttype.value = v!;
                      },
                      validator: (value) {
                        if (value == null) {
                          return 'Cannot be null';
                        }
                        return null;
                      },
                    ),
                    // Flexible(
                    //   flex: 2,
                    //   child: Padding(
                    //     padding: const EdgeInsets.symmetric(horizontal: 5),
                    //     child: Container(
                    //       decoration: ColorPage.decoration1,
                    //       child: DropdownButtonFormField<String>(
                    //         decoration: const InputDecoration(
                    //           filled: true,
                    //           fillColor: Colors.white,
                    //           // prefixIcon: Icon(
                    //           //   Icons.type_specimen,
                    //           //   color: Colors.grey,
                    //           // ),
                    //           focusedBorder: OutlineInputBorder(
                    //             borderSide:
                    //                 BorderSide(width: 0.5, color: Colors.black),
                    //           ),
                    //           enabledBorder: OutlineInputBorder(
                    //             borderSide:
                    //                 BorderSide(width: 0.5, color: Colors.black),
                    //           ),
                    //           border: OutlineInputBorder(
                    //             borderSide:
                    //                 BorderSide(width: 0.5, color: Colors.black),
                    //           ),
                    //         ),
                    //         hint: Text('Type'),
                    //         items: <String>[
                    //           'Abc'
                    //               "Classified ads",
                    //           "Business Listing",
                    //           "Infographic Submission",
                    //           "Image Submission",
                    //           "PDF Submission",
                    //           "PPT Submission",
                    //           "Guest Posting",
                    //           "Blog Submission",
                    //           "Article Submission",
                    //           "Comment Posting",
                    //           "Q&A Submission",
                    //           "Web Blog Submission",
                    //           "Video Submission",
                    //           "Map Listing",
                    //           "Directory Submission",
                    //           "Ping Submission",
                    //           "Social Bookmarking",
                    //           "GMB Posting",
                    //           "Profile Creation",
                    //           "Press Release",
                    //           "Forum Submission",
                    //           "Event Submission",
                    //           "Other Listings",
                    //           "Website Audit",
                    //           "Competitor Analysis",
                    //           "Keyword Research",
                    //           "Meta Setup"
                    //         ].map<DropdownMenuItem<String>>((String e) {
                    //           return DropdownMenuItem(
                    //             value: e,
                    //             child: Text(
                    //               e,
                    //               overflow: TextOverflow.ellipsis,
                    //             ),
                    //           );
                    //         }).toList(),
                    //         onChanged: (v) {
                    //           getx.adminprojectlistselectedtypebutton.value =
                    //               v!;
                    //         },
                    //         validator: (value) {
                    //           if (value == null) {
                    //             return 'Cannot be null';
                    //           }
                    //           return null;
                    //         },
                    //         isExpanded: true,
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    buildDropdownFormField(
                      flex: 1,
                      hintText: 'Status',
                      items: ['Active', 'Pending'],
                      onChanged: (v) {
                        getx.projecttype.value = v!;
                      },
                      validator: (value) {
                        if (value == null) {
                          return 'Cannot be null';
                        }
                        return null;
                      },
                    ),

                    buildDropdownFormField(
                      flex: 2,
                      hintText: 'Employee',
                      items: [
                        "Classified ads",
                        "Business Listing",
                        "Image Submission",
                        "PDF Submission",
                        "PPT Submission",
                        "Guest Posting",
                        "Blog Submission",
                        "Article Submission",
                        "Comment Posting",
                        "Q&A Submission",
                        "Web Blog",
                        "Video Submission",
                        "Map Listing",
                        "Directory",
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
                        "Meta Setup",
                        "Infographic",
                      ],
                      onChanged: (v) {
                        getx.projecttype.value = v!;
                      },
                      validator: (value) {
                        if (value == null) {
                          return 'Cannot be null';
                        }
                        return null;
                      },
                    ),

                    Flexible(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: MouseRegion(
                          onEnter: (_) => setState(() => _isHovered = true),
                          onExit: (_) => setState(() => _isHovered = false),
                          child: InkWell(
                            onTap: () {},
                            child: Card(
                              margin: EdgeInsets.all(0),
                              elevation: 4,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: _isHovered
                                      ? ColorPage.buttoncolor1
                                      : Colors.green,
                                ),
                                padding: EdgeInsets.symmetric(vertical: 14),
                                alignment: Alignment.center,
                                child: Text(
                                  'Search',
                                  style: TextStyle(
                                    color: ColorPage.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
