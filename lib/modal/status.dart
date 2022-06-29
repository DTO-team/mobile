import 'dart:convert';

Status statusFromJson(String str) => Status.fromJson(json.decode(str));

String statusToJson(Status data) => json.encode(data.toJson());

class Status {
  Status({
    required this.statusId,
    required this.statusName,
  });

  int statusId;
  String statusName;

  factory Status.fromJson(Map<String, dynamic> json) => Status(
    statusId: json["statusId"],
    statusName: json["statusName"],
  );

  Map<String, dynamic> toJson() => {
    "statusId": statusId,
    "statusName": statusName,
  };
}
