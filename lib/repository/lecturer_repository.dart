import 'dart:convert';

import 'package:capstone_management/common/http_client.dart';
import 'package:capstone_management/modal/lecturer.dart';

class LecturerRepository {
  static const resourcePath = '/lecturers';

  Future<List<Lecturer>?> getAllLecturer() async {
    final httpClient = HttpClient();
    final response = await httpClient.get(resourcePath);
    if (response.statusCode == 200) {
      return List<Lecturer>.from(
          jsonDecode(response.body).map((x) => Lecturer.fromJson(x)));
    } else {
      throw Exception('Failed to load Lecturer--- ${response.statusCode}');
    }
  }

  Future<Lecturer> updateLecturer(String id, Lecturer lecturer) async {
    final httpClient = HttpClient();
    final response = await httpClient.put('$resourcePath/$id',
        body: jsonEncode({
          "userName": lecturer.userName,
          "fullName": lecturer.fullName,
          "avatarUrl": lecturer.avatarUrl,
          "departmentId": lecturer.department.id
        }));
    if (response.statusCode == 200) {
      return Lecturer.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to update Lecturer--- ${response.statusCode}');
    }
  }
}
