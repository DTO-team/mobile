import 'dart:convert';

import 'package:capstone_management/modal/lecturer.dart';
import 'package:capstone_management/modal/user.dart';

Topic topicFromJson(String str) => Topic.fromJson(json.decode(str));

String topicToJson(Topic data) => json.encode(data.toJson());

class Topic {
  Topic({
    required this.id,
    required this.topicName,
    required this.description,
    this.companyDetail,
    required this.lecturersDetails,
  });

  String id;
  String topicName;
  String description;
  User? companyDetail;
  List<Lecturer> lecturersDetails;

  factory Topic.fromJson(Map<String, dynamic> json) => Topic(
    id: json["topicId"],
    topicName: json["topicName"],
    description: json["description"],
    companyDetail: (json["companyDetail"] != null) ? User.fromJson(json["companyDetail"]) : null,
    lecturersDetails: List<Lecturer>.from(json["lecturersDetails"].map((x) => Lecturer.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "topicId": id,
    "topicName": topicName,
    "description": description,
    "companyDetail": companyDetail?.toJson(),
    "lecturersDetails": List<dynamic>.from(lecturersDetails.map((x) => x.toJson())),
  };
}