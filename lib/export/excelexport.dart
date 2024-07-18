import 'dart:io';

import 'package:employee_management/color/color.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:excel/excel.dart' as excelsheet;

Future<void> createExcel() async {
  excelsheet.Excel excel =
      excelsheet.Excel.createExcel(); // Create an Excel object

  // Add a sheet
  var sheet = excel['Sheet1'];
  var boldStyle = excelsheet.CellStyle(
    bold: true,
  );

  // Add header row
  sheet.appendRow([
    const excelsheet.TextCellValue('Name'),
    excelsheet.TextCellValue('Age'),
    excelsheet.TextCellValue('Email')
  ]);
  sheet.setDefaultColumnWidth();
  // Add data rows
  sheet.appendRow([
    excelsheet.TextCellValue('John Doe'),
    excelsheet.TextCellValue('50'),
    excelsheet.TextCellValue('john.doe@example.com')
  ]);
  sheet.appendRow([
    excelsheet.TextCellValue('Jane Smith'),
    excelsheet.TextCellValue('30'),
    excelsheet.TextCellValue('jane.smith@example.com')
  ]);

  // Prompt the user to select a directory
  String? selectedDirectory = await FilePicker.platform.getDirectoryPath();

  if (selectedDirectory != null) {
    // Save the Excel file
    var file = File('$selectedDirectory/example.xlsx'); // Specify the file path

    await file.writeAsBytes(excel.encode()!.toList()); // Write the Excel file
    print('Excel file created at: ${file.path}');
    Get.snackbar('Success', 'Excel file created at: ${file.path}',
        snackPosition: SnackPosition.BOTTOM, backgroundColor: ColorPage.white);
  } else {
    Get.snackbar('Error', 'No directory selected',
        snackPosition: SnackPosition.BOTTOM);
  }
}
