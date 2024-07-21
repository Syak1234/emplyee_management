import 'package:employee_management/admin/admin_model/adminEmpAdd.dart';
import 'package:employee_management/color/color.dart';
import 'package:employee_management/employee/widget/textFormFieldWidget.dart';
import 'package:employee_management/getx/getx.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminEmpAdd extends StatefulWidget {
  const AdminEmpAdd({super.key});

  @override
  State<AdminEmpAdd> createState() => _AdminEmpAddState();
}

class _AdminEmpAddState extends State<AdminEmpAdd> {
  Getx getx = Get.put(Getx());
  GlobalKey<FormState> gk = GlobalKey();
  TextEditingController fullname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  BoxDecoration decoration = const BoxDecoration(
      gradient: LinearGradient(colors: [
    Color.fromARGB(255, 5, 103, 249),
    Colors.blue,
  ]));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          double width = constraints.maxWidth;
          bool isSmallScreen = width < 600;

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Padding(
                 padding : const EdgeInsets.only(left: 0, top: 15, bottom: 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Add Employee',
                        style: TextStyle(
                            fontSize: isSmallScreen ? 16 : 30,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 15, bottom: 0, left: 20, right: 20),
                  child: Form(
                    key: gk,
                    child: Column(
                      children: [
                        ResponsiveRow(
                          children: [
                            buildTextFormField(
                              controller: fullname,
                              hintText: 'Full Name',
                              icon: Icons.person,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Cannot be blank";
                                }
                                return null;
                              },
                            ),
                            buildTextFormField(
                              controller: email,
                              hintText: 'Email',
                              icon: Icons.email,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Cannot be blank";
                                }
                                return null;
                              },
                            ),
                            buildDropdownFormField(
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
                            buildTextFormField(
                              controller: password,
                              hintText: 'Password',
                              icon: Icons.password,
                              isPassword: true,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Cannot be blank";
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
                        buildHeaderCell('User Name'),
                        buildHeaderCell('Email'),
                        buildHeaderCell('Employee Role'),
                        buildHeaderCell('Password'),
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
                          ),
                          padding:
                              EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                          child: ResponsiveRow(
                            children: [
                              buildDataCell(getx.empaddList[index].fullname),
                              buildDataCell(getx.empaddList[index].email),
                              buildDataCell(getx.empaddList[index].emprole),
                              buildDataCell(getx.empaddList[index].password),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  // Flexible buildTextFormField({
  //   required TextEditingController controller,
  //   required String hintText,
  //   required IconData icon,
  //   required String? Function(String?)? validator,
  //   bool isPassword = false,
  // }) {
  //   return Flexible(
  //     flex: 1,
  //     child: Padding(
  //       padding: const EdgeInsets.symmetric(horizontal: 5),
  //       child: Container(
  //         decoration: ColorPage.decoration1,
  //         alignment: Alignment.center,
  //         child: TextFormField(
  //           controller: controller,
  //           maxLines: 1,
  //           // obscureText: isPassword,
  //           validator: validator,
  //           decoration: InputDecoration(
  //             filled: true,
  //             fillColor: ColorPage.white,
  //             focusedBorder: OutlineInputBorder(
  //               borderSide: BorderSide(width: 0.5, color: Colors.black),
  //             ),
  //             enabledBorder: OutlineInputBorder(
  //               borderSide: BorderSide(width: 0.5, color: Colors.black),
  //             ),
  //             border: OutlineInputBorder(
  //               borderSide: BorderSide(width: 0.5, color: Colors.black),
  //             ),
  //             // prefixIcon: Icon(icon),
  //             labelText: hintText,
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  Flexible buildDropdownFormField({
    required String hintText,
    required List<String> items,
    required void Function(String?) onChanged,
    required String? Function(String?) validator,
  }) {
    return Flexible(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Container(
          decoration: ColorPage.decoration1,
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
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
    return 
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
                  color: _isHovered ? ColorPage.buttoncolor1 : Colors.green,
                ),
                padding: EdgeInsets.symmetric(vertical: 14),
                alignment: Alignment.center,
                child: Text(
                  'Add User',
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
}

class ResponsiveRow extends StatelessWidget {
  final List<Widget> children;
  const ResponsiveRow({required this.children});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    bool isSmallScreen = width < 600;

    return isSmallScreen
        ? Column(
            children: children.map((child) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: child,
              );
            }).toList(),
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: children,
          );
  }
}
