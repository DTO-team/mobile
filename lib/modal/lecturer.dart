import 'dart:convert';

import 'package:capstone_management/modal/user.dart';

Lecturer lecturerFromJson(String str) => Lecturer.fromJson(json.decode(str));

String lecturerToJson(Lecturer data) => json.encode(data.toJson());

class Lecturer extends User {
  Lecturer({
    required super.id,
    required super.email,
    required super.userName,
    required super.fullName,
    required super.role,
    required super.statusId,
    super.avatarUrl,
    required this.department,
  });

  String department;

  factory Lecturer.fromJson(Map<String, dynamic> json) => Lecturer(
    id: json["id"],
    email: json["email"],
    userName: json["userName"],
    fullName: json["fullName"],
    role: json["role"],
    statusId: json["statusId"],
    avatarUrl: json["avatarUrl"],
    department: json["department"],
  );

  @override
  Map<String, dynamic> toJson() => {
    "id": id,
    "email": email,
    "userName": userName,
    "fullName": fullName,
    "role": role,
    "statusId": statusId,
    "avatarUrl": avatarUrl,
    "department": department,
  };
}
