import 'dart:convert';

import 'package:capstone_management/common/http_client.dart';
import 'package:capstone_management/modal/project.dart';

class ProjectRepository {
  Future<List<Project>?> getAllProject({String? query}) async {
    List<Project> result = [];

    final httpClient = HttpClient();
    final response = await httpClient.get('/projects');
    try{
      if (response.statusCode == 200) {
        result = List<Project>.from(jsonDecode(response.body)['data'].map((x) => Project.fromJson(x)));
        if( query != null){
          result = result.where((element) => element.topicsResponse.topicName!.toLowerCase().contains(query.toLowerCase())).toList();
        }

      } else {
        throw Exception('Failed to load topics--- ${response.statusCode}');
      }
    } on Exception catch(e){
      print('error $e');
    }
    return result;
  }
}
