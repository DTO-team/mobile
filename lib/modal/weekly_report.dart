// To parse this JSON data, do
//
//     final weeklyReport = weeklyReportFromJson(jsonString);

import 'dart:convert';

import 'package:capstone_management/modal/report_evidence.dart';
import 'package:capstone_management/modal/student.dart';
import 'package:capstone_management/modal/week.dart';

import 'feedback.dart';

WeeklyReport weeklyReportFromJson(String str) =>
    WeeklyReport.fromJson(json.decode(str));

String weeklyReportToJson(WeeklyReport data) => json.encode(data.toJson());

class WeeklyReport {
  WeeklyReport({
    required this.id,
    required this.projectId,
    required this.isTeamReport,
    required this.reporter,
    required this.completedTasks,
    required this.inProgressTasks,
    required this.nextWeekTasks,
    required this.urgentIssues,
    required this.selfAssessments,
    required this.feedback,
    required this.week,
    required this.reportEvidences,
  });

  String id;
  String projectId;
  bool isTeamReport;
  Student reporter;
  String completedTasks;
  String inProgressTasks;
  String nextWeekTasks;
  String urgentIssues;
  String selfAssessments;
  List<Feedback> feedback;
  Week week;
  List<ReportEvidence> reportEvidences;

  factory WeeklyReport.fromJson(Map<String, dynamic> json) => WeeklyReport(
        id: json["id"],
        projectId: json["projectId"],
        isTeamReport: json["isTeamReport"],
        reporter: Student.fromJson(json["reporter"]),
        completedTasks: json["completedTasks"],
        inProgressTasks: json["inProgressTasks"],
        nextWeekTasks: json["nextWeekTasks"],
        urgentIssues: json["urgentIssues"],
        selfAssessments: json["selfAssessments"],
        feedback: List<Feedback>.from(
            json["feedback"].map((x) => Feedback.fromJson(x))),
        week: Week.fromJson(json["week"]),
        reportEvidences: List<ReportEvidence>.from(
            json["reportEvidences"].map((x) => ReportEvidence.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "projectId": projectId,
        "isTeamReport": isTeamReport,
        "reporter": reporter.toJson(),
        "completedTasks": completedTasks,
        "inProgressTasks": inProgressTasks,
        "nextWeekTasks": nextWeekTasks,
        "urgentIssues": urgentIssues,
        "selfAssessments": selfAssessments,
        "feedback": List<dynamic>.from(feedback.map((x) => x.toJson())),
        "week": week.toJson(),
        "reportEvidences":
            List<dynamic>.from(reportEvidences.map((x) => x.toJson())),
      };
}
