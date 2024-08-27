class UserDetails {
  final String name;
  final String userId;
  final String username;
  final String email;
  final String mobile;
  final String token;

  UserDetails({
    required this.name,
    required this.userId,
    required this.username,
    required this.email,
    required this.mobile,
    required this.token,
  });

  // Factory constructor to create a User object from a JSON response
  factory UserDetails.fromJson(Map<String, dynamic> json) {
    return UserDetails(
      name: json['name'],
      userId: json['userId'],
      username: json['username'],
      email: json['email'],
      mobile: json['mobile'],
      token: json['token'],
    );
  }
}
