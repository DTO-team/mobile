// To parse this JSON data, do
//
//     final teamDetail = teamDetailFromJson(jsonString);

import 'package:capstone_management/modal/lecturer.dart';
import 'package:capstone_management/modal/student.dart';
import 'dart:convert';

import 'department.dart';

TeamDetail teamDetailFromJson(String str) => TeamDetail.fromJson(json.decode(str));

String teamDetailToJson(TeamDetail data) => json.encode(data.toJson());

class TeamDetail {
  TeamDetail({
    required this.teamId,
    required this.teamName,
    required this.leader,
    required this.totalMember,
    required this.mentors,
    required this.members,
  });

  String teamId;
  String teamName;
  Student leader;
  int totalMember;
  List<Lecturer> mentors;
  List<Student> members;

  factory TeamDetail.fromJson(Map<String, dynamic> json) => TeamDetail(
    teamId: json["teamId"],
    teamName: json["teamName"],
    leader: Student.fromJson(json["leader"]),
    totalMember: json["totalMember"],
    mentors: List<Lecturer>.from(json["mentors"].map((x) => Lecturer.fromJson(x))),
    members: List<Student>.from(json["members"].map((x) => Student.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "teamId": teamId,
    "teamName": teamName,
    "leader": leader.toJson(),
    "totalMember": totalMember,
    "mentors": List<dynamic>.from(mentors.map((x) => x.toJson())),
    "members": List<dynamic>.from(members.map((x) => x.toJson())),
  };
}
