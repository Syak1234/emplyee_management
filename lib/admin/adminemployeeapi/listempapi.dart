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

  var res = await http.get(
    Uri.parse(UrlLink.main + "/api/Account/users"),
    headers: {
      'Authorization':
          'Bearer eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InNheWFrbWlzaHJhOTk5NTQ4NjQ2NjhAZ21haWwuY29tIiwiZ2l2ZW5fbmFtZSI6InNheWFrbWlzaHJhOTk5NTQ4NjQ2NjhAZ21haWwuY29tIiwic3ViIjoiN2YzN2NkMTMtMDA1NS00NjM0LWE4MGItNzIwOWVjNDM2YTU3IiwibmFtZWlkIjoiN2YzN2NkMTMtMDA1NS00NjM0LWE4MGItNzIwOWVjNDM2YTU3IiwibmJmIjoxNzI0NjkxMjE0LCJleHAiOjE3MjUyOTYwMTQsImlhdCI6MTcyNDY5MTIxNCwiaXNzIjoiaHR0cDovL2xvY2FsaG9zdDo1MDUzIiwiYXVkIjoiaHR0cDovL2xvY2FsaG9zdDo1MDUzIn0.ySn7o-FSu1Tt2oxipvitcwwP76gMYwIuExiw_mq9Jdjk5AqsAEnARmO4_DgkmxBQw0y2nHLmNiu-I2vLbfmVVw',
    },
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
