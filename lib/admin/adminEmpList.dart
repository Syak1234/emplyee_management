import 'package:employee_management/admin/admin_model/adminEmpAdd.dart';
import 'package:employee_management/color/color.dart';
import 'package:employee_management/getx/getx.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminEmpList extends StatefulWidget {
  const AdminEmpList({super.key});

  @override
  State<AdminEmpList> createState() => _AdminEmpListState();
}

class _AdminEmpListState extends State<AdminEmpList> {
  Getx getx = Get.put(Getx());
  GlobalKey<FormState> gk = GlobalKey();
  TextEditingController fullname = TextEditingController();
  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();
  BoxDecoration decoration = const BoxDecoration(
      // borderRadius: BorderRadius.circular(10),
      gradient: LinearGradient(colors: [
    Color.fromARGB(255, 5, 103, 249),
    Colors.blue,
  ])
      // color: Color.fromARGB(81, 14, 14, 28),
      );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 0, top: 10, bottom: 0),
              child: Row(
                children: [
                  Text(
                    'Add Employee',
                    textScaler: TextScaler.linear(2),
                  ),
                ],
              ),
            ),
           
            Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 10),
              child: Form(
                key: gk,
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
                                controller: fullname,
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
                                  prefixIcon: Icon(
                                    Icons.person,
                                    // color: Colors.white,
                                  ),
                                  // hintStyle: TextStyle(color: Colors.black),
                                  hintText: 'Full Name',
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
                                controller: email,
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
                                  prefixIcon: Icon(
                                    Icons.email,
                                    // color: Colors.white,
                                  ),
                                  // hintStyle: TextStyle(color: Colors.black),
                                  hintText: 'Email',
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
                            hint: Text('Type'),
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
                                validator: (value) {
                                  if (value == null) {
                                    return "Cannot blank";
                                  }
                                  return null;
                                },
                                controller: password,
                                decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.visibility)),
                                  prefixIcon: IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.password)),
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
                                  hintText: 'Password',
                                  // helperText: '',
                                  // hintStyle: TextStyle(),
                                ),
                              )),
                        ),
                      ),
                      Flexible(
                        // flex: 1,
                        child: InkWell(
                          onTap: () {
                            if (gk.currentState!.validate()) {
                              AdminEmpAdd add = AdminEmpAdd(
                                  fullname: fullname.text,
                                  email: email.text,
                                  emprole: getx.projecttype.value,
                                  password: password.text);
                              getx.empaddList.add(add);
                            }
                          },
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
                                  'Add User',
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
                      flex: 1,
                      child: Card(
                        elevation: 10,
                        child: Container(
                            decoration: decoration,
                            alignment: Alignment.center,
                            // width: 200,
                            padding: EdgeInsets.all(8),
                            child: Text(
                              'User Name',
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
                              'Email',
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
                              'Employee Role',
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
                              'Password',
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
                child: Obx(
              () => ListView.builder(
                itemCount: getx.empaddList.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(width: 0.3),
                      ),
                      // color:
                      //     index % 2 == 0 ? Colors.pink[100] : null
                    ),
                    padding: EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Flexible(
                          flex: 1,
                          child: Container(
                            // width: MediaQuery.sizeOf(context).width - 1000,
                            decoration: BoxDecoration(
                                // color: ColorPage.buttoncolor2,
                                border: Border(right: BorderSide(width: 0.3))
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
                                getx.empaddList[index].fullname),
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Container(
                            decoration: BoxDecoration(
                                // color: ColorPage.buttoncolor2,
                                border: Border(right: BorderSide(width: 0.3))
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
                            child: Text(getx.empaddList[index].email),
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Container(
                            decoration: BoxDecoration(
                                // color: ColorPage.buttoncolor2,
                                border: Border(right: BorderSide(width: 0.3))
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
                            child: Text(getx.empaddList[index].emprole),
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border(right: BorderSide(width: 0.3))
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
                              getx.empaddList[index].password,
                              // style: const TextStyle(color: Colors.red),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ))
          ],
        ),
      ),
    );
  }
}
