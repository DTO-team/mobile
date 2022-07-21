import 'dart:convert';

import 'package:capstone_management/common/http_client.dart';
import 'package:capstone_management/common/http_patch_body.dart';

class ReportFeedbackRepository {

  Future<bool> postFeedback(String teamId, String reportId, String content) async {
    final httpClient = HttpClient();
    final body = HttpPatchBody(op: 'add', path: 'feedbacks', value: content);
    final response = await httpClient.patch('/teams/$teamId/reports/$reportId', body: jsonEncode(body));

    return response.statusCode == 200;
  }
}