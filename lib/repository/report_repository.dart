import 'dart:convert';

import 'package:capstone_management/common/http_client.dart';
import 'package:capstone_management/modal/semesters.dart';
import 'package:capstone_management/modal/weekly_report.dart';
import 'package:flutter/material.dart';

class ReportRepository {

  Future<List<WeeklyReport>> getTeamWeeklyReport(
      String teamId, int week, Semester? currentSemester) async {
    final httpClient = HttpClient();
    final response = await httpClient.get('/teams/$teamId/reports',
        queryParams: {'week': week.toString()},
        currentSemester: currentSemester);

    List<WeeklyReport> result = [];
    if (response.statusCode == 200) {
      List<dynamic> bodyJson = jsonDecode(response.body);

      if (bodyJson.isNotEmpty) {
        result = List<WeeklyReport>.from(
            bodyJson.where((x) => x != null).map((x) => WeeklyReport.fromJson(x)));
      }
    }
    return result;
  }

}
