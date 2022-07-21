import 'dart:convert';

Week weekFromJson(String str) => Week.fromJson(json.decode(str));

String weekToJson(Week data) => json.encode(data.toJson());
class Week {
  Week({
    required this.id,
    required this.number,
    required this.semesterId,
    required this.fromDate,
    required this.toDate,
    required this.deadline,
  });

  String id;
  int number;
  String semesterId;
  int fromDate;
  int toDate;
  int deadline;

  factory Week.fromJson(Map<String, dynamic> json) => Week(
    id: json["id"],
    number: json["number"],
    semesterId: json["semesterId"],
    fromDate: json["fromDate"],
    toDate: json["toDate"],
    deadline: json["deadline"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "number": number,
    "semesterId": semesterId,
    "fromDate": fromDate,
    "toDate": toDate,
    "deadline": deadline,
  };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Week &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          number == other.number &&
          semesterId == other.semesterId;

  @override
  int get hashCode => id.hashCode ^ number.hashCode ^ semesterId.hashCode;
}
