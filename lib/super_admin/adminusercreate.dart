import 'package:flutter/material.dart';
import 'package:employee_management/admin/admin_model/adminEmpAdd.dart';
import 'package:employee_management/color/color.dart';
import 'package:employee_management/getx/getx.dart';
import 'package:get/get.dart';

class AdminUserCreate extends StatefulWidget {
  AdminUserCreate({super.key});

  @override
  State<AdminUserCreate> createState() => _AdminUserCreateState();
}

class _AdminUserCreateState extends State<AdminUserCreate> {
  final Getx getx = Get.put(Getx());

  final GlobalKey<FormState> gk = GlobalKey();

  final TextEditingController fullname = TextEditingController();

  final TextEditingController email = TextEditingController();

  final TextEditingController password = TextEditingController();

  final TextEditingController phone = TextEditingController();

  final BoxDecoration decoration = const BoxDecoration(
    gradient: LinearGradient(colors: [
      Color.fromARGB(255, 5, 103, 249),
      Colors.blue,
    ]),
  );

  final RxBool checkbox = false.obs;

  final RxList<int> selectedIndices = <int>[].obs;
  @override
  void initState() {
    d();
    // TODO: implement initState
    super.initState();
  }

  d() {
    AdminEmpAdd empAdd = AdminEmpAdd(
      fullname: 'Sayak Mishra',
      email: 'sayakmishra@gmail.com',
      emprole: 'Developer',
      password: '123456',
    );
    for (int i = 0; i < 10; i++) getx.empaddList.add(empAdd);
  }

  @override
  Widget build(BuildContext context) {
    // Mock data for demonstration

    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          double width = constraints.maxWidth;
          bool isSmallScreen = width < 600;

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 0, top: 10, bottom: 0),
                  child: Row(
                    children: [
                      Text(
                        'Add Admin',
                        style: TextStyle(fontSize: isSmallScreen ? 16 : 24),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5, bottom: 10),
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
                            buildTextFormField(
                              controller: password,
                              hintText: 'Phone No',
                              icon: Icons.phone,
                              isPassword: true,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Cannot be blank";
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
                    color: Color.fromARGB(255, 57, 161, 247),
                    child: ResponsiveRow(
                      children: [
                        buildHeaderCell('User Name'),
                        buildHeaderCell('Email'),
                        buildHeaderCell('Employee Role'),
                        buildHeaderCell('Password'),
                        buildHeaderSmallCell('Status'),
                        buildHeaderSmallCell('Edit'),
                        buildHeaderSmallCell('Delete'),
                        buildHeaderSmallCell('Block'),
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
                        bool isSelected = selectedIndices.contains(index);
                        return Container(
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                width: 0.5,
                              ),
                            ),
                          ),
                          child: ResponsiveRow(
                            children: [
                              buildDataCell(getx.empaddList[index].fullname),
                              buildDataCell(getx.empaddList[index].email),
                              buildDataCell(getx.empaddList[index].emprole),
                              buildDataCell(getx.empaddList[index].password),
                              buildDataSmallCell(
                                Text(
                                  'Active',
                                  style: TextStyle(color: Colors.green),
                                ),
                                index,
                              ),
                              buildDataSmallCell(
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.edit,
                                    color: Colors.green,
                                  ),
                                ),
                                index,
                              ),
                              buildDataSmallCell(
                                IconButton(
                                  onPressed: () {
                                    print(index);
                                  },
                                  icon: Icon(
                                    Icons.delete_forever,
                                    color: Colors.red,
                                  ),
                                ),
                                index,
                              ),
                              buildDataSmallCell(
                                Checkbox(
                                  value: isSelected,
                                  onChanged: (value) {
                                    if (value != null) {
                                      isSelected = value;
                                      if (isSelected) {
                                        selectedIndices.add(index);
                                      } else {
                                        selectedIndices.remove(index);
                                      }
                                    }
                                    setState(() {});
                                  },
                                  checkColor: isSelected ? Colors.white : null,
                                  fillColor: MaterialStateProperty.all(
                                    isSelected
                                        ? Colors.red
                                        : Colors.transparent,
                                  ),
                                ),
                                index,
                              ),
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

  Flexible buildTextFormField({
    required TextEditingController controller,
    required String hintText,
    required IconData icon,
    required String? Function(String?)? validator,
    bool isPassword = false,
  }) {
    return Flexible(
      flex: 1,
      child: Card(
        elevation: 4,
        child: Container(
          alignment: Alignment.center,
          child: TextFormField(
            controller: controller,
            maxLines: 1,
            obscureText: isPassword,
            validator: validator,
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
              prefixIcon: Icon(icon),
              hintText: hintText,
            ),
          ),
        ),
      ),
    );
  }

  Flexible buildAddUserButton() {
    return Flexible(
      flex: 1,
      child: InkWell(
        onTap: () {
          if (gk.currentState!.validate()) {
            AdminEmpAdd add = AdminEmpAdd(
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
          elevation: 4,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.green,
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
    );
  }

  Flexible buildHeaderCell(String text) {
    return Flexible(
      flex: 2,
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

  Flexible buildHeaderSmallCell(String text) {
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
      flex: 2,
      child: Container(
        decoration: BoxDecoration(
          border: Border(right: BorderSide(width: 0.3)),
        ),
        padding: EdgeInsets.all(0),
        alignment: Alignment.center,
        child: Text(
          text,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }

  Flexible buildDataSmallCell(Widget icon, int index) {
    return Flexible(
      flex: 1,
      child: Container(
        decoration: BoxDecoration(
          border: Border(right: BorderSide(width: 0.3)),
        ),
        alignment: Alignment.center,
        child: icon,
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
            children: children,
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: children,
          );
  }
}
