// To parse this JSON data, do
//
//     final reportNotification = reportNotificationFromJson(jsonString);

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

ReportNotification reportNotificationFromJson(String str) => ReportNotification.fromJson(json.decode(str));

String reportNotificationToJson(ReportNotification data) => json.encode(data.toJson());

class ReportNotification {
  ReportNotification({
    required this.createdAt,
    required this.role,
    this.avatarUrl,
    required this.displayName,
    required this.id,
    required this.currentSemesterId,
    required this.email,
    required this.seen,
  });

  Timestamp createdAt;
  String role;
  String? avatarUrl;
  String displayName;
  String id;
  String currentSemesterId;
  String email;
  bool seen;

  factory ReportNotification.fromJson(Map<String, dynamic> json) => ReportNotification(
    createdAt: json["createdAt"],
    role: json["role"],
    avatarUrl: json["avatarUrl"],
    displayName: json["displayName"],
    id: json["id"],
    currentSemesterId: json["currentSemesterId"],
    email: json["email"],
    seen: json["seen"],
  );

  Map<String, dynamic> toJson() => {
    "createdAt": createdAt,
    "role": role,
    "avatarUrl": avatarUrl,
    "displayName": displayName,
    "id": id,
    "currentSemesterId": currentSemesterId,
    "email": email,
    "seen": seen,
  };
}
