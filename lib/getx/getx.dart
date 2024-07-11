import 'package:employee_management/employee/emp_model/breaktimemodel.dart';
import 'package:get/get.dart';

class Getx extends GetxController {
  RxString selectedbutton = "Admin".obs;

  RxInt slidebox = 0.obs;
  RxBool endtime = false.obs;
  List<BreakTimeModel> timebreaklist = <BreakTimeModel>[].obs;
  RxString breaktimer = "".obs;
  RxBool showloginpage = false.obs;
}
