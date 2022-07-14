import 'dart:convert';

import 'package:capstone_management/common/http_client.dart';
import 'package:capstone_management/modal/semesters.dart';
import 'package:capstone_management/modal/weekly_report.dart';

class ReportRepository {
  Future<WeeklyReport> getTeamWeeklyReport(String teamId, int week, Semester currentSemester) async {
    final httpClient = HttpClient();
    final response = await httpClient.get('/teams/$teamId/reports', queryParams: {'week': week.toString()}, currentSemester: currentSemester);
    if (response.statusCode == 200) {
      return jsonDecode(response.body).map((x) => WeeklyReport.fromJson(x));
    } else {
      throw Exception(
          'Failed to load Team Report --- status code: ${response.statusCode}');
    }
  }
}