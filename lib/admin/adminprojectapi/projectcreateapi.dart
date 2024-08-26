import 'dart:convert';
import 'dart:developer';
import 'package:employee_management/employee/widget/notification.dart';
import 'package:employee_management/url/url.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<void> createProject({
  required BuildContext context,
  required String projectName,
  required String websiteUrl,
  required String clientName,
  required String startDate,
  required int monthlyPrice,
  required List<String> assignedEmployeeIds,
}) async {
  // final String url = 'https://web-nexacrm-001-dnbjchckdperbme8.eastus-01.azurewebsites.net/api/Project';
  final String token =
      'Bearer eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Indvb2hvb3dlYnRlY2hub2xvZ2llc0BnbWFpbC5jb20iLCJnaXZlbl9uYW1lIjoid29vaG9vd2VidGVjaG5vbG9naWVzQGdtYWlsLmNvbSIsInN1YiI6ImI0ZTkxZTdlLTZmN2EtNGU1Ny1hNGVjLThiNjliMjRmODY1MCIsIm5hbWVpZCI6ImI0ZTkxZTdlLTZmN2EtNGU1Ny1hNGVjLThiNjliMjRmODY1MCIsIm5iZiI6MTcyNDU3MzQyMywiZXhwIjoxNzI1MTc4MjIzLCJpYXQiOjE3MjQ1NzM0MjMsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6NTA1MyIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NTA1MyJ9.IJTofnRH4WgrQF1EcrFJ8cYQoEorU2_jkFlHjwTd2WOcs_bT_Xw0oD8eAqz_MmDJAy4_9g1oCyAHt9I_ZZheHA'; // Your token here

  final Map<String, dynamic> requestBody = {
    "projectName": projectName,
    "websiteUrl": websiteUrl,
    "clientName": clientName,
    "startDate": startDate,
    "monthlyPrice": monthlyPrice,
    "assignedEmployeeIds": assignedEmployeeIds,
  };
  log(requestBody.toString());
  try {
    final response = await http.post(
      Uri.parse(UrlLink.main + UrlLink.adminprojectcreate),
      headers: {
        'accept': '*/*',
        'Authorization': token,
        'Content-Type': 'application/json-patch+json',
      },
      body: jsonEncode(requestBody),
    );
    print(response.body);
    if (response.statusCode == 200) {
      // Handle success response

      showNotification(context, 'Project', 'Project create successfully', 0);
      print('Project created successfully: ${response.body}');
    } else {
      showNotification(context, 'Project', 'Project create failed', 1);
      // Handle error response
      print(
          'Failed to create project: ${response.statusCode} - ${response.body}');
    }
  } catch (e) {
    showNotification(context, 'Project', 'Project create failed', 1);
    // Handle exception
    print('Error: $e');
  }
}
