
import 'package:capstone_management/modal/lecturer.dart';

class Feedback {
  Feedback({
    required this.id,
    required this.content,
    required this.createdDateTime,
    required this.isTeamReport,
    required this.author,
  });

  String id;
  String content;
  int createdDateTime;
  bool isTeamReport;
  Lecturer author;

  factory Feedback.fromJson(Map<String, dynamic> json) => Feedback(
    id: json["id"],
    content: json["content"],
    createdDateTime: json["createdDateTime"],
    isTeamReport: json["isTeamReport"],
    author: Lecturer.fromJson(json["author"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "content": content,
    "createdDateTime": createdDateTime,
    "isTeamReport": isTeamReport,
    "author": author.toJson(),
  };
}
