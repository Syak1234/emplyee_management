import 'package:employee_management/color/color.dart';
import 'package:employee_management/employee/Emplogin.dart';
import 'package:employee_management/employee/empdashboard.dart';
import 'package:employee_management/getx/getx.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminSignUp extends StatefulWidget {
  const AdminSignUp({super.key});

  @override
  State<AdminSignUp> createState() => _AdminSignUpState();
}

class _AdminSignUpState extends State<AdminSignUp> {
  double textfieldsize = 400;
  Getx getx = Get.put(Getx());
  EdgeInsets padding = EdgeInsets.symmetric(vertical: 1);
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phno = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController role = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();
  GlobalKey<FormState> gk = GlobalKey();
  bool adminsignuppasswordshow1 = true;
  bool adminsignuppasswordshow2 = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // height: MediaQuery.sizeOf(context).height,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  'assets/app_icon/loginbackground/1.jpg',
                ),
                fit: BoxFit.cover)),
        child: Center(
          // Centers the child both vertically and horizontally
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment
                  .center, // Ensures the Column takes up the minimum space needed
              children: [
                Form(
                  key: gk,
                  child: Container(
                    // height: MediaQuery.sizeOf(context).height,
                    padding: EdgeInsets.all(20),

                    decoration: BoxDecoration(
                      color: ColorPage.buttoncolor1,
                      // color: Colors.blue,
                      borderRadius: BorderRadius.circular(0),
                    ),
                    // padding: const EdgeInsets.all(100),
                    width: textfieldsize + 200,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              width: textfieldsize,
                              child: Text(
                                'Admin Sign up'.toUpperCase(),
                                style: const TextStyle(
                                    color: ColorPage.white,
                                    fontWeight: FontWeight.bold),
                                textScaler: const TextScaler.linear(1.8),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: textfieldsize,
                                child: const Text(
                                  'Enter your details',
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold),
                                  // textScaler: TextScaler.linear(1.8),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: SizedBox(
                              width: textfieldsize,
                              child: TextFormField(
                                textInputAction: TextInputAction.next,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Can't blank";
                                  }
                                  return null;
                                },
                                controller: name,
                                decoration: InputDecoration(
                                  contentPadding: padding,
                                  filled: true,
                                  fillColor: ColorPage.white,
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide.none),
                                  prefixIcon: Icon(
                                    Icons.person,
                                    color: ColorPage.red,
                                  ),
                                  hintText: 'Full Name',
                                  // helperText: '',
                                ),
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                  width: textfieldsize,
                                  child: TextFormField(
                                    textInputAction: TextInputAction.next,
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Can't blank";
                                      }
                                      return null;
                                    },
                                    controller: email,
                                    decoration: InputDecoration(
                                        contentPadding: padding,
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide.none),
                                        filled: true,
                                        fillColor: ColorPage.white,
                                        hintText: 'Email',
                                        prefixIcon: Icon(
                                          Icons.email,
                                          color: ColorPage.red,
                                        )),
                                  ))
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                  width: textfieldsize,
                                  child: TextFormField(
                                    textInputAction: TextInputAction.next,
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Can't blank";
                                      }
                                      return null;
                                    },
                                    controller: phno,
                                    decoration: InputDecoration(
                                        contentPadding: padding,
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide.none),
                                        filled: true,
                                        fillColor: ColorPage.white,
                                        hintText: 'Phone no',
                                        prefixIcon: Icon(
                                          Icons.phone,
                                          color: ColorPage.red,
                                        )),
                                  ))
                            ],
                          ),
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.symmetric(vertical: 10),
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.center,
                        //     children: [
                        //       RoleSelectionWidget(textfieldsize: textfieldsize)
                        //     ],
                        //   ),
                        // ),

                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                  width: textfieldsize,
                                  child: TextFormField(
                                    obscureText: adminsignuppasswordshow1,
                                    textInputAction: TextInputAction.next,
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Can't blank";
                                      }
                                      return null;
                                    },
                                    controller: password,
                                    decoration: InputDecoration(
                                        contentPadding: padding,
                                        filled: true,
                                        fillColor: ColorPage.white,
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide.none),
                                        suffixIcon: IconButton(
                                            onPressed: () {
                                              setState(() {
                                                adminsignuppasswordshow1 =
                                                    !adminsignuppasswordshow1;
                                              });
                                            },
                                            icon: Icon(adminsignuppasswordshow1
                                                ? Icons.visibility
                                                : Icons.visibility_off)),
                                        hintText: 'Password',
                                        prefixIcon: const Icon(
                                          Icons.password,
                                          color: ColorPage.red,
                                        )),
                                  ))
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                  width: textfieldsize,
                                  child: TextFormField(
                                    obscureText: adminsignuppasswordshow2,
                                    onFieldSubmitted: (value) {
                                      if (gk.currentState!.validate()) {
                                        if (password.text ==
                                            confirmpassword.text) {
                                          getx.signUpApi(
                                              context,
                                              name.text,
                                              phno.text,
                                              getx.selectedRole.value,
                                              email.text,
                                              'West medinipur,721457',
                                              1,
                                              password.text);
                                        }
                                      }
                                    },
                                    textInputAction: TextInputAction.next,
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Can't blank";
                                      }
                                      return null;
                                    },
                                    controller: confirmpassword,
                                    decoration: InputDecoration(
                                        contentPadding: padding,
                                        filled: true,
                                        fillColor: ColorPage.white,
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide.none),
                                        suffixIcon: IconButton(
                                            onPressed: () {
                                              setState(() {
                                                adminsignuppasswordshow2 =
                                                    !adminsignuppasswordshow2;
                                              });
                                            },
                                            icon: Icon(adminsignuppasswordshow2
                                                ? Icons.visibility
                                                : Icons.visibility_off)),
                                        hintText: 'Confirm Password',
                                        prefixIcon: const Icon(
                                          Icons.password,
                                          color: ColorPage.red,
                                        )),
                                  ))
                            ],
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 2),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                  width: textfieldsize,
                                  child: InkWell(
                                    onTap: () {
                                      Get.to(() => EmpLogin(),
                                          transition: Transition.leftToRight);
                                    },
                                    child: Text.rich(
                                        style: TextStyle(color: Colors.white),
                                        TextSpan(
                                            text: 'Already a member? ',
                                            children: [
                                              TextSpan(
                                                  text: 'Login',
                                                  style: TextStyle(
                                                      color: Colors.red,
                                                      fontWeight:
                                                          FontWeight.bold))
                                            ])),
                                  ))
                            ],
                          ),
                        ),

                        //
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(2),
                                    gradient: LinearGradient(colors: [
                                      ColorPage.red,
                                      ColorPage.red
                                    ])),
                                width: textfieldsize,
                                child: ElevatedButton(
                                    autofocus: true,
                                    style: ButtonStyle(
                                        padding: MaterialStatePropertyAll(
                                            EdgeInsets.all(20)),
                                        backgroundColor:
                                            MaterialStatePropertyAll(
                                                Colors.transparent),
                                        shape: MaterialStatePropertyAll(
                                            ContinuousRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        10)))),
                                    onPressed: () {
                                      print('object');
                                      if (gk.currentState!.validate()) {
                                        if (password.text ==
                                            confirmpassword.text) {
                                          getx.signUpApi(
                                              context,
                                              name.text,
                                              phno.text,
                                              getx.selectedRole.value,
                                              email.text,
                                              'West medinipur,721457',
                                              1,
                                              password.text);
                                        }
                                      }
                                    },
                                    child: Text(
                                      'Sign up'.toUpperCase(),
                                      style:
                                          const TextStyle(color: Colors.white),
                                    )),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RoleSelectionWidget extends StatelessWidget {
  final double textfieldsize;

  RoleSelectionWidget({required this.textfieldsize});

  @override
  Widget build(BuildContext context) {
    final Getx rolesController = Get.put(Getx());

    return Obx(
      () => SizedBox(
        width: textfieldsize,
        child: DropdownButtonFormField<String>(
          value: rolesController.selectedRole.value.isEmpty
              ? null
              : rolesController.selectedRole.value,
          items:
              rolesController.roles.map<DropdownMenuItem<String>>((String e) {
            return DropdownMenuItem<String>(
              value: e,
              child: Text(e),
            );
          }).toList(),
          onChanged: (v) {
            rolesController.selectedRole.value = v!;
          },
          onTap: () async {
            // Call fetchRoles when the dropdown is tapped
            await rolesController.fetchRoles();
          },
          decoration: const InputDecoration(
            filled: true,
            fillColor: Color.fromARGB(255, 234, 231, 231),
            prefixIcon: Icon(
              Icons.type_specimen,
              color: ColorPage.red, // Replace with your actual color
            ),
            border: OutlineInputBorder(borderSide: BorderSide.none),
          ),
          hint: rolesController.selectedRole.value.isEmpty
              ? const Text('Role')
              : null,
          disabledHint: const Text('Role'),
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
