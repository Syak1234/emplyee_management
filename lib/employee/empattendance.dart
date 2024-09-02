import 'package:employee_management/color/color.dart';
import 'package:employee_management/employee/emp_api/attendencelist.dart';
import 'package:employee_management/employee/emp_model/attendancemodel.dart';
import 'package:employee_management/employee/widget/buttonwidget.dart';
import 'package:employee_management/getx/getx.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_date_pickers/flutter_date_pickers.dart' as dp;

class EmpAttendance extends StatefulWidget {
  const EmpAttendance({super.key});

  @override
  State<EmpAttendance> createState() => _EmpAttendanceState();
}

class _EmpAttendanceState extends State<EmpAttendance> {
  final Getx getx = Get.put(Getx());
  DateTime? selectedStartDate;
  DateTime? selectedEndDate;

  final TextEditingController _startDateController = TextEditingController();
  final TextEditingController _endDateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    DateTime now = DateTime.now();
    DateTime startDate = DateTime(now.year, now.month, 1);
    DateTime endDate =
        DateTime(now.year, now.month + 1, 0); // Last day of the current month

    // Format the dates as "5-9-24"
    String formattedStartDate =
        "${startDate.day}-${startDate.month}-${startDate.year % 100}";
    String formattedEndDate =
        "${endDate.day}-${endDate.month}-${endDate.year % 100}";

    // Pass the formatted dates to fetchAttendance
    fetchAttendance(context,
        startDate: formattedStartDate, endDate: formattedEndDate);
  }

  BoxDecoration decoration = BoxDecoration(
    gradient: const LinearGradient(colors: [ColorPage.red, ColorPage.red]),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 0, top: 15, bottom: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Attendance',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: 150,
                  child: TextFormField(
                    controller: _startDateController,
                    readOnly: true,
                    decoration: InputDecoration(
                      labelText: 'Start Date',
                      suffixIcon: IconButton(
                        icon: Icon(Icons.calendar_month),
                        onPressed: () {
                          _showDatePicker(context, isStartDate: true);
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  width: 150,
                  child: TextFormField(
                    controller: _endDateController,
                    readOnly: true,
                    decoration: InputDecoration(
                      labelText: 'End Date',
                      suffixIcon: IconButton(
                        icon: Icon(Icons.calendar_month),
                        onPressed: () {
                          _showDatePicker(context, isStartDate: false);
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                ButtonWidget(
                  'Search',
                  () {
                    fetchAttendance(context,
                        startDate: _startDateController.text,
                        endDate: _endDateController.text);
                  },
                  radius: 5,
                  color: ColorPage.smallbuttoncolor,
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 5),
              child: Container(
                color: ColorPage.red,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildHeaderCell('Date'),
                    buildHeaderCell('Login time'),
                    buildHeaderCell('Logout time'),
                    buildHeaderCell('Break time'),
                    buildHeaderCell('Work time'),
                    buildHeaderCell('Status'),
                  ],
                ),
              ),
            ),
            Expanded(
              child: getx.attendancelist.isNotEmpty
                  ? ListView.builder(
                      shrinkWrap: true,
                      itemCount: getx.attendancelist.length,
                      itemBuilder: (context, index) {
                        var x = getx.attendancelist[index];
                        return buildDataRow(x);
                      },
                    )
                  : Center(
                      child: Text(
                        'No data found',
                        textScaleFactor: 1.5,
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }

  void _showDatePicker(BuildContext context,
      {required bool isStartDate}) async {
    DateTime initialDate = isStartDate
        ? (selectedStartDate ?? DateTime.now())
        : (selectedEndDate ?? DateTime.now());

    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(
              primary: Colors.blueAccent, // Header background color
              onPrimary: Colors.white, // Header text color
              onSurface: Colors.black87, // Body text color
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                backgroundColor: Colors.blueAccent, // Button background color
                foregroundColor: Colors.white, // Button text color
              ),
            ),
            dialogBackgroundColor:
                Colors.white, // Background color of the dialog
            buttonTheme: ButtonThemeData(
              textTheme: ButtonTextTheme.primary,
            ),
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null) {
      setState(() {
        String formattedDate =
            "${pickedDate.day}-${pickedDate.month}-${pickedDate.year % 100}";

        if (isStartDate) {
          selectedStartDate = pickedDate;
          _startDateController.text = formattedDate;
        } else {
          selectedEndDate = pickedDate;
          _endDateController.text = formattedDate;
        }
      });
    }
  }

  Widget buildHeaderCell(String text) {
    return Flexible(
      child: Card(
        elevation: 10,
        child: Container(
          decoration: decoration,
          alignment: Alignment.center,
          padding: EdgeInsets.all(8),
          child: Text(
            text,
            style: TextStyle(
              color: ColorPage.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildDataRow(AttendanceModel attendance) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 0.3),
        ),
      ),
      padding: EdgeInsets.symmetric(vertical: 2, horizontal: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          buildDataCell(attendance.date.toString()),
          buildDataCell(attendance.logintime),
          buildDataCell(attendance.logouttime),
          buildDataCell(attendance.breaktime),
          buildDataCell(attendance.worktime),
          buildDataCell(attendance.status),
        ],
      ),
    );
  }

  Widget buildDataCell(String text) {
    return Flexible(
      child: Container(
        decoration: BoxDecoration(
          border: Border(right: BorderSide(width: 0.3)),
        ),
        padding: EdgeInsets.all(8),
        alignment: Alignment.center,
        child: Text(text),
      ),
    );
  }
}
