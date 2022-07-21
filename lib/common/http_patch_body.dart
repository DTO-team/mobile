import 'dart:convert';

HttpPatchBody httpPatchBodyFromJson(String str) => HttpPatchBody.fromJson(json.decode(str));

String httpPatchBodyToJson(HttpPatchBody data) => json.encode(data.toJson());

class HttpPatchBody {
  HttpPatchBody({
    required this.op,
    required this.path,
    required this.value,
  });

  String op;
  String path;
  String value;

  factory HttpPatchBody.fromJson(Map<String, dynamic> json) => HttpPatchBody(
    op: json["op"],
    path: json["path"],
    value: json["value"],
  );

  Map<String, dynamic> toJson() => {
    "op": op,
    "path": path,
    "value": value,
  };
}
