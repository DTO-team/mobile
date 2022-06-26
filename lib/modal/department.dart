// To parse this JSON data, do
//
//     final department = departmentFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Department departmentFromJson(String str) => Department.fromJson(json.decode(str));

String departmentToJson(Department data) => json.encode(data.toJson());

class Department {
  Department({
    required this.id,
    required this.name,
    required this.code,
  });

  String id;
  String name;
  String code;

  factory Department.fromJson(Map<String, dynamic> json) => Department(
    id: json["id"],
    name: json["name"],
    code: json["code"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "code": code,
  };
}
