import 'dart:convert';
import 'dart:developer';
import 'package:employee_management/admin/admin_model/projectlistmodel.dart';
import 'package:employee_management/getx/getx.dart';
import 'package:employee_management/url/url.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

Future projectlist() async {
  try {
    Getx getx = Get.put(Getx());
    var res =
        await http.get(Uri.parse(UrlLink.main + "/api/Project"), headers: {
      'Authorization':
          'Bearer eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InNheWFrbWlzaHJhOTk5NTQ4NjQ2NjhAZ21haWwuY29tIiwiZ2l2ZW5fbmFtZSI6InNheWFrbWlzaHJhOTk5NTQ4NjQ2NjhAZ21haWwuY29tIiwic3ViIjoiN2YzN2NkMTMtMDA1NS00NjM0LWE4MGItNzIwOWVjNDM2YTU3IiwibmFtZWlkIjoiN2YzN2NkMTMtMDA1NS00NjM0LWE4MGItNzIwOWVjNDM2YTU3IiwibmJmIjoxNzI0NjkxMjE0LCJleHAiOjE3MjUyOTYwMTQsImlhdCI6MTcyNDY5MTIxNCwiaXNzIjoiaHR0cDovL2xvY2FsaG9zdDo1MDUzIiwiYXVkIjoiaHR0cDovL2xvY2FsaG9zdDo1MDUzIn0.ySn7o-FSu1Tt2oxipvitcwwP76gMYwIuExiw_mq9Jdjk5AqsAEnARmO4_DgkmxBQw0y2nHLmNiu-I2vLbfmVVw'
    });
    log(res.body);
    if (res.statusCode == 200) {
      if (res.body.isNotEmpty) {
        var jsondata = jsonDecode(res.body);
        if (jsondata['status'] == 'success') {
          getx.projectlist.clear();
          for (var project in jsondata['data']) {
            getx.projectlist.add(Project.fromJson(project));
          }
          // return projects;
        } else {
          throw Exception('Error in response: ${jsondata['message']}');
        }
      } else {
        throw Exception('Empty response body');
      }
    } else {
      throw Exception(
          'Failed to load projects, status code: ${res.statusCode}');
    }
  } catch (e) {
    print('Error: $e');
    throw Exception('Failed to load projects');
  }
}
