import 'dart:developer';

import 'package:employee_management/admin/AdminSignUp.dart';
import 'package:employee_management/admin/admindashboard.dart';
import 'package:employee_management/color/color.dart';
import 'package:employee_management/employee/empdashboard.dart';
import 'package:employee_management/employee/showpassword.dart';
import 'package:employee_management/employee/widget/dialogwidget.dart';
import 'package:employee_management/getx/getx.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EmpLogin extends StatefulWidget {
  const EmpLogin({super.key});

  @override
  State<EmpLogin> createState() => _EmpLoginState();
}

class _EmpLoginState extends State<EmpLogin> {
  double textfieldsize = 400;
  EdgeInsets padding = EdgeInsets.symmetric(vertical: 1);

  Getx getx = Get.put(Getx());
  GlobalKey<FormState> gk = GlobalKey();
  GlobalKey<FormState> forgetkey = GlobalKey();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController forgetpasswordemail = TextEditingController();
  bool logincheckbox = false;

  forgetPassword() {
    dialog(
      buttonname2: 'Continue',
      context,
      title: 'Enter your Email',
      onPressed1: () {
        Get.back();
      },
      onPressed2: () {
        if (forgetkey.currentState!
            .validate()) if (GetUtils.isEmail(forgetpasswordemail.text)) {
          Get.back();
          Get.to(() => ForGetPassword(forgetpasswordemail.text),
              transition: Transition.leftToRight);
        }
      },
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) {
          log(value.toString());
          if (value!.isEmpty) {
            return "enter your email";
          }
          if (!GetUtils.isEmail(forgetpasswordemail.text)) {
            return "Please enter correct email address";
          }
          return null;
        },
        controller: forgetpasswordemail,
        decoration: InputDecoration(
            fillColor: ColorPage.white,
            filled: true,
            hintText: 'Email',
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10))),
      ),
    );
  }

  Future<void> getdata() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    email.text = sp.getString('usernameid') ?? '';
    password.text = sp.getString('passwordid') ?? '';
    if (email.text.isNotEmpty && password.text.isNotEmpty) {
      logincheckbox = true;
    }
    setState(() {}); // Refresh UI with loaded data
  }

  @override
  void initState() {
    getdata();
    // TODO: implement initState
    super.initState();
  }

  bool passwordshow = true;
  // GlobalKey<FormState> gk = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    'assets/app_icon/loginbackground/1.jpg',
                  ),
                  fit: BoxFit.cover)),
          child: Center(
              child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Form(
                  key: gk,
                  child: Container(
                    // height: MediaQuery.sizeOf(context).height,
                    padding: EdgeInsets.all(20),

                    decoration: BoxDecoration(
                      color: ColorPage.buttoncolor1,
                      // color: Colors.blue,
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
                                'Login'.toUpperCase(),
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
                        // Padding(
                        //   padding: const EdgeInsets.symmetric(vertical: 10),
                        //   child: SizedBox(
                        //       width: textfieldsize,
                        //       child: TextFormField(
                        //         // controller: fullname,
                        //         decoration: InputDecoration(
                        //           contentPadding: padding,
                        //           filled: true,
                        //           fillColor: ColorPage.white,
                        //           border: OutlineInputBorder(
                        //               borderSide: BorderSide.none),
                        //           prefixIcon: Icon(
                        //             Icons.person,
                        //             color: ColorPage.red,
                        //           ),
                        //           hintText: 'Full Name',
                        //           // helperText: '',
                        //         ),
                        //       )),
                        // ),

                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                  width: textfieldsize,
                                  child: TextFormField(
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Can't blank";
                                      }
                                      return null;
                                    },
                                    textInputAction: TextInputAction.next,
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
                        // Padding(
                        //   padding: const EdgeInsets.symmetric(vertical: 10),
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.center,
                        //     children: [
                        //       SizedBox(
                        //           width: textfieldsize,
                        //           child: TextFormField(
                        //             // controller: phno,
                        //             decoration: InputDecoration(
                        //                 contentPadding: padding,
                        //                 border: OutlineInputBorder(
                        //                     borderSide: BorderSide.none),
                        //                 filled: true,
                        //                 fillColor: ColorPage.white,
                        //                 hintText: 'Phone no',
                        //                 prefixIcon: Icon(
                        //                   Icons.phone,
                        //                   color: ColorPage.red,
                        //                 )),
                        //           ))
                        //     ],
                        //   ),
                        // ),

                        // Padding(
                        //   padding:
                        //       const EdgeInsets.symmetric(vertical: 10),
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.center,
                        //     children: [
                        //       Obx(
                        //         () => SizedBox(
                        //             width: MediaQuery.sizeOf(context)
                        //                     .width -
                        //                 1100,
                        //             child:
                        //                 DropdownButtonFormField<String>(
                        //               decoration: const InputDecoration(
                        //                   filled: true,
                        //                   fillColor: Color.fromARGB(
                        //                       255, 234, 231, 231),
                        //                   prefixIcon: Icon(
                        //                     Icons.type_specimen,
                        //                     color: Colors.grey,
                        //                   ),
                        //                   border: OutlineInputBorder(
                        //                       borderSide:
                        //                           BorderSide.none)),
                        //               value: getx.selectedbutton.value,
                        //               items: <String>[
                        //                 'SEO',
                        //                 'Desiner',
                        //                 'Developer',
                        //                 'Manager'
                        //               ].map<DropdownMenuItem<String>>(
                        //                   (String e) {
                        //                 return DropdownMenuItem(
                        //                     value: e, child: Text(e));
                        //               }).toList(),
                        //               onChanged: (v) {
                        //                 getx.selectedbutton.value = v!;
                        //               },
                        //               validator: (value) {
                        //                 if (value == null) {
                        //                   return 'Cannot be null';
                        //                 }
                        //                 return null;
                        //               },
                        //             )),
                        //       )
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
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Can't blank";
                                      }
                                      return null;
                                    },
                                    textInputAction: TextInputAction.next,
                                    onFieldSubmitted: (value) {
                                      getx.loginApi(context, email.text,
                                          password.text, logincheckbox);
                                    },
                                    obscureText: passwordshow,
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
                                                passwordshow = !passwordshow;
                                              });
                                            },
                                            icon: Icon(passwordshow
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
                          padding: const EdgeInsets.symmetric(vertical: 2),
                          child: Container(
                            width: textfieldsize,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Row(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          Get.to(() => AdminSignUp());
                                        },
                                        child: Checkbox(
                                            side: BorderSide(
                                              color: Colors
                                                  .white, // Set the color of the border
                                              width:
                                                  2.0, // Set the width of the border
                                            ),
                                            // hoverColor: Colors.white,

                                            value: logincheckbox,
                                            onChanged: (v) {
                                              logincheckbox = v!;
                                              setState(() {});
                                            }),
                                      ),
                                      Text(
                                        'Remember me',
                                        style:
                                            TextStyle(color: ColorPage.white),
                                      ),
                                    ],
                                  ),
                                ),
                                Form(
                                  key: forgetkey,
                                  child: MaterialButton(
                                    onPressed: () {
                                      forgetPassword();
                                    },
                                    child: Text(
                                      'Forgot Password',
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),

                        // Padding(
                        //   padding: const EdgeInsets.symmetric(vertical: 10),
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.center,
                        //     children: [
                        //       SizedBox(
                        //           width: textfieldsize,
                        //           child: TextFormField(
                        //             // controller: confirmpassword,
                        //             decoration: InputDecoration(
                        //                 contentPadding: padding,
                        //                 filled: true,
                        //                 fillColor: ColorPage.white,
                        //                 border: OutlineInputBorder(
                        //                     borderSide: BorderSide.none),
                        //                 suffixIcon: IconButton(
                        //                     onPressed: () {},
                        //                     icon: const Icon(Icons.visibility)),
                        //                 hintText: 'Confirm Password',
                        //                 prefixIcon: const Icon(
                        //                   Icons.password,
                        //                   color: ColorPage.red,
                        //                 )),
                        //           ))
                        //     ],
                        //   ),
                        // ),

                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 2),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                  width: textfieldsize,
                                  child: InkWell(
                                    onTap: () {
                                      Get.to(() => AdminSignUp());
                                    },
                                    child: Text.rich(
                                        style: TextStyle(color: Colors.white),
                                        TextSpan(
                                            text: "Don't have account ",
                                            children: [
                                              TextSpan(
                                                  text: 'Sign Up',
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
                                      if (gk.currentState!.validate()) {
                                        getx.loginApi(context, email.text,
                                            password.text, logincheckbox);
                                      }
                                      // Get.to(() => EmpDashboard());
                                    },
                                    child: Text(
                                      'Login'.toUpperCase(),
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
          ))),
    );
  }
}
