import "dart:convert";

import "package:employee_management/admin/admindashboard.dart";
import "package:employee_management/employee/empdashboard.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:http/http.dart" as http;

Future registration(BuildContext context, String fullname, String email,
    String phno, String password) async {
  try {
    showDialog(
        context: context,
        builder: (context) {
          return Center(child: CircularProgressIndicator());
        });
    Map data = {
      'firstName': fullname,
      'lastName': 'x',
      'username': email,
      'password': password,
      'roles': ['Admin']
    };
    var res = await http.post(
      Uri.parse('http://localhost:5023/api/Auth/Register'),
      body: jsonEncode(data),
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
      },
    );
    var jsondata = jsonDecode(res.body);
    print(res.body);
    Get.back();
  } catch (e) {
    print(e);
  }
}

Future useradminlogin(
    BuildContext context, String email, String password) async {
  try {
    showDialog(
        context: context,
        builder: (context) {
          return Center(child: CircularProgressIndicator());
        });
    Map data = {"username": email, "password": password};
    var res = await http.post(
      Uri.parse('http://localhost:5023/api/Auth/Login'),
      body: jsonEncode(data),
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
      },
    );
    var jsondata = jsonDecode(res.body);
    print(res.body);
    Get.back();
    Get.to(() => AdminDashboard());
  } catch (e) {
    print(e);
  }
}
