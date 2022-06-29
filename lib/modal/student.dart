import 'dart:convert';

import 'package:capstone_management/modal/user.dart';

import 'status.dart';

Student studentFromJson(String str) => Student.fromJson(json.decode(str));

String studentToJson(Student data) => json.encode(data.toJson());

class Student extends User {
  Student({
    required super.id,
    required super.email,
    required super.userName,
    required super.fullName,
    required this.code,
    required this.semester,
    required super.role,
    required super.status,
    super.avatarUrl,
  });

  String code;
  String semester;

  factory Student.fromJson(Map<String, dynamic> json) => Student(
        id: json["id"],
        email: json["email"],
        userName: json["userName"],
        fullName: json["fullName"],
        code: json["code"],
        semester: json["semester"],
        role: json["role"],
        status: Status.fromJson(json["status"]),
        avatarUrl: json["avatarUrl"],
      );

  @override
  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "userName": userName,
        "fullName": fullName,
        "code": code,
        "semester": semester,
        "role": role,
        "status": status.toJson(),
        "avatarUrl": avatarUrl,
      };
}
