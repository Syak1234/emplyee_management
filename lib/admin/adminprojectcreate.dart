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
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        flex: 1,
                        child: Card(
                          elevation: 4,
                          child: Container(
                              // decoration: decoration,
                              alignment: Alignment.center,
                              // width: 200,
                              // padding: EdgeInsets.all(8),
                              child: TextFormField(
                                validator: (value) {
                                  if (value == null) {
                                    return "Cannot blank";
                                  }
                                  return null;
                                },
                                // controller: fullname,
                                maxLines: 1,
                                decoration: const InputDecoration(
                                  filled: true,
                                  fillColor: ColorPage.white,
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 0.5, color: Colors.grey)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 0.5, color: Colors.grey)),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 0.5, color: Colors.grey)),

                                  // hintStyle: TextStyle(color: Colors.black),
                                  hintText: 'Project Name',
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
                              alignment: Alignment.center,
                              // width: 200,
                              // padding: EdgeInsets.all(8),
                              child: TextFormField(
                                validator: (value) {
                                  if (value == null) {
                                    return "Cannot blank";
                                  }
                                  return null;
                                },
                                // controller: fullname,
                                maxLines: 1,
                                decoration: const InputDecoration(
                                  filled: true,
                                  fillColor: ColorPage.white,
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 0.5, color: Colors.grey)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 0.5, color: Colors.grey)),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 0.5, color: Colors.grey)),

                                  // hintStyle: TextStyle(color: Colors.black),
                                  hintText: 'Website Address',
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
                              alignment: Alignment.center,
                              // width: 200,
                              // padding: EdgeInsets.all(8),
                              child: TextFormField(
                                validator: (value) {
                                  if (value == null) {
                                    return "Cannot blank";
                                  }
                                  return null;
                                },
                                // controller: email,
                                maxLines: 1,
                                decoration: const InputDecoration(
                                  filled: true,
                                  fillColor: ColorPage.white,
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 0.5, color: Colors.grey)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 0.5, color: Colors.grey)),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 0.5, color: Colors.grey)),

                                  // hintStyle: TextStyle(color: Colors.black),
                                  hintText: 'Client Name',
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
                                          width: 0.5, color: Colors.grey)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 0.5, color: Colors.grey)),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 0.5, color: Colors.grey)),
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
                                  hintText: 'Start Date',
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
                              alignment: Alignment.center,
                              // width: 200,
                              // padding: EdgeInsets.all(8),
                              child: TextFormField(
                                validator: (value) {
                                  if (value == null) {
                                    return "Cannot blank";
                                  }
                                  return null;
                                },
                                // controller: fullname,
                                maxLines: 1,
                                decoration: const InputDecoration(
                                  filled: true,
                                  fillColor: ColorPage.white,
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 0.5, color: Colors.grey)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 0.5, color: Colors.grey)),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 0.5, color: Colors.grey)),

                                  // hintStyle: TextStyle(color: Colors.black),
                                  hintText: 'Monthly Price',
                                  // helperText: '',
                                ),
                              )),
                        ),
                      ),
                      Flexible(
                        flex: 1,
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
                            hint: Text('Alloted Employee'),
                            items: <String>[
                              "SEO",
                              "Developer",
                              "Content writer"
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
                          ),
                        ),
                      ),
                      
                      Flexible(
                        // flex: 1,
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
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
