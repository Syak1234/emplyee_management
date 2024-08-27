import 'dart:developer';

import 'package:employee_management/getx/getx.dart';
import 'package:employee_management/url/url.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

Future breaktime(context, index) async {
  Getx getx = Get.find<Getx>();
  String path = index == 0 ? "startBreakTime" : "endBreakTime";
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
    Uri.parse(UrlLink.main + "/api/Account/$path/$userid"),
    headers: {'Authorization': 'Bearer $token'},
  );
  print(res.body);
  Get.back();
}
