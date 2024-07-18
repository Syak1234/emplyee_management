import 'dart:io';

import 'package:csv/csv.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';

import '../color/color.dart';

Future<void> createCSV() async {
    List<List<dynamic>> rows = [];

    // Add header row
    rows.add(['Name', 'Age', 'Email']);

    // Add data rows
    rows.add(['John Doe', '50', 'john.doe@example.com']);
    rows.add(['Jane Smith', '30', 'jane.smith@example.com']);

    String csvData =
        const ListToCsvConverter().convert(rows, fieldDelimiter: ';');

    // Prompt the user to select a directory
    String? selectedDirectory = await FilePicker.platform.getDirectoryPath();

    if (selectedDirectory != null) {
      // Save the CSV file
      var file =
          File('$selectedDirectory/example.csv'); // Specify the file path

      await file.writeAsString(csvData); // Write the CSV file
      print('CSV file created at: ${file.path}');
      Get.snackbar('Success', 'CSV file created at: ${file.path}',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: ColorPage.white);
    } else {
      Get.snackbar('Error', 'No directory selected',
          snackPosition: SnackPosition.BOTTOM);
    }
  }
