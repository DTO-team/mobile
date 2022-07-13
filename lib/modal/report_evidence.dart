
class ReportEvidence {
  ReportEvidence({
    required this.id,
    required this.url,
    required this.name,
    required this.reportId,
  });

  String id;
  String url;
  String name;
  String reportId;

  factory ReportEvidence.fromJson(Map<String, dynamic> json) => ReportEvidence(
    id: json["id"],
    url: json["url"],
    name: json["name"],
    reportId: json["reportId"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "url": url,
    "name": name,
    "reportId": reportId,
  };
}
