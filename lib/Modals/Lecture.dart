// To parse this JSON data, do
//
//     final lecturer = lecturerFromJson(jsonString);

import 'dart:convert';

List<Lecturer> lecturerFromJson(String str) => List<Lecturer>.from(json.decode(str).map((x) => Lecturer.fromJson(x)));

String lecturerToJson(List<Lecturer> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Lecturer {
  Lecturer({
    required this.id,
    required this.departmentId,
    this.department,
    this.idNavigation,
    required this.councilLecturers,
    required this.mentors,
    required this.reviews,
    required this.topicLecturers,
  });

  String id;
  String departmentId;
  dynamic department;
  dynamic idNavigation;
  List<dynamic> councilLecturers;
  List<dynamic> mentors;
  List<dynamic> reviews;
  List<dynamic> topicLecturers;

  factory Lecturer.fromJson(Map<String, dynamic> json) => Lecturer(
    id: json["id"],
    departmentId: json["departmentId"],
    department: json["department"],
    idNavigation: json["idNavigation"],
    councilLecturers: List<dynamic>.from(json["councilLecturers"].map((x) => x)),
    mentors: List<dynamic>.from(json["mentors"].map((x) => x)),
    reviews: List<dynamic>.from(json["reviews"].map((x) => x)),
    topicLecturers: List<dynamic>.from(json["topicLecturers"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "departmentId": departmentId,
    "department": department,
    "idNavigation": idNavigation,
    "councilLecturers": List<dynamic>.from(councilLecturers.map((x) => x)),
    "mentors": List<dynamic>.from(mentors.map((x) => x)),
    "reviews": List<dynamic>.from(reviews.map((x) => x)),
    "topicLecturers": List<dynamic>.from(topicLecturers.map((x) => x)),
  };
}
