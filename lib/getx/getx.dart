import 'package:employee_management/admin/admin_model/adminEmpAdd.dart';
import 'package:employee_management/employee/emp_model/attendancemodel.dart';
import 'package:employee_management/employee/emp_model/breaktimemodel.dart';
import 'package:employee_management/employee/emp_model/leavemodel.dart';
import 'package:get/get.dart';

class Getx extends GetxController {
  RxString selectedbutton = "Admin".obs;

  RxInt slidebox = 0.obs;
  RxBool endtime = false.obs;
  List<BreakTimeModel> timebreaklist = <BreakTimeModel>[].obs;
  List<AttendanceModel> attendancelist = <AttendanceModel>[].obs;
  List<LeaveModel> leavelist = <LeaveModel>[].obs;
  RxString breaktimer = "".obs;
  RxBool showloginpage = false.obs;
  RxString projecttype = "Type".obs;

  //Employee
  RxList<AdminEmpAdd> empaddList = <AdminEmpAdd>[].obs;
  RxString adminEmpselectedbutton = "SEO".obs;
  RxInt adminprojectslidebox = 0.obs;
  RxString adminprojectlistselectedkeywordbutton = "Abc".obs;
  RxString adminprojectlistselectedfilterbutton = "Date Wise".obs;
  RxString adminprojectlistselectedtypebutton = "Abc".obs;
  RxString adminprojectlistselectedstatusbutton = "Abc".obs;
  RxString adminprojectlistselectedemployeebutton = "Abc".obs;
}
