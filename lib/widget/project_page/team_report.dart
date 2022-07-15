import 'package:capstone_management/constant/color.dart';
import 'package:capstone_management/constant/text_style.dart';
import 'package:capstone_management/modal/project.dart';
import 'package:capstone_management/modal/week.dart';
import 'package:capstone_management/modal/weekly_report.dart';
import 'package:capstone_management/repository/report_repository.dart';
import 'package:capstone_management/repository/semester_repository.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../modal/semesters.dart';
import '../../provider/semester_provider.dart';

class TeamReport extends StatefulWidget {
  const TeamReport({Key? key, required this.project}) : super(key: key);
  final Project project;

  @override
  State<TeamReport> createState() => _TeamReportState();
}

class _TeamReportState extends State<TeamReport> {
  List<Week>? weeks;
  Week? selectedWeek;
  Semester? currentSemester;

  @override
  void initState() {
    super.initState();
    setState(() {
      currentSemester = Provider.of<SemestersProvider>(context, listen:  false).currentSemester;
      selectedWeek = Provider.of<SemestersProvider>(context, listen:  false).currentWeek;
      weeks = Provider.of<SemestersProvider>(context, listen:  false).currentSemesterWeek;
    });
  }
  List<Week>? sortList(List<Week>? list){
     final sort= list?..sort((a,b)=>a.number.compareTo(b.number) );
  return sort;

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(children: [
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
            items: sortList(weeks)?.map<DropdownMenuItem<Week?>>((Week? week) {
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
        FutureBuilder<WeeklyReport>(
          future: ReportRepository().getTeamWeeklyReport(widget.project.teamDetailResponse.teamId, selectedWeek!.number, currentSemester),
          builder: (context, snapshot) {
            var data = snapshot.data;
            if(!snapshot.hasData){
              return Center(child: CircularProgressIndicator(),);
            }
            if(snapshot.hasError){
              print('Error at Team Report: ${snapshot.error}');
            }
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Card(
                      child: Container(
                    padding: EdgeInsets.all(10),
                    child: ExpandablePanel(
                        header: Text('completed Tasks',
                            style: AppTextSytle.subTitle1_1TextStyle),
                        collapsed: Text(''),
                        expanded: Text('${data?.completedTasks ?? 'Completed Task is not exist'}')),
                  )),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Card(
                      child: Container(
                    padding: EdgeInsets.all(10),
                    child: ExpandablePanel(
                        header: Text(
                          'Task in-progress',
                          style: AppTextSytle.subTitle1_1TextStyle,
                        ),
                        collapsed: Text(''),
                        expanded: Text(
                            '${data?.inProgressTasks ?? 'Task is not exist'}')),
                  )),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Card(
                      child: Container(
                    padding: EdgeInsets.all(10),
                    child: ExpandablePanel(
                        header: Text('Tasks to begin next week',
                            style: AppTextSytle.subTitle1_1TextStyle),
                        collapsed: Text(''),
                        expanded: Text(
                            '${data?.nextWeekTasks ?? 'Task is not exist'}')),
                  )),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Card(
                      child: Container(
                    padding: EdgeInsets.all(10),
                    child: ExpandablePanel(
                        header: Text('Urgent issues',
                            style: AppTextSytle.subTitle1_1TextStyle),
                        collapsed: Text(''),
                        expanded: Text(
                            '${data?.urgentIssues ?? 'Task is not exist'}')),
                  )),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Card(
                      child: Container(
                    padding: EdgeInsets.all(10),
                    child: ExpandablePanel(
                        header: Text('Self-assessments',
                            style: AppTextSytle.subTitle1_1TextStyle),
                        collapsed: Text(''),
                        expanded: Text(
                            '${data?.selfAssessments ?? 'Task is not exist'}')),
                  )),
                ),
              ],
            );
          }
        ),
        Divider(
          color: primary,
          thickness: 1,
        ),
        Container(
          margin: EdgeInsets.all(10),
          child: TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'FeedBack',
                suffixIcon: Icon(Icons.edit),
                suffixIconColor: primary),
            onSubmitted: (String value) async {
              await showDialog<void>(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Thanks!'),
                    content: Text('Your Feedback has been submitted'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('OK'),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        )
      ]),
    );
  }
}
