import 'package:drop_down_search_field/drop_down_search_field.dart';
import 'package:employee_management/admin/adminEmpadd.dart';
import 'package:employee_management/color/color.dart';
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
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 10),
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
      child: Card(
        elevation: 4,
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                filled: true,
                fillColor: Colors.white,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 0.5, color: Colors.grey),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 0.5, color: Colors.grey),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(width: 0.5, color: Colors.grey),
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
    );
  }

  Flexible buildAddUserButton() {
    return Flexible(
      flex: 1,
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
    );
  }

  static List<String> getSuggestions(
    String query,
    List<String> items,
  ) {
    List<String> matches = <String>[];
    matches.addAll(items);

    matches.retainWhere((s) => s.toLowerCase().contains(query.toLowerCase()));
    return matches;
  }

  Flexible buildDropdownFormField({
    required String hintText,
    required List<String> items,
    required void Function(String?) onChanged,
    required String? Function(String?) validator,
  }) {
    final TextEditingController _dropdownSearchFieldController =
        TextEditingController();

    SuggestionsBoxController suggestionBoxController =
        SuggestionsBoxController();
    return Flexible(
      flex: 1,
      child: LayoutBuilder(
        builder: (context, constraints) {
          double width = constraints.maxWidth;
          bool isSmallScreen = width < 600;

          return Card(
            elevation: 4,
            child: Container(
              // padding:
              //     isSmallScreen ? EdgeInsets.all(8.0) : EdgeInsets.all(16.0),
              child: DropDownSearchFormField(
                textFieldConfiguration: TextFieldConfiguration(
                  decoration: InputDecoration(
                    labelText: hintText,
                    filled: true,
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 0.5, color: Colors.grey),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 0.5, color: Colors.grey),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 0.5, color: Colors.grey),
                    ),
                  ),
                  controller: _dropdownSearchFieldController,
                ),
                suggestionsCallback: (pattern) {
                  return getSuggestions(pattern, items);
                },
                itemBuilder: (context, String suggestion) {
                  return ListTile(
                    title: Text(suggestion),
                  );
                },
                itemSeparatorBuilder: (context, index) {
                  return const Divider();
                },
                transitionBuilder: (context, suggestionsBox, controller) {
                  return suggestionsBox;
                },
                onSuggestionSelected: (String suggestion) {
                  _dropdownSearchFieldController.text = suggestion;
                  onChanged(suggestion);
                },
                suggestionsBoxController: suggestionBoxController,
                validator: validator,
                displayAllSuggestionWhenTap: true,
              ),
            ),
          );
        },
      ),
    );
  }
}
