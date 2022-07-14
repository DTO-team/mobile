import 'package:capstone_management/modal/project.dart';
import 'package:capstone_management/modal/weekly_report.dart';
import 'package:capstone_management/repository/report_repository.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class TeamReport extends StatelessWidget {
  const TeamReport({Key? key, required this.project}) : super(key: key);

  final Project project;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          FutureBuilder<WeeklyReport>(
              future: ReportRepository()
                  .getTeamWeeklyReport(project.teamDetailResponse.teamId),
              builder: (context, snapshot) {
                var data = snapshot.data;
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasError) {
                    print(snapshot.error);
                  }
                }
                if (!snapshot.hasData) {
                  print(snapshot.data?.completedTasks ?? '');
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return Card(
                    child: ExpandablePanel(
                        header: Text(data?.completedTasks ?? ''),
                        collapsed: Text(''),
                        expanded: Text('expanded')));
              }),
        ],
      ),
    );
  }
}
