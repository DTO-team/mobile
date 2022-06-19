import 'package:capstone_management/common/http_client.dart';
import 'package:capstone_management/modal/topic.dart';
import 'package:capstone_management/modal/user.dart';

class Remote {
  Future<User?> getUsers() async {
  }

  Future<List<Topic>?> getAllTopic() async {
    final httpClient = HttpClient();
    final response =await httpClient.post('/topics/list');
    if (response.statusCode == 200) {
     return topicFromJson(response.body);
    }
    else{
      throw Exception('Failed to load topics--- ${response.statusCode}' );
    }

  }
}
