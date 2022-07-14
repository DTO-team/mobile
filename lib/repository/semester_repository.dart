import 'dart:convert';

import 'package:capstone_management/common/http_client.dart';
import 'package:capstone_management/modal/semesters.dart';
import 'package:capstone_management/modal/week.dart';

class SemesterRepository {
  static const resourcePath = '/semesters';

  Future<List<Semester>> getAllSemester() async {
    final httpClient = HttpClient();
    final response = await httpClient.get(resourcePath);
    if (response.statusCode == 200) {
      return List<Semester>.from(
          jsonDecode(response.body).map((x) => Semester.fromJson(x)));
    } else {
      throw Exception('Failed to load Semester --- ${response.statusCode}');
    }
  }

  Future<List<Week>> getAllSemesterWeek(String semesterId) async {
    final httpClient = HttpClient();
    final response = await httpClient.get('$resourcePath/$semesterId/weeks');
    if (response.statusCode == 200) {
      return List<Week>.from(
          jsonDecode(response.body).map((x) => Week.fromJson(x)));
    } else {
      throw Exception('Failed to load Week --- ${response.statusCode}');
    }
  }

  Future<Week> getCurrentWeek(String semesterId) async {
    final httpClient = HttpClient();
    final response = await httpClient.get('$resourcePath/$semesterId/weeks/current');
    if (response.statusCode == 200) {
      return jsonDecode(response.body).map((x) => Week.fromJson(x));
    } else {
      throw Exception('Failed to load week --- ${response.statusCode}');
    }
  }
}
