import 'package:capstone_management/constant/color.dart';
import 'package:capstone_management/modal/project.dart';
import 'package:capstone_management/modal/week.dart';
import 'package:capstone_management/modal/weekly_report.dart';
import 'package:capstone_management/repository/report_repository.dart';
import 'package:capstone_management/widget/project_page/team_report_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../modal/semesters.dart';
import '../../provider/new_feed.dart';
import '../../provider/semester_provider.dart';
import 'detail_team_report.dart';

class TeamReport extends StatefulWidget {
  const TeamReport({Key? key, required this.project}) : super(key: key);
  final Project project;

  @override
  State<TeamReport> createState() => _TeamReportState(project);
}

class _TeamReportState extends State<TeamReport> {
  final _reportRepository = ReportRepository();

  Project project;

  List<Week>? weeks;
  Week? selectedWeek;
  Semester? currentSemester;

  _TeamReportState(this.project);

  @override
  void initState() {
    super.initState();
    setState(() {
      currentSemester = Provider.of<SemestersProvider>(context, listen: false)
          .currentSemester;
      selectedWeek =
          Provider.of<SemestersProvider>(context, listen: false).currentWeek;
      weeks = Provider.of<SemestersProvider>(context, listen: false)
          .currentSemesterWeek;
    });
  }

  List<Week>? sortList(List<Week>? list) {
    final sort = list?..sort((a, b) => a.number.compareTo(b.number));
    return sort;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.symmetric(horizontal: 120, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            border: Border.all(
                color: primary, style: BorderStyle.solid, width: 0.80),
          ),
          child: DropdownButton<Week?>(
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            value: selectedWeek,
            underline: const SizedBox(),
            isExpanded: false,
            items:
                sortList(weeks)?.map<DropdownMenuItem<Week?>>((Week? week) {
              return DropdownMenuItem<Week?>(
                value: week,
                child: Text('Week ${week!.number}'),
              );
            }).toList(),
            onChanged: (Week? value) {
              setState(() {
                selectedWeek = value;
              });
            },
          ),
        ),
        FutureBuilder<List<WeeklyReport>?>(
          future: _reportRepository.getTeamWeeklyReport(
              project.teamDetailResponse.teamId,
              selectedWeek!.number,
              currentSemester),
          builder: (context, snapshot) {
            var data = snapshot.data;
            if (!snapshot.hasData){
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            print(data?.length??0);

            return ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: data?.length?? 0,
                itemBuilder: (context, index) {
                  return TeamReportCard(onPress: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  DetailReport(
                                    report: data![index],
                                  )));
                  }, report: data![index],);

                });
          },
        ),
      ],
    );
  }
}
