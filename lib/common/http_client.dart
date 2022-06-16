import 'package:http/http.dart' as http;

const String scheme = 'https';
const String host = 'api.dto.codes/api';
const String version = '/v1';

Future<http.Response> get(String endpoint,
    {Map<String, dynamic>? queryParameters}) {
  final Uri url = _buildRequestUrl(endpoint, queryParameters: queryParameters);
  return http.get(url);
}

Future<http.Response> post(String endpoint, Object? body,
    {Map<String, dynamic>? queryParameters}) {
  final Uri url = _buildRequestUrl(endpoint, queryParameters: queryParameters);
  return http.post(url, body: body);
}

Future<http.Response> put(String endpoint, Object? body,
    {Map<String, dynamic>? queryParameters}) {
  final Uri url = _buildRequestUrl(endpoint, queryParameters: queryParameters);
  return http.put(url, body: body);
}

Future<http.Response> patch(String endpoint, Object? body,
    {Map<String, dynamic>? queryParameters}) {
  final Uri url = _buildRequestUrl(endpoint, queryParameters: queryParameters);
  return http.patch(url, body: body);
}

Future<http.Response> delete(String endpoint,
    {Object? body, Map<String, dynamic>? queryParameters}) {
  final Uri url = _buildRequestUrl(endpoint, queryParameters: queryParameters);
  return http.delete(url, body: body);
}

Uri _buildRequestUrl(String endpoint, {Map<String, dynamic>? queryParameters}) {
  final Uri url;
  if (queryParameters == null) {
    url = Uri(scheme: scheme, host: host + version, path: endpoint);
  } else {
    url = Uri(
        scheme: scheme,
        host: host + version,
        path: endpoint,
        queryParameters: queryParameters);
  }

  return url;
}
