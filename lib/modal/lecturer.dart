// To parse this JSON data, do
//
//     final lecturer = lecturerFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

import 'department.dart';

Lecturer lecturerFromJson(String str) => Lecturer.fromJson(json.decode(str));

String lecturerToJson(Lecturer data) => json.encode(data.toJson());

class Lecturer {
  Lecturer({
    required this.id,
    required this.email,
    required this.userName,
    required this.fullName,
    required this.role,
    required this.statusId,
    required this.avatarUrl,
    required this.department,
  });

  String id;
  String email;
  String userName;
  String fullName;
  String role;
  int statusId;
  String? avatarUrl;
  Department? department;

  factory Lecturer.fromJson(Map<String, dynamic> json) => Lecturer(
    id: json["id"],
    email: json["email"],
    userName: json["userName"],
    fullName: json["fullName"],
    role: json["role"],
    statusId: json["statusId"],
    avatarUrl: json["avatarUrl"],
    department: (json["department"] != null) ? Department.fromJson(json["department"]) : null,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "email": email,
    "userName": userName,
    "fullName": fullName,
    "role": role,
    "statusId": statusId,
    "avatarUrl": avatarUrl,
    "department": department?.toJson(),
  };
}


