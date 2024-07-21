import 'package:board_datetime_picker/board_datetime_picker.dart';
import 'package:employee_management/admin/admin_model/adminEmpAdd.dart';
import 'package:employee_management/color/color.dart';
import 'package:employee_management/employee/widget/searchDropDown.dart';
import 'package:employee_management/getx/getx.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminEmpFilter extends StatefulWidget {
  AdminEmpFilter({super.key});

  @override
  State<AdminEmpFilter> createState() => _AdminEmpFilterState();
}

class _AdminEmpFilterState extends State<AdminEmpFilter> {
  Getx getx = Get.put(Getx());

  GlobalKey<FormState> gk = GlobalKey();

  TextEditingController fullname = TextEditingController();

  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();

  TextEditingController datePickerController = TextEditingController();
  bool _isHovered = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            //  Padding(
            //        padding : const EdgeInsets.only(left: 0, top: 15, bottom: 0),
            //         child: Row(
            //           mainAxisAlignment: MainAxisAlignment.center,
            //           children: [
            //             Text(
            //               'Add Employee',
            //               style: TextStyle(
            //                   fontSize: 30,
            //                   fontWeight: FontWeight.bold),
            //             ),
            //           ],
            //         ),
            //       ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 15, bottom: 0, left: 20, right: 20),
              child: Form(
                  // key: gk,
                  child: Row(
                children: [
                  buildDropdownFormField(
                    flex: 2,
                    hintText: 'Keyword',
                    items: ['abc', 'Shubham'],
                    onChanged: (v) {},
                    validator: (p0) {},
                  ),
                  //
                  // _buildTextFormField('Keyword', Icons.person),
                  _buildDatePickerField('Date', context),
                  buildDropdownFormField(
                    flex: 2,
                    hintText: 'Type',
                    items: ["SEO", "Developer", "Content writer"],
                    onChanged: (v) {},
                    validator: (p0) {},
                  ),
                  buildDropdownFormField(
                    flex: 1,
                    hintText: 'Status',
                    items: ["Active", "Inactive", "Pending"],
                    onChanged: (v) {},
                    validator: (p0) {},
                  ),

                  buildDropdownFormField(
                    flex: 2,
                    hintText: 'Employee',
                    items: ["Employee 1", "Employee 2", "Employee 3"],
                    onChanged: (v) {},
                    validator: (p0) {},
                  ),
                  buildDropdownFormField(
                    flex: 2,
                    hintText: 'Client',
                    items: ["Client 1", "Client 2", "Client 3"],
                    onChanged: (v) {},
                    validator: (p0) {},
                  ),
                  buildDropdownFormField(
                    flex: 2,
                    hintText: 'Project',
                    items: ["Project 1", "Project 2", "Project 3"],
                    onChanged: (v) {},
                    validator: (p0) {},
                  ),
                  Flexible(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: MouseRegion(
                        onEnter: (_) => setState(() => _isHovered = true),
                        onExit: (_) => setState(() => _isHovered = false),
                        child: InkWell(
                          onTap: () {
                            if (gk.currentState!.validate()) {
                              AdminEmpAddModel add = AdminEmpAddModel(
                                fullname: fullname.text,
                                email: email.text,
                                emprole: getx.projecttype.value,
                                password: password.text,
                              );
                              getx.empaddList.add(add);
                            }
                          },
                          child: Card(
                            margin: EdgeInsets.all(0),
                            elevation: ColorPage.elevation,
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
                  )
                ],
              )),
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
      ),
    );
  }

  // Widget _buildTextFormField(String hintText, IconData icon) {
  Widget _buildDatePickerField(String hintText, BuildContext context) {
    return Flexible(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Container(
          decoration: ColorPage.decoration1,
          // width: 150,
          child: TextFormField(
            maxLines: 1,
            controller: datePickerController,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 0.5, color: Colors.black)),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 0.5, color: Colors.black)),
              border: OutlineInputBorder(
                  borderSide: BorderSide(width: 0.5, color: Colors.black)),
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
      ),
    );
  }
}
