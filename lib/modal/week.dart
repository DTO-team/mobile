
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
}
