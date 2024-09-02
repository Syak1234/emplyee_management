import 'dart:convert';
import 'dart:developer';

import 'package:employee_management/admin/admin_model/adminEmpAdd.dart';
import 'package:employee_management/admin/admin_model/projectlistmodel.dart';
import 'package:employee_management/admin/admin_model/usermodel.dart';
import 'package:employee_management/admin/admindashboard.dart';
import 'package:employee_management/employee/emp_model/attendancemodel.dart';
import 'package:employee_management/employee/emp_model/breaktimemodel.dart';
import 'package:employee_management/employee/emp_model/emploginmodel.dart';
import 'package:employee_management/employee/emp_model/leavemodel.dart';
import 'package:employee_management/employee/empdashboard.dart';
import 'package:employee_management/employee/widget/notification.dart';
import 'package:employee_management/url/url.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Getx extends GetxController {
  RxList<String> adminattendanceEmplist = <String>[].obs;
  RxList<User> users = <User>[].obs;
  RxList projectlist = <Project>[].obs;
  var projecttypelist = <String>[].obs;
  // RxString selectedbutton = "Developer".obs;
  RxList<String> allroles = <String>[].obs;
  RxList<String> roles = <String>[].obs;
  var role = "".obs;
  var selectedRole = ''.obs;
  var isLoading = true.obs;
  @override
  void onInit() {
    super.onInit();
    fetchRoles();
  }

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

  Future<String> getuseralldetails(String key) async {
    late SharedPreferences sp;
    sp = await SharedPreferences.getInstance();
    return sp.getString(key) ?? ' ';
  }

  Future clearSharedPreferences() async {
    late SharedPreferences sp;
    sp = await SharedPreferences.getInstance();
    sp.clear();
  }

  Future<void> saveRememberme(String username, String password) async {
    print('Saving username and password');
    SharedPreferences sp = await SharedPreferences.getInstance();
    await sp.setString('usernameid', username);
    await sp.setString('passwordid', password);
    // Optionally fetch data after saving
  }

  Future<void> removedata() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.remove('passwordid');
    sp.remove('usernameid');

    // Refresh UI with loaded data
  }

  Future<void> clearAllExcept(List<String> keysToKeep) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    // Get all keys stored in SharedPreferences
    final allKeys = prefs.getKeys();

    // Loop through all keys and remove those not in the keysToKeep list
    for (String key in allKeys) {
      if (!keysToKeep.contains(key)) {
        await prefs.remove(key);
      }
    }
  }

  Future<void> loginApi(BuildContext context, String email, String password,
      bool logincheckbox) async {
    try {
      late SharedPreferences sp;
      sp = await SharedPreferences.getInstance();
      // Show loading indicator
      showDialog(
        context: context,
        barrierDismissible:
            false, // Prevent closing the dialog by tapping outside
        builder: (context) {
          return const Center(child: CircularProgressIndicator());
        },
      );

      // Prepare the data
      Map<String, String> data = {"email": email, "password": password};

      // Prepare the headers
      Map<String, String> headers = {
        'accept': '*/*',
        // 'Authorization':
        //     'Bearer eyJbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Indvb2hvb3dlYnRlY2hub2xvZ2llc0BnbWFpbC5jb20iLCJnaXZlbl9uYW1lIjoid29vaG9vd2VidGVjaG5vbG9naWVzQGdtYWlsLmNvbSIsInN1YiI6ImI0ZTkxZTdlLTZmN2EtNGU1Ny1hNGVjLThiNjliMjRmODY1MCIsIm5hbWVpZCI6ImI0ZTkxZTdlLTZmN2EtNGU1Ny1hNGVjLThiNjliMjRmODY1MCIsIm5iZiI6MTcyNDU3MzIwOCwiZXhwIjoxNzI1MTc4MDA4LCJpYXQiOjE3MjQ1NzMyMDgsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6NTA1MyIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NTA1MyJ9.CQVIt42G43Cv4xZjWNZu68UtB2SGoQLPsfjood93TfLWF0auCqh6-V0Ww6iasimRIbZPbxLygWrUwynuD3Tje',
        'Content-Type': 'application/json-patch+json',
      };

      // Make the API request
      var res = await http.post(
        Uri.parse(UrlLink.main + UrlLink.login),
        body: jsonEncode(data),
        headers: headers,
      );

      // Process the response
      var jsondata = jsonDecode(res.body);
      log(jsondata.toString());

      // Close the loading indicator
      Get.back();

      if (res.statusCode == 200) {
        UserDetails user = UserDetails.fromJson(jsondata['data']);
        sp.setString('username', user.username);
        sp.setString('userid', user.userId);
        sp.setString('email', user.email);
        sp.setString('token', user.token);
        sp.setString('role', user.role);
        sp.setString('ph', user.mobile);
        if (logincheckbox) {
          saveRememberme(email, password);
        } else {
          removedata();
        }
        // var role = jsondata['role'];
        if (user.role == 'Admin') {
          Get.offAll(() => Dashboard());
        } else {
          Get.offAll(() => EmpDashboard(user));
        }

        // Handle successful login (e.g., navigate to a different page, save tokens)
      } else {
        // Handle errors (e.g., show an error message)
      }
    } catch (e) {
      // Log the error and close the loading indicator
      log(e.toString());
      Get.back();
    }
  }

  Future<void> signUpApi(
      BuildContext context,
      String name,
      String phno,
      String role,
      String email,
      String address,
      int companyId,
      String password) async {
    try {
      // Show a loading indicator
      showDialog(
        context: context,
        builder: (context) {
          return Center(child: CircularProgressIndicator());
        },
      );

      // Prepare the request data
      Map<String, dynamic> data = {
        "name": name,
        "phoneNumber": phno,
        "email": email,
        "password": password,
        "role": role,
        "address": address,
        "comapnyId":
            companyId.toString(), // Ensure the ID is sent as a string if needed
      };

      // Log the request data
      log(data.toString());

      // Send the POST request
      var res = await http.post(
        Uri.parse(UrlLink.main + UrlLink.signup),
        headers: {
          'accept': '*/*',
          'Content-Type': 'application/json-patch+json',
        },
        body: jsonEncode(data),
      );

      // Log the response body
      log(res.body.toString());

      // Close the loading indicator
      Get.back();

      // Check the response status code
      if (res.statusCode == 200) {
        showNotification(context, 'Registration', 'User added successfully', 0);
        // Get.to(() => AdminDashboard());
        // Handle successful response
        // You can navigate to another page or show a success message
      } else {
        showNotification(context, 'Registration', 'User added failed', 1);
        // Handle non-200 status code
        // Show an error message or handle the error as needed
      }
    } catch (e) {
      showNotification(context, 'Registration', 'User added failed', 1);
      // Log the error
      log(e.toString());

      // Close the loading indicator
      Get.back();

      // Handle the exception (e.g., show an error dialog)
    }
  }

  Future<void> fetchRoles() async {
    try {
      isLoading(true);
      final response = await http.get(
        Uri.parse(UrlLink.main + '/api/Account/roles'),
        headers: {'accept': '*/*'},
      );
      log(response.body);
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = jsonDecode(response.body);
        if (jsonResponse.containsKey('data')) {
          List<dynamic> rolesJson = jsonResponse['data'];
          List<String> fetchedRoles =
              rolesJson.map((role) => role.toString()).toList();
          if (fetchedRoles.isNotEmpty) {
            allroles.assignAll(fetchedRoles);
            roles.value = allroles
                .where((role) => role != 'Admin' && role != 'Super Admin')
                .toList();
            if (selectedRole.value.isEmpty) {
              selectedRole.value = roles.first;
            }
          } else {
            roles.assign('No roles available');
          }
        } else {
          roles.assign('No roles available');
          log('Roles key not found in the response');
        }
      } else {
        roles.assign('No roles available');
        log('Failed to load roles');
      }
    } catch (e) {
      roles.assign('Failed to load roles');
      log('Error fetching roles: $e');
    } finally {
      isLoading(false);
    }
  }

  Future<void> onDropdownTap() async {
    if (roles.isEmpty || roles.contains('No roles available')) {
      await fetchRoles();
    }
  }
}
