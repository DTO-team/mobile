// To parse this JSON data, do
//
//     final topic = topicFromJson(jsonString);

import 'package:capstone_management/modal/lecturer.dart';
import 'package:capstone_management/modal/user.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

Topic topicFromJson(String str) => Topic.fromJson(json.decode(str));

String topicToJson(Topic data) => json.encode(data.toJson());

class Topic {
  Topic({
    required this.topicId,
    required this.topicName,
    required this.description,
    required this.companyDetail,
    required this.lecturersDetails,
  });

  String topicId;
  String topicName;
  String description;
  User? companyDetail;
  List<Lecturer> lecturersDetails;

  factory Topic.fromJson(Map<String, dynamic> json) => Topic(
    topicId: json["topicId"],
    topicName: json["topicName"],
    description: json["description"],
    companyDetail: (json["companyDetail"] != null) ? User.fromJson(json["companyDetail"]) : null,
    lecturersDetails: List<Lecturer>.from(json["lecturersDetails"].map((x) => Lecturer.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "topicId": topicId,
    "topicName": topicName,
    "description": description,
    "companyDetail": companyDetail?.toJson(),
    "lecturersDetails": List<dynamic>.from(lecturersDetails.map((x) => x.toJson())),
  };
}