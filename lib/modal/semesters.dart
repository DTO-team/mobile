// To parse this JSON data, do
//
//     final currentSemester = currentSemesterFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Semester currentSemesterFromJson(String str) => Semester.fromJson(json.decode(str));

String currentSemesterToJson(Semester data) => json.encode(data.toJson());

class Semester {
  Semester({
    required this.id,
    required this.year,
    required this.season,
    required this.status,
  });

  String id;
  int year;
  String season;
  int status;

  factory Semester.fromJson(Map<String, dynamic> json) => Semester(
    id: json["id"],
    year: json["year"],
    season: json["season"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "year": year,
    "season": season,
    "status": status,
  };
}
