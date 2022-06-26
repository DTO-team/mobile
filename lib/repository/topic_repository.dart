import 'dart:convert';

import 'package:capstone_management/common/http_client.dart';
import 'package:capstone_management/modal/topic.dart';
import 'package:logger/logger.dart';

class TopicRepository {
  static final logger = Logger();

  Future<List<Topic>?> getAllTopic() async {
    final httpClient = HttpClient();
    final response = await httpClient.get('/topics');
    if (response.statusCode == 200) {
      return List<Topic>.from(
          jsonDecode(response.body)['data'].map((x) => Topic.fromJson(x)));
    } else {
      logger.e('Failed to load topics--- ${response.statusCode}');
    }
  }
}
