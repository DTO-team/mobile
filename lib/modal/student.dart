// To parse this JSON data, do
//
//     final student = studentFromJson(jsonString);

import 'package:capstone_management/modal/status.dart';
import 'package:capstone_management/modal/teamdetail.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

Student studentFromJson(String str) => Student.fromJson(json.decode(str));

String studentToJson(Student data) => json.encode(data.toJson());

class Student {
  Student({
    required this.id,
     this.teamId,
    required this.email,
     this.userName,
     this.fullName,
    required this.teamDetail,
    required this.code,
    required this.semester,
    required this.role,
    required this.status,
     this.avatarUrl,

  });

  String id;
  String? teamId;
  String email;
  String? userName;
  String? fullName;
  TeamDetail? teamDetail;
  String code;
  String semester;
  String role;
  Status status;
  String? avatarUrl;



  factory Student.fromJson(Map<String, dynamic> json) => Student(
    id: json["id"],
    teamId: json["teamId"],
    email: json["email"],
    userName: json["userName"],
    fullName: json["fullName"],
    avatarUrl: json["avatarUrl"],
    teamDetail: (json["teamDetail"] != null)
        ? TeamDetail.fromJson(json["teamDetail"])
        : null,
    code: json["code"],
    semester: json["semester"],
    role: json["role"],
    status: Status.fromJson(json["status"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "teamId": teamId,
    "email": email,
    "userName": userName,
    "fullName": fullName,
    "teamDetail": teamDetail?.toJson(),
    "code": code,
    "semester": semester,
    "role": role,
    "status": status.toJson(),
    "avatarUrl": avatarUrl,
  };
}
