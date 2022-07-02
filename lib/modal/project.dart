import 'package:capstone_management/modal/teamdetail.dart';
import 'package:capstone_management/modal/topic.dart';
import 'dart:convert';

Project projectFromJson(String str) => Project.fromJson(json.decode(str));

String projectToJson(Project data) => json.encode(data.toJson());

class Project {
  Project({
    required this.topicsResponse,
    required this.teamDetailResponse,
  });

  Topic topicsResponse;
  TeamDetail teamDetailResponse;

  factory Project.fromJson(Map<String, dynamic> json) => Project(
    topicsResponse: Topic.fromJson(json["topicsResponse"]),
    teamDetailResponse: TeamDetail.fromJson(json["teamDetailResponse"]),
  );

  Map<String, dynamic> toJson() => {
    "topicsResponse": topicsResponse.toJson(),
    "teamDetailResponse": teamDetailResponse.toJson(),
  };
}