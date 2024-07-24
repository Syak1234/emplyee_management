import 'package:employee_management/admin/admindashboard.dart';
import 'package:employee_management/api/api.dart';
import 'package:employee_management/employee/empdashboard.dart';
import 'package:employee_management/getx/getx.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class EmpSignUp extends StatefulWidget {
  const EmpSignUp({super.key});

  @override
  State<EmpSignUp> createState() => _EmpSignUpState();
}

class _EmpSignUpState extends State<EmpSignUp> {
  Getx getx = Get.put(Getx());
  TextEditingController fullname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phno = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();

  GlobalKey<FormState> signupgk = GlobalKey();
  GlobalKey<FormState> logingk = GlobalKey();
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.sizeOf(context).width,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 700,
                  // padding: EdgeInsets.symmetric(vertical: 100),
                  // color: Colors.blue,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 100,
                            color: Colors.grey,
                            offset: Offset(3, -3),
                            spreadRadius: 1)
                      ],
                      gradient:
                          LinearGradient(colors: [Colors.blue, Colors.white])),
                  // padding: EdgeInsets.all(100),
                  width: MediaQuery.sizeOf(context).width - 400,

                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Welcome Back',
                                  textScaler: TextScaler.linear(3),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width:
                                      MediaQuery.sizeOf(context).width - 1200,
                                  child: Text(
                                    textAlign: TextAlign.center,
                                    'To keep connnected with us please login with your personal info',
                                    textScaler: TextScaler.linear(1.2),
                                    style: TextStyle(color: Colors.white),
                                  ),
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ElevatedButton(
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStatePropertyAll(
                                                  Colors.orange),
                                          shape: MaterialStatePropertyAll(
                                              ContinuousRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)))),
                                      onPressed: () {
                                        getx.showloginpage.value =
                                            !getx.showloginpage.value;
                                      },
                                      child: Obx(
                                        () => Text(
                                          getx.showloginpage.value
                                              ? 'Admin / Employee Login'
                                                  .toUpperCase()
                                              : 'Sign Up'.toUpperCase(),
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ))
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Obx(
                        () => Visibility(
                          visible: getx.showloginpage.value,
                          child: Expanded(
                            child: Form(
                              key: signupgk,
                              child: Container(
                                // height: MediaQuery.sizeOf(context).height,
                                // padding: EdgeInsets.symmetric(vertical: 200),

                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  // color: Colors.blue,
                                  // borderRadius: BorderRadius.circular(20),
                                ),
                                // padding: const EdgeInsets.all(100),
                                // width: MediaQuery.sizeOf(context).width - 700,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width:
                                              MediaQuery.sizeOf(context).width -
                                                  1100,
                                          child: Text(
                                            'Admin Sign up'.toUpperCase(),
                                            style: const TextStyle(
                                                color: Colors.orange,
                                                fontWeight: FontWeight.bold),
                                            textScaler:
                                                const TextScaler.linear(1.8),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            width: MediaQuery.sizeOf(context)
                                                    .width -
                                                1100,
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
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                              width: MediaQuery.sizeOf(context)
                                                      .width -
                                                  1100,
                                              child: TextFormField(
                                                controller: fullname,
                                                decoration:
                                                    const InputDecoration(
                                                  filled: true,
                                                  fillColor: Color.fromARGB(
                                                      255, 234, 231, 231),
                                                  border: OutlineInputBorder(
                                                      borderSide:
                                                          BorderSide.none),
                                                  prefixIcon: Icon(
                                                    Icons.person,
                                                    color: Colors.grey,
                                                  ),
                                                  labelText: 'Full Name',
                                                  // helperText: '',
                                                ),
                                              ))
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                              width: MediaQuery.sizeOf(context)
                                                      .width -
                                                  1100,
                                              child: TextFormField(
                                                controller: email,
                                                decoration:
                                                    const InputDecoration(
                                                        border:
                                                            OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide
                                                                        .none),
                                                        filled: true,
                                                        fillColor:
                                                            Color.fromARGB(255,
                                                                234, 231, 231),
                                                        labelText: 'Email',
                                                        prefixIcon: Icon(
                                                          Icons.email,
                                                          color: Colors.grey,
                                                        )),
                                              ))
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                              width: MediaQuery.sizeOf(context)
                                                      .width -
                                                  1100,
                                              child: TextFormField(
                                                controller: phno,
                                                decoration:
                                                    const InputDecoration(
                                                        border:
                                                            OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide
                                                                        .none),
                                                        filled: true,
                                                        fillColor:
                                                            Color.fromARGB(255,
                                                                234, 231, 231),
                                                        labelText: 'Phone no',
                                                        prefixIcon: Icon(
                                                          Icons.phone,
                                                          color: Colors.grey,
                                                        )),
                                              ))
                                        ],
                                      ),
                                    ),

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
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                              width: MediaQuery.sizeOf(context)
                                                      .width -
                                                  1100,
                                              child: TextFormField(
                                                controller: password,
                                                decoration: InputDecoration(
                                                    filled: true,
                                                    fillColor: Color.fromARGB(
                                                        255, 234, 231, 231),
                                                    border: OutlineInputBorder(
                                                        borderSide:
                                                            BorderSide.none),
                                                    suffixIcon: IconButton(
                                                        onPressed: () {},
                                                        icon: const Icon(
                                                            Icons.visibility)),
                                                    labelText: 'Password',
                                                    prefixIcon: const Icon(
                                                      Icons.password,
                                                      color: Colors.grey,
                                                    )),
                                              ))
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                              width: MediaQuery.sizeOf(context)
                                                      .width -
                                                  1100,
                                              child: TextFormField(
                                                controller: confirmpassword,
                                                decoration: InputDecoration(
                                                    filled: true,
                                                    fillColor: Color.fromARGB(
                                                        255, 234, 231, 231),
                                                    border: OutlineInputBorder(
                                                        borderSide:
                                                            BorderSide.none),
                                                    suffixIcon: IconButton(
                                                        onPressed: () {},
                                                        icon: const Icon(
                                                            Icons.visibility)),
                                                    labelText:
                                                        'Confirm Password',
                                                    prefixIcon: const Icon(
                                                      Icons.password,
                                                      color: Colors.grey,
                                                    )),
                                              ))
                                        ],
                                      ),
                                    ),

                                    //
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 20),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                                gradient: LinearGradient(
                                                    colors: [
                                                  Colors.blue,
                                                  Colors.white
                                                ])),
                                            width: MediaQuery.sizeOf(context)
                                                    .width -
                                                1100,
                                            child: ElevatedButton(
                                                style: ButtonStyle(
                                                    padding:
                                                        MaterialStatePropertyAll(
                                                            EdgeInsets.all(20)),
                                                    backgroundColor:
                                                        MaterialStatePropertyAll(
                                                            Colors.transparent),
                                                    shape: MaterialStatePropertyAll(
                                                        ContinuousRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10)))),
                                                onPressed: () {
                                                  if (signupgk.currentState!
                                                          .validate() &&
                                                      password.text ==
                                                          confirmpassword.text)
                                                    registration(
                                                        context,
                                                        fullname.text,
                                                        email.text,
                                                        phno.text,
                                                        password.text);
                                                },
                                                child: Text(
                                                  'Sign up'.toUpperCase(),
                                                  style: const TextStyle(
                                                      color: Colors.white),
                                                )),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Obx(
                        () => Visibility(
                          visible: !getx.showloginpage.value,
                          child: Expanded(
                            child: Form(
                              key: logingk,
                              child: Container(
                                // height: MediaQuery.sizeOf(context).height,
                                // padding: EdgeInsets.symmetric(vertical: 200),

                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  // color: Colors.blue,
                                  // borderRadius: BorderRadius.circular(20),
                                ),
                                // padding: const EdgeInsets.all(100),
                                // width: MediaQuery.sizeOf(context).width - 700,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width:
                                              MediaQuery.sizeOf(context).width -
                                                  1100,
                                          child: Text(
                                            'Admin / Employee Login'
                                                .toUpperCase(),
                                            style: const TextStyle(
                                                color: Colors.orange,
                                                fontWeight: FontWeight.bold),
                                            textScaler:
                                                const TextScaler.linear(1.8),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            width: MediaQuery.sizeOf(context)
                                                    .width -
                                                1100,
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
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                              width: MediaQuery.sizeOf(context)
                                                      .width -
                                                  1100,
                                              child: TextFormField(
                                                controller: email,
                                                decoration:
                                                    const InputDecoration(
                                                        border:
                                                            OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide
                                                                        .none),
                                                        filled: true,
                                                        fillColor:
                                                            Color.fromARGB(255,
                                                                234, 231, 231),
                                                        labelText: 'Email',
                                                        prefixIcon: Icon(
                                                          Icons.email,
                                                          color: Colors.grey,
                                                        )),
                                              ))
                                        ],
                                      ),
                                    ),
                                    // Padding(
                                    //   padding: const EdgeInsets.symmetric(
                                    //       vertical: 10),
                                    //   child: Row(
                                    //     mainAxisAlignment:
                                    //         MainAxisAlignment.center,
                                    //     children: [
                                    //       SizedBox(
                                    //           width: MediaQuery.sizeOf(context)
                                    //                   .width -
                                    //               1100,
                                    //           child: TextFormField(
                                    //             decoration:
                                    //                 const InputDecoration(
                                    //                     border:
                                    //                         OutlineInputBorder(
                                    //                             borderSide:
                                    //                                 BorderSide
                                    //                                     .none),
                                    //                     filled: true,
                                    //                     fillColor:
                                    //                         Color.fromARGB(255,
                                    //                             234, 231, 231),
                                    //                     labelText: 'Phone no',
                                    //                     prefixIcon: Icon(
                                    //                       Icons.phone,
                                    //                       color: Colors.grey,
                                    //                     )),
                                    //           ))
                                    //     ],
                                    //   ),
                                    // ),

                                    // Padding(
                                    //   padding: const EdgeInsets.symmetric(
                                    //       vertical: 10),
                                    //   child: Row(
                                    //     mainAxisAlignment:
                                    //         MainAxisAlignment.center,
                                    //     children: [
                                    //       Obx(
                                    //         () => SizedBox(
                                    //             width:
                                    //                 MediaQuery.sizeOf(context)
                                    //                         .width -
                                    //                     1100,
                                    //             child: DropdownButtonFormField<
                                    //                 String>(
                                    //               decoration:
                                    //                   const InputDecoration(
                                    //                       filled: true,
                                    //                       fillColor:
                                    //                           Color.fromARGB(
                                    //                               255,
                                    //                               234,
                                    //                               231,
                                    //                               231),
                                    //                       prefixIcon: Icon(
                                    //                         Icons.type_specimen,
                                    //                         color: Colors.grey,
                                    //                       ),
                                    //                       border:
                                    //                           OutlineInputBorder(
                                    //                               borderSide:
                                    //                                   BorderSide
                                    //                                       .none)),
                                    //               value:
                                    //                   getx.selectedbutton.value,
                                    //               items: <String>[
                                    //                 'Admin',
                                    //                 'Employee'
                                    //               ].map<
                                    //                   DropdownMenuItem<
                                    //                       String>>((String e) {
                                    //                 return DropdownMenuItem(
                                    //                     value: e,
                                    //                     child: Text(e));
                                    //               }).toList(),
                                    //               onChanged: (v) {
                                    //                 getx.selectedbutton.value =
                                    //                     v!;
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
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                              width: MediaQuery.sizeOf(context)
                                                      .width -
                                                  1100,
                                              child: TextFormField(
                                                controller: password,
                                                decoration: InputDecoration(
                                                    filled: true,
                                                    fillColor: Color.fromARGB(
                                                        255, 234, 231, 231),
                                                    border: OutlineInputBorder(
                                                        borderSide:
                                                            BorderSide.none),
                                                    suffixIcon: IconButton(
                                                        onPressed: () {},
                                                        icon: const Icon(
                                                            Icons.visibility)),
                                                    labelText: 'Password',
                                                    prefixIcon: const Icon(
                                                      Icons.password,
                                                      color: Colors.grey,
                                                    )),
                                              ))
                                        ],
                                      ),
                                    ),
                                    // Padding(
                                    //   padding: const EdgeInsets.symmetric(
                                    //       vertical: 10),
                                    //   child: Row(
                                    //     mainAxisAlignment:
                                    //         MainAxisAlignment.center,
                                    //     children: [
                                    //       SizedBox(
                                    //           width: MediaQuery.sizeOf(context)
                                    //                   .width -
                                    //               1100,
                                    //           child: TextFormField(
                                    //             decoration: InputDecoration(
                                    //                 filled: true,
                                    //                 fillColor: Color.fromARGB(
                                    //                     255, 234, 231, 231),
                                    //                 border: OutlineInputBorder(
                                    //                     borderSide:
                                    //                         BorderSide.none),
                                    //                 suffixIcon: IconButton(
                                    //                     onPressed: () {},
                                    //                     icon: const Icon(
                                    //                         Icons.visibility)),
                                    //                 labelText:
                                    //                     'Confirm Password',
                                    //                 prefixIcon: const Icon(
                                    //                   Icons.password,
                                    //                   color: Colors.grey,
                                    //                 )),
                                    //           ))
                                    //     ],
                                    //   ),
                                    // ),

                                    //
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 20),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                                gradient: LinearGradient(
                                                    colors: [
                                                  Colors.blue,
                                                  Colors.white
                                                ])),
                                            width: MediaQuery.sizeOf(context)
                                                    .width -
                                                1100,
                                            child: ElevatedButton(
                                                style: ButtonStyle(
                                                    padding:
                                                        MaterialStatePropertyAll(
                                                            EdgeInsets.all(20)),
                                                    backgroundColor:
                                                        MaterialStatePropertyAll(
                                                            Colors.transparent),
                                                    shape: MaterialStatePropertyAll(
                                                        ContinuousRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10)))),
                                                onPressed: () {
                                                  if (logingk.currentState!
                                                      .validate()) {
                                                    useradminlogin(
                                                        context,
                                                        email.text,
                                                        password.text);
                                                  }
                                                  // if (gk.currentState!
                                                  //     .validate()) {
                                                  // Get.to(() =>
                                                  //     const AdminDashboard());
                                                },
                                                child: Text(
                                                  'Login'.toUpperCase(),
                                                  style: const TextStyle(
                                                      color: Colors.white),
                                                )),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
