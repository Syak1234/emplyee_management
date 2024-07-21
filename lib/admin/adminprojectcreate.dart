import 'package:board_datetime_picker/board_datetime_picker.dart';
import 'package:employee_management/color/color.dart';
import 'package:employee_management/employee/widget/multiplecheckboxdropdownwidget.dart';
import 'package:employee_management/employee/widget/searchDropDown.dart';
import 'package:employee_management/employee/widget/textFormFieldWidget.dart';
import 'package:employee_management/getx/getx.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminProjectCreate extends StatefulWidget {
  const AdminProjectCreate({super.key});

  @override
  State<AdminProjectCreate> createState() => _AdminProjectCreateState();
}

class _AdminProjectCreateState extends State<AdminProjectCreate> {
  Getx getx = Get.put(Getx());
  TextEditingController monthlyprice = TextEditingController();

  TextEditingController datePickerController = TextEditingController();
  bool _isHovered = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: LayoutBuilder(
          builder: (context, constraints) {
            // Determine if the layout should be single or double column
            bool isWide = constraints.maxWidth > 600;

            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 0, top: 15, bottom: 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Create Project',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 15, bottom: 0, left: 20, right: 20),
                  child: Form(
                    // key: gk,
                    child: Container(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: _buildFormFields(isWide),
                    )
                        // : Column(
                        //     children: _buildFormFields(isWide),
                        //   ),
                        ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  List<Widget> _buildFormFields(bool isWide) {
    return [
      buildTextFormField(
        controller: monthlyprice,
        hintText: 'Project Name',
        icon: Icons.price_check,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Cannot be blank";
          }
          return null;
        },
      ),
      SizedBox(height: isWide ? 10 : 10), // Add spacing for column layout

      buildTextFormField(
        controller: monthlyprice,
        hintText: 'Website URL',
        icon: Icons.price_check,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Cannot be blank";
          }
          return null;
        },
      ),
      SizedBox(height: isWide ? 10 : 10),
      buildTextFormField(
        controller: monthlyprice,
        hintText: 'Client Name',
        icon: Icons.price_check,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Cannot be blank";
          }
          return null;
        },
      ), // Add spacing for column layout

      SizedBox(height: isWide ? 10 : 10), // Add spacing for column layout
      Flexible(
        flex: isWide ? 1 : 1,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Container(
            decoration: ColorPage.decoration1,
            alignment: Alignment.center,
            child: TextFormField(
              maxLines: 1,
              controller: datePickerController,
              decoration: InputDecoration(
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
                suffixIcon: IconButton(
                  onPressed: () async {
                    final result = await showBoardDateTimeMultiPicker(
                      context: context,
                      pickerType: DateTimePickerType.datetime,
                    );
                    datePickerController.text =
                        '${result?.start}${result!.end}';
                    setState(() {});
                  },
                  icon: Icon(
                    Icons.date_range,
                  ),
                ),
                hintText: 'Start Date',
              ),
            ),
          ),
        ),
      ),
      SizedBox(height: isWide ? 10 : 10),
      buildTextFormField(
        controller: monthlyprice,
        hintText: 'Monthly Price',
        icon: Icons.price_check,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Cannot be blank";
          }
          return null;
        },
      ),
      // Add spacing for column layout

      SizedBox(height: isWide ? 10 : 10), // Add spacing for column layout
      buildMultipleCheckBoxDropdownSearch(
        flex: 1,
        hintText: ' Alloted Employee',
        checkbox: Checkbox.adaptive(value: false, onChanged: (v) {}),
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

      SizedBox(height: isWide ? 10 : 10), // Add spacing for column layout
      Flexible(
        flex: isWide ? 1 : 1,
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
                    color: _isHovered ? ColorPage.buttoncolor1 : Colors.green,
                  ),
                  padding: EdgeInsets.symmetric(vertical: 14),
                  alignment: Alignment.center,
                  child: Text(
                    'Submit',
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
    ];
  }
}
