import 'dart:convert';

import 'package:capstone_management/common/http_client.dart';
import 'package:capstone_management/modal/topic.dart';

class TopicRepository {
  Future<List<Topic>> getAllTopic({String? query}) async {
    List<Topic> result = [];
    final httpClient = HttpClient();
    final response = await httpClient.get('/topics');
    try{
    if (response.statusCode == 200) {
      result = List<Topic>.from(jsonDecode(response.body)['data'].map((x) => Topic.fromJson(x)));
      if( query != null){
        result = result.where((element) => element.topicName!.toLowerCase().contains(query.toLowerCase())).toList();
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
