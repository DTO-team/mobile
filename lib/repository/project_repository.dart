import 'dart:convert';

import 'package:capstone_management/common/http_client.dart';
import 'package:capstone_management/modal/project.dart';

class ProjectRepository {
  Future<List<Project>?> getAllProject() async {
    final httpClient = HttpClient();
    final response = await httpClient.get('/projects');
    if (response.statusCode == 200) {
      print('----- status ${response.statusCode}');
      return List<Project>.from(
          jsonDecode(response.body)['data'].map((x) => Project.fromJson(x)));
    } else {
      throw Exception('Failed to load project --- ${response.statusCode}');
    }
  }
}
