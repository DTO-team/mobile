import 'dart:convert';

import 'package:capstone_management/modal/status.dart';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    required this.id,
    required this.email,
    required this.userName,
    required this.fullName,
    required this.role,
    required this.status,
    this.avatarUrl,
  });

  String id;
  String email;
  String userName;
  String fullName;
  String role;
  Status status;
  String? avatarUrl;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        email: json["email"],
        userName: json["userName"],
        fullName: json["fullName"],
        role: json["role"],
        status: Status.fromJson(json["status"]),
        avatarUrl: json["avatarUrl"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "userName": userName,
        "fullName": fullName,
        "role": role,
        "status": status.toJson(),
        "avatarUrl": avatarUrl,
      };
}
