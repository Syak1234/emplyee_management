class Project {
  final int id;
  final String projectName;
  final String clientName;
  final String websiteUrl;
  final DateTime startDate;
  final double monthlyPrice;
  final int companyId;
  final List<AssignedEmployee> assignedEmployees;

  Project({
    required this.id,
    required this.projectName,
    required this.clientName,
    required this.websiteUrl,
    required this.startDate,
    required this.monthlyPrice,
    required this.companyId,
    required this.assignedEmployees,
  });

  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      id: json['id'],
      projectName: json['projectName'],
      clientName: json['clientName'],
      websiteUrl: json['websiteUrl'],
      startDate: DateTime.parse(json['startDate']),
      monthlyPrice: json['monthlyPrice'],
      companyId: json['companyId'],
      assignedEmployees: (json['assignedEmployees'] as List)
          .map((employee) => AssignedEmployee.fromJson(employee))
          .toList(),
    );
  }
}

class AssignedEmployee {
  final String id;
  final String userName;
  final String email;
  final String name;
  final String? phoneNumber;
  final String address;
  final DateTime createdOn;
  final int companyId;
  final List<String>? roles;

  AssignedEmployee({
    required this.id,
    required this.userName,
    required this.email,
    required this.name,
    this.phoneNumber,
    required this.address,
    required this.createdOn,
    required this.companyId,
    this.roles,
  });

  factory AssignedEmployee.fromJson(Map<String, dynamic> json) {
    return AssignedEmployee(
      id: json['id'],
      userName: json['userName'],
      email: json['email'],
      name: json['name'],
      phoneNumber: json['phoneNumber'],
      address: json['address'],
      createdOn: DateTime.parse(json['createdOn']),
      companyId: json['companyId'],
      roles: json['roles'] != null ? List<String>.from(json['roles']) : null,
    );
  }
}
