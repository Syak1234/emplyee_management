import 'dart:convert';
import 'dart:developer';

import 'package:employee_management/admin/admin_model/usermodel.dart';
import 'package:employee_management/getx/getx.dart';
import 'package:employee_management/url/url.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import "package:http/http.dart" as http;

Future listEmployee(BuildContext context) async {
  Getx getx = Get.find<Getx>();
  // showDialog(
  //   context: context,
  //   builder: (context) {
  //     return Center(child: CircularProgressIndicator());
  //   },
  // );
  String token = await getx.getuseralldetails('token');
  ;
  var res = await http.get(
    Uri.parse(UrlLink.main + "/api/Account/users"),
    headers: {'Authorization': 'Bearer $token'},
  );

  // Navigator.pop(context); // Close the loading dialog
  log(res.statusCode.toString());
  if (res.statusCode == 200) {
    var jsonData = jsonDecode(res.body);
    if (jsonData['status'] == 'success') {
      getx.users.clear();
      for (var user in jsonData['data']) {
        getx.users.add(User.fromJson(user));
      }
      log(getx.users.toString());
      // Get.back();
      // return users;
    } else {
      // Get.back();
      // throw Exception('Failed to load users: ${jsonData['message']}');
    }
  } else {
    // Get.back();
    // throw Exception('Failed to fetch users');
  }
}
