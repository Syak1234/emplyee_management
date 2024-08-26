class User {
  final String id;
  final String userName;
  final String email;
  final String name;
  final String phoneNumber;
  final String address;
  final DateTime createdOn;
  final int companyId;
  final List<String> roles;

  User({
    required this.id,
    required this.userName,
    required this.email,
    required this.name,
    required this.phoneNumber,
    required this.address,
    required this.createdOn,
    required this.companyId,
    required this.roles,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      userName: json['userName'],
      email: json['email'],
      name: json['name'],
      phoneNumber: json['phoneNumber'],
      address: json['address'],
      createdOn: DateTime.parse(json['createdOn']),
      companyId: json['companyId'],
      roles: List<String>.from(json['roles']??'No data'),
    );
  }
}
