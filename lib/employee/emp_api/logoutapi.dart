import 'dart:convert';
import 'dart:developer';

import 'package:employee_management/employee/Emplogin.dart';
import 'package:employee_management/employee/widget/dialogwidget.dart';
import 'package:employee_management/employee/widget/notification.dart';
import 'package:employee_management/getx/getx.dart';
import 'package:employee_management/url/url.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

Future logoutApi(context) async {
  Getx getx = Get.find<Getx>();
  showDialog(
    context: context,
    builder: (context) {
      return Center(
        child: CircularProgressIndicator(),
      );
    },
  );
  var userid = await getx.getuseralldetails('userid');
  final token = await getx.getuseralldetails('token');
  log(token);
  var res = await post(
    Uri.parse(UrlLink.main + "/api/Account/logout/$userid"),
    headers: {'Authorization': 'Bearer $token'},
  );
  print(res.body);
  if (res.statusCode == 200) {
    await getx.clearAllExcept(['passwordid', 'usernameid']);
    showNotification(context, 'Logout', res.body.toString(), 0);

    Get.offAll(() => EmpLogin());
  } else {
    showNotification(context, 'Logout', res.body.toString(), 1);
  }
  Get.back();
}
