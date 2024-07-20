import 'package:board_datetime_picker/board_datetime_picker.dart';
import 'package:employee_management/color/color.dart';
import 'package:employee_management/getx/getx.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminProjectCreate extends StatefulWidget {
  const AdminProjectCreate({super.key});

  @override
  State<AdminProjectCreate> createState() => _AdminProjectCreateState();
}

class _AdminProjectCreateState extends State<AdminProjectCreate> {
  Getx getx = Get.put(Getx());
  TextEditingController datePickerController = TextEditingController();
  bool _isHovered = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: LayoutBuilder(
          builder: (context, constraints) {
            // Determine if the layout should be single or double column
            bool isWide = constraints.maxWidth > 600;

            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 5, bottom: 10),
                  child: Form(
                    // key: gk,
                    child: Container(
                      child: isWide
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: _buildFormFields(isWide),
                            )
                          : Column(
                              children: _buildFormFields(isWide),
                            ),
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
      Flexible(
        flex: isWide ? 1 : 0,
        child: Card(
          elevation: 4,
          child: Container(
            alignment: Alignment.center,
            child: TextFormField(
              validator: (value) {
                if (value == null) {
                  return "Cannot be blank";
                }
                return null;
              },
              maxLines: 1,
              decoration: const InputDecoration(
                filled: true,
                fillColor: ColorPage.white,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 0.5, color: Colors.grey),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 0.5, color: Colors.grey),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(width: 0.5, color: Colors.grey),
                ),
                hintText: 'Project Name',
              ),
            ),
          ),
        ),
      ),
      SizedBox(height: isWide ? 0 : 10), // Add spacing for column layout
      Flexible(
        flex: isWide ? 1 : 0,
        child: Card(
          elevation: 4,
          child: Container(
            alignment: Alignment.center,
            child: TextFormField(
              validator: (value) {
                if (value == null) {
                  return "Cannot be blank";
                }
                return null;
              },
              maxLines: 1,
              decoration: const InputDecoration(
                filled: true,
                fillColor: ColorPage.white,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 0.5, color: Colors.grey),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 0.5, color: Colors.grey),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(width: 0.5, color: Colors.grey),
                ),
                hintText: 'Website Address',
              ),
            ),
          ),
        ),
      ),
      SizedBox(height: isWide ? 0 : 10), // Add spacing for column layout
      Flexible(
        flex: isWide ? 1 : 0,
        child: Card(
          elevation: 4,
          child: Container(
            alignment: Alignment.center,
            child: TextFormField(
              validator: (value) {
                if (value == null) {
                  return "Cannot be blank";
                }
                return null;
              },
              maxLines: 1,
              decoration: const InputDecoration(
                filled: true,
                fillColor: ColorPage.white,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 0.5, color: Colors.grey),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 0.5, color: Colors.grey),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(width: 0.5, color: Colors.grey),
                ),
                hintText: 'Client Name',
              ),
            ),
          ),
        ),
      ),
      SizedBox(height: isWide ? 0 : 10), // Add spacing for column layout
      Flexible(
        flex: isWide ? 1 : 0,
        child: Card(
          elevation: 4,
          child: Container(
            alignment: Alignment.center,
            child: TextFormField(
              maxLines: 1,
              controller: datePickerController,
              decoration: InputDecoration(
                filled: true,
                fillColor: ColorPage.white,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 0.5, color: Colors.grey),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 0.5, color: Colors.grey),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(width: 0.5, color: Colors.grey),
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
      SizedBox(height: isWide ? 0 : 10), // Add spacing for column layout
      Flexible(
        flex: isWide ? 1 : 0,
        child: Card(
          elevation: 4,
          child: Container(
            alignment: Alignment.center,
            child: TextFormField(
              validator: (value) {
                if (value == null) {
                  return "Cannot be blank";
                }
                return null;
              },
              maxLines: 1,
              decoration: const InputDecoration(
                filled: true,
                fillColor: ColorPage.white,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 0.5, color: Colors.grey),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 0.5, color: Colors.grey),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(width: 0.5, color: Colors.grey),
                ),
                hintText: 'Monthly Price',
              ),
            ),
          ),
        ),
      ),
      SizedBox(height: isWide ? 0 : 10), // Add spacing for column layout
      Flexible(
        flex: isWide ? 1 : 0,
        child: Card(
          elevation: 4,
          child: DropdownButtonFormField<String>(
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
            hint: Text('Alloted Employee'),
            items: <String>["SEO", "Developer", "Content writer"]
                .map<DropdownMenuItem<String>>((String e) {
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
      SizedBox(height: isWide ? 0 : 10), // Add spacing for column layout
      Flexible(
        flex: isWide ? 1 : 0,
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
    ];
  }
}
