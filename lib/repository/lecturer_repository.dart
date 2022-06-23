import 'dart:convert';
import 'package:capstone_management/common/http_client.dart';
import 'package:capstone_management/modal/lecturer.dart';
class LecturerRepository {

  Future<List<Lecturer>?> getAllLecturer() async {
    final httpClient = HttpClient();
    final response = await httpClient.get('/lecturers');
    if (response.statusCode == 200) {
      return List<Lecturer>.from(jsonDecode(response.body)['data'].map((x) => Lecturer.fromJson(x)));

    } else {
      throw Exception('Failed to load Lecturer--- ${response.statusCode}');
    }
  }

}
