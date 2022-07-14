import 'dart:convert';

import 'package:capstone_management/modal/semesters.dart';
import 'package:http/http.dart' as http;

class HttpClient {
  static const _host = 'api.dto.codes';
  static const _version = '/v1';

  final Map<String, String> _defaultHeaders = {
    'Content-Type': 'application/json; charset=UTF-8',
    'Accept': 'application/json; charset=UTF-8',
  };

  static final HttpClient _singletonHttpClient =
      HttpClient._privateConstructor();

  HttpClient._privateConstructor();

  factory HttpClient() => _singletonHttpClient;

  set token(String? token) {
    _defaultHeaders['Authorization'] = 'Bearer $token';
  }

  Future<http.Response> get(String endpoint,
      {Map<String, String>? queryParams, Semester? currentSemester}) {
    Uri url = Uri.https(_host, '/api$_version$endpoint', queryParams);
    final currentSemesterHeader =
        (currentSemester != null) ? {"currentsemester": currentSemester} : {};
    return http.get(url, headers: {
      ..._defaultHeaders,
      ...currentSemesterHeader
    });
  }

  Future<http.Response> post(String endpoint,
      {Map<String, String>? queryParams, Object? body}) {
    Uri url = Uri.https(_host, '/api$_version$endpoint', queryParams);
    return http.post(url, headers: _defaultHeaders, body: jsonEncode(body));
  }

  Future<http.Response> put(String endpoint,
      {Map<String, String>? queryParams, Object? body}) {
    Uri url = Uri.https(_host, '/api$_version$endpoint', queryParams);
    return http.put(url, headers: _defaultHeaders, body: body);
  }

  Future<http.Response> patch(String endpoint,
      {Map<String, String>? queryParams, Object? body}) {
    Uri url = Uri.https(_host, '/api$_version$endpoint', queryParams);
    return http.patch(url, headers: _defaultHeaders, body: body);
  }

  Future<http.Response> delete(String endpoint,
      {Map<String, String>? queryParams, Object? body}) {
    Uri url = Uri.https(_host, '/api$_version$endpoint', queryParams);
    return http.delete(url, headers: _defaultHeaders, body: body);
  }
}
