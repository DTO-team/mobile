import 'dart:convert';

import 'package:capstone_management/common/http_client.dart';
import 'package:capstone_management/modal/topic.dart';

class TopicRepository {

  Future<List<Topic>?> getAllTopic() async {
    final httpClient = HttpClient();
    final response = await httpClient.get('/topics');
    if (response.statusCode == 200) {
      print(response.body);
     return List<Topic>.from(jsonDecode(response.body)['data'].map((x) => Topic.fromJson(x)));

    } else {
      throw Exception('Failed to load topics--- ${response.statusCode}');
    }
  }

}
