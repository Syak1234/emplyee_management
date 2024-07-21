import 'package:drop_down_search_field/drop_down_search_field.dart';
import 'package:employee_management/admin/adminEmpadd.dart';
import 'package:employee_management/color/color.dart';
import 'package:employee_management/employee/widget/searchDropDown.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../getx/getx.dart';

class AdminEmpAttendance extends StatefulWidget {
  const AdminEmpAttendance({super.key});

  @override
  State<AdminEmpAttendance> createState() => _AdminEmpAttendanceState();
}

class _AdminEmpAttendanceState extends State<AdminEmpAttendance> {
  TextEditingController type = TextEditingController();
  Getx getx = Get.put(Getx());

  TextEditingController empname = TextEditingController();
  BoxDecoration decoration = const BoxDecoration(
      gradient: LinearGradient(colors: [
    Color.fromARGB(255, 5, 103, 249),
    Colors.blue,
  ]));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    'Attendance',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 15, bottom: 0, left: 20, right: 20),
              child: Form(
                // key: gk,
                child: Column(
                  children: [
                    ResponsiveRow(
                      children: [
                        buildDropdownButton(
                          hintText: 'Type',
                          items: ["SEO", "Developer", "Content writer"],
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
                          flex: 1,
                          hintText: 'Employee Name',
                          items: ["SEO", "Developer", "Content writer"],
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
                        buildAddUserButton(),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 10),
              child: Container(
                color: const Color.fromARGB(255, 57, 161, 247),
                child: ResponsiveRow(
                  children: [
                    buildHeaderCell('Date'),
                    buildHeaderCell('Login Time'),
                    buildHeaderCell('Logout Time'),
                    buildHeaderCell('Break Time'),
                    buildHeaderCell('Work Time'),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(width: 0.3),
                      ),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                    child: ResponsiveRow(
                      children: [
                        buildDataCell('1'),
                        buildDataCell('2'),
                        buildDataCell('3'),
                        buildDataCell('4'),
                        buildDataCell('4'),
                      ],
                    ),
                  );
                  ;
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Flexible buildHeaderCell(String text) {
    return Flexible(
      flex: 1,
      child: Card(
        elevation: 10,
        child: Container(
          decoration: decoration,
          alignment: Alignment.center,
          padding: EdgeInsets.all(8),
          child: Text(
            text,
            style: TextStyle(
              color: ColorPage.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }

  Flexible buildDataCell(String text) {
    return Flexible(
      flex: 1,
      child: Container(
        decoration: BoxDecoration(
          border: Border(right: BorderSide(width: 0.3)),
        ),
        padding: EdgeInsets.all(8),
        alignment: Alignment.center,
        child: Text(
          text,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }

  Flexible buildDropdownButton({
    required String hintText,
    required List<String> items,
    required void Function(String?) onChanged,
    required String? Function(String?) validator,
  }) {
    return Flexible(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Container(
          decoration: ColorPage.decoration1,
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: ColorPage.white,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 0.5, color: Colors.black),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 0.5, color: Colors.black),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 0.5, color: Colors.black),
                  ),
                ),
                hint: Text(hintText),
                items: items.map<DropdownMenuItem<String>>((String e) {
                  return DropdownMenuItem(
                    value: e,
                    child: Text(
                      e,
                      overflow: TextOverflow.ellipsis,
                    ),
                  );
                }).toList(),
                onChanged: onChanged,
                validator: validator,
                isExpanded: true, // Ensure the dropdown button takes full width
              );
            },
          ),
        ),
      ),
    );
  }

  bool _isHovered = false;
  Flexible buildAddUserButton() {
    return Flexible(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        // padding: const EdgeInsets.all(8.0),
        child: MouseRegion(
          onEnter: (_) => setState(() => _isHovered = true),
          onExit: (_) => setState(() => _isHovered = false),
          child: InkWell(
            onTap: () {},
            child: Card(
              margin: EdgeInsets.all(0),
              elevation: ColorPage.elevation,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: _isHovered ? ColorPage.buttoncolor1 : Colors.green,
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
    );
  }

  // Flexible buildDropdownFormField({
  //   required String hintText,
  //   required List<String> items,
  //   required void Function(String?) onChanged,
  //   required String? Function(String?) validator,
  // }) {
  //   final TextEditingController _dropdownSearchFieldController =
  //       TextEditingController();

  //   SuggestionsBoxController suggestionBoxController =
  //       SuggestionsBoxController();
  //   return Flexible(
  //     flex: 1,
  //     child: LayoutBuilder(
  //       builder: (context, constraints) {
  //         double width = constraints.maxWidth;
  //         bool isSmallScreen = width < 600;

  //         return Container(
  //           decoration: ColorPage.decoration1,
  //           // padding:
  //           //     isSmallScreen ? EdgeInsets.all(8.0) : EdgeInsets.all(16.0),
  //           child: DropDownSearchFormField(
  //             textFieldConfiguration: TextFieldConfiguration(
  //               decoration: InputDecoration(
  //                 labelText: hintText,
  //                 filled: true,
  //                 fillColor: ColorPage.white,
  //                 focusedBorder: OutlineInputBorder(
  //                   borderSide: BorderSide(width: 0.5, color: Colors.black),
  //                 ),
  //                 enabledBorder: OutlineInputBorder(
  //                   borderSide: BorderSide(width: 0.5, color: Colors.black),
  //                 ),
  //                 border: OutlineInputBorder(
  //                   borderSide: BorderSide(width: 0.5, color: Colors.black),
  //                 ),
  //               ),
  //               controller: _dropdownSearchFieldController,
  //             ),
  //             suggestionsCallback: (pattern) {
  //               return getSuggestions(pattern, items);
  //             },
  //             itemBuilder: (context, String suggestion) {
  //               return ListTile(
  //                 title: Text(suggestion),
  //               );
  //             },
  //             itemSeparatorBuilder: (context, index) {
  //               return const Divider();
  //             },
  //             transitionBuilder: (context, suggestionsBox, controller) {
  //               return suggestionsBox;
  //             },
  //             onSuggestionSelected: (String suggestion) {
  //               _dropdownSearchFieldController.text = suggestion;
  //               onChanged(suggestion);
  //             },
  //             suggestionsBoxController: suggestionBoxController,
  //             validator: validator,
  //             displayAllSuggestionWhenTap: true,
  //           ),
  //         );
  //       },
  //     ),
  //   );
  // }
}
