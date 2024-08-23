import 'dart:convert';
import 'dart:developer';

import 'package:employee_management/admin/admin_model/adminEmpAdd.dart';
import 'package:employee_management/employee/emp_model/attendancemodel.dart';
import 'package:employee_management/employee/emp_model/breaktimemodel.dart';
import 'package:employee_management/employee/emp_model/leavemodel.dart';
import 'package:employee_management/url/url.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class Getx extends GetxController {
  RxString selectedbutton = "Admin".obs;

  RxInt slidebox = 0.obs;
  RxBool endtime = false.obs;
  List<BreakTimeModel> timebreaklist = <BreakTimeModel>[].obs;
  List<AttendanceModel> attendancelist = <AttendanceModel>[].obs;
  List<LeaveModel> leavelist = <LeaveModel>[].obs;
  RxString breaktimer = "".obs;
  RxBool showloginpage = false.obs;
  RxString projecttype = "Type".obs;

  //Employee
  RxList<AdminEmpAddModel> empaddList = <AdminEmpAddModel>[].obs;
  RxString adminEmpselectedbutton = "SEO".obs;
  RxInt adminprojectslidebox = 0.obs;
  RxInt adminEmpslidebox = 0.obs;
  // RxInt adminEmpslidebox = 0.obs;
  RxString adminprojectlistselectedkeywordbutton = "Abc".obs;
  RxString adminprojectlistselectedfilterbutton = "Date Wise".obs;
  RxString adminprojectlistselectedtypebutton = "Abc".obs;
  RxString adminprojectlistselectedstatusbutton = "Abc".obs;
  RxString adminprojectlistselectedemployeebutton = "Abc".obs;
  // RxBool adminEmpAttendence = false.obs;

  Future loginApi(BuildContext context, String email, String password) async {
    try {
      showDialog(
        context: context,
        builder: (context) {
          return Center(child: CircularProgressIndicator());
        },
      );
      Map data = {"email": email, "password": password};
      var res = await http.post(Uri.https(UrlLink.main, UrlLink.login),
          body: jsonEncode(data),
          headers: {'Content-Type': 'application/json-patch+json'});
      var jsondata = jsonDecode(res.body);
      log(jsondata);
      Get.back();
      if (res.statusCode == 200) {}
    } catch (e) {
      log(e.toString());
      Get.back();
    }
  }

  Future signUpApi(BuildContext context, String name, String phno, String role,
      String email, String address, int comapnyId, String password) async {
    try {
      showDialog(
        context: context,
        builder: (context) {
          return Center(child: CircularProgressIndicator());
        },
      );
      Map data = {
        "name": name,
        "phoneNumber": phno,
        "email": email,
        "password": password,
        "role": role,
        "address": address,
        "comapnyId": comapnyId.toString()
      };
      // final headers = {
      //   'accept': '*/*',
      //   'Content-Type': 'application/json-patch+json',
      // };
      var res = await http.post(
        Uri.https(UrlLink.main, UrlLink.signup),
        // headers: headers,
        body: data,
      );
      // var jsondata = jsonDecode(res.body);
      log(res.statusCode.toString());
      Get.back();
      if (res.statusCode == 200) {}
    } catch (e) {
      log(e.toString());
      Get.back();
    }
  }
}
