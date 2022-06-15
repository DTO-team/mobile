import 'package:capstone_management/modal/lecturer.dart';
import 'package:capstone_management/modal/user.dart';
import 'package:http/http.dart' as http;

class Remote {
  Future<List<User>?> getUsers() async {
    var client = http.Client();
    var uri = Uri.parse('https://api.dto.codes/api/v1/users');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return userFromJson(json);
    }
  }

  Future<List<Lecturer>?> getLectures() async {
    final response =
        await http.get(Uri.parse('https://api.dto.codes/api/v1/lecturers'));
    if (response.statusCode == 200) {
      return lecturerFromJson(response.body);
    }
  }
}
