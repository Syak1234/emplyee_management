class AttendanceModel {
  DateTime date;
  String logintime;
  String logouttime;
  String breaktime;
  String worktime;
  String status;

  AttendanceModel({
    required this.date,
    required this.logintime,
    required this.logouttime,
    required this.breaktime,
    required this.worktime,
    required this.status,
  });

  factory AttendanceModel.fromJson(Map<String, dynamic> json) {
    return AttendanceModel(
      date: json['date'] != null ? DateTime.parse(json['date']) : DateTime.now(), // Default to current date if null
      logintime: json['logintime'] ?? '',  // Default to empty string if null
      logouttime: json['logouttime'] ?? '', // Default to empty string if null
      breaktime: json['breaktime'] ?? '',  // Default to empty string if null
      worktime: json['worktime'] ?? '',    // Default to empty string if null
      status: json['status'] ?? '',        // Default to empty string if null
    );
  }
}
