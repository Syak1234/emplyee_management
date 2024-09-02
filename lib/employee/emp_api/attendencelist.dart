import 'dart:convert';
import 'dart:developer';

import 'package:employee_management/employee/emp_model/attendancemodel.dart';
import 'package:employee_management/url/url.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../getx/getx.dart';
import "package:http/http.dart" as http;

Future<void> fetchAttendance(context,
    {required String startDate, required String endDate}) async {
  print(endDate.runtimeType);
  Getx getx = Get.put(Getx());
  String userid = await getx.getuseralldetails('userid');
  String token = await getx.getuseralldetails('token');
  // final String fromDate = "1-9-24";
  // final String toDate = "6-9-24";
  // print(toDate);
  final String url =
      '${UrlLink.main}${UrlLink.attendance}$userid?fromDate=${startDate}&toDate=${endDate}';
  var _response;
  log(url);
  // Set up the headers
  final headers = {
    'accept': '*/*',
    'Authorization': 'Bearer $token',
  };

  showDialog(
    context: context,
    builder: (context) {
      return Center(child: CircularProgressIndicator());
    },
  );

  try {
    // Send the GET request
    final response = await http.get(Uri.parse(url), headers: headers);

    if (response.statusCode == 200) {
      // Handle the successful response
      Get.back();
      _response = jsonDecode(response.body);
      getx.attendancelist = (_response['data'] as List)
          .map((item) => AttendanceModel.fromJson(item))
          .toList();
      log(_response.toString());
    } else {
      // Handle the error response
      Get.back();
      log('Failed to fetch data: ${response.statusCode}');
    }
  } catch (e) {
    Get.back();
    // Handle any exceptions
    log('Error: $e');
  }
}
