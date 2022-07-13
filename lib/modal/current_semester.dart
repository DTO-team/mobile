// To parse this JSON data, do
//
//     final currentSemester = currentSemesterFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

CurrentSemester currentSemesterFromJson(String str) => CurrentSemester.fromJson(json.decode(str));

String currentSemesterToJson(CurrentSemester data) => json.encode(data.toJson());

class CurrentSemester {
  CurrentSemester({
    required this.id,
    required this.year,
    required this.season,
    required this.status,
  });

  String id;
  int year;
  String season;
  int status;

  factory CurrentSemester.fromJson(Map<String, dynamic> json) => CurrentSemester(
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
