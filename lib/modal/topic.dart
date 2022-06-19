// To parse this JSON data, do
//
//     final topic = topicFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<Topic> topicFromJson(String str) => List<Topic>.from(json.decode(str).map((x) => Topic.fromJson(x)));

String topicToJson(List<Topic> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Topic {
  Topic({
    required this.name,
    required this.description,
    required this.lecturerEmail,
    required this.companyEmail,
  });

  String name;
  String description;
  String lecturerEmail;
  String companyEmail;

  factory Topic.fromJson(Map<String, dynamic> json) => Topic(
    name: json["name"],
    description: json["description"],
    lecturerEmail: json["lecturerEmail"],
    companyEmail: json["companyEmail"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "description": description,
    "lecturerEmail": lecturerEmail,
    "companyEmail": companyEmail,
  };
}
