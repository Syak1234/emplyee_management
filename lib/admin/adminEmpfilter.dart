import 'package:board_datetime_picker/board_datetime_picker.dart';
import 'package:employee_management/color/color.dart';
import 'package:employee_management/getx/getx.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminEmpFilter extends StatelessWidget {
  AdminEmpFilter({super.key});
  Getx getx = Get.put(Getx());
  GlobalKey<FormState> gk = GlobalKey();
  TextEditingController fullname = TextEditingController();
  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();

  TextEditingController datePickerController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 5, bottom: 10),
            child: Form(
              // key: gk,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return Container(
                    child: Wrap(
                      spacing: 20,
                      runSpacing: 8.0,
                      children: [
                        _buildTextFormField('KEYWORD', Icons.person),
                        _buildDatePickerField('DATE', context),
                        _buildDropdownField(
                            'TYPE', ["SEO", "Developer", "Content writer"]),
                        _buildDropdownField(
                            'STATUS', ["Active", "Inactive", "Pending"]),
                        _buildDropdownField('EMPLOYEE',
                            ["Employee 1", "Employee 2", "Employee 3"]),
                        _buildDropdownField('CLIENT WISE',
                            ["Client 1", "Client 2", "Client 3"]),
                        _buildDropdownField('PROJECT WISE',
                            ["Project 1", "Project 2", "Project 3"]),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          Expanded(
            child: Obx(
              () => ListView.builder(
                  shrinkWrap: true,
                  itemCount: getx.timebreaklist.length,
                  itemBuilder: (context, index) {
                    var x = getx.timebreaklist[index];
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
                                child: Text(x.startbreak),
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
                                child: Text(x.endbreak),
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
                                child: Text(x.timetaken),
                              ),
                            ),
                          ],
                        ));
                  }),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextFormField(String hintText, IconData icon) {
    return Container(
      width: 200,
      child: Card(
        elevation: ColorPage.elevation,
        child: TextFormField(
          validator: (value) {
            if (value == null) {
              return "Cannot be blank";
            }
            return null;
          },
          maxLines: 1,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 0.5, color: Colors.grey)),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 0.5, color: Colors.grey)),
            border: OutlineInputBorder(
                borderSide: BorderSide(width: 0.5, color: Colors.grey)),
            prefixIcon: Icon(icon),
            hintText: hintText,
          ),
        ),
      ),
    );
  }

  Widget _buildDatePickerField(String hintText, BuildContext context) {
    return Container(
      width: 200,
      child: Card(
        elevation: ColorPage.elevation,
        child: TextFormField(
          maxLines: 1,
          controller: datePickerController,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 0.5, color: Colors.grey)),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 0.5, color: Colors.grey)),
            border: OutlineInputBorder(
                borderSide: BorderSide(width: 0.5, color: Colors.grey)),
            suffixIcon: IconButton(
              onPressed: () async {
                final result = await showBoardDateTimeMultiPicker(
                  context: context,
                  pickerType: DateTimePickerType.datetime,
                );
                datePickerController.text = '${result?.start}${result!.end}';
              },
              icon: Icon(Icons.date_range),
            ),
            hintText: hintText,
          ),
        ),
      ),
    );
  }

  Widget _buildDropdownField(String hintText, List<String> items) {
    return Container(
      width: 200,
      child: Card(
        elevation: ColorPage.elevation,
        child: DropdownButtonFormField<String>(
          decoration: InputDecoration(
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
              child: Text(e, overflow: TextOverflow.ellipsis),
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
        ),
      ),
    );
  }
}
