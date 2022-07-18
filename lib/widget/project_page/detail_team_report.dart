import 'package:capstone_management/constant/color.dart';
import 'package:capstone_management/provider/new_feed.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

import '../../constant/text_style.dart';
import '../../modal/weekly_report.dart';
class DetailReport extends StatelessWidget {
  const DetailReport({Key? key, required this.report
   // , required this.weeklyReport
  })
      : super(key: key);

//  final WeeklyReport? weeklyReport;
 final WeeklyReport report;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragUpdate: (details) {},
      onHorizontalDragUpdate: (details) {
        if (details.delta.direction <= 0) {
          Navigator.pop(context);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Detail Report'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          padding: const EdgeInsets.all(5),
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Card(
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      child: ExpandablePanel(
                          header: const Text('completed Tasks',
                              style: AppTextSytle.subTitle1_1TextStyle),
                          collapsed: const Text(''),
                          expanded: Text(report.completedTasks
                             // ?? 'task is not added'
                          )),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Card(
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      child: ExpandablePanel(
                          header: const Text(
                            'Task in-progress',
                            style: AppTextSytle.subTitle1_1TextStyle,
                          ),
                          collapsed: const Text(''),
                          expanded: Text(report.inProgressTasks
                            //  ?? 'task is not added'
                          )),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Card(
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      child: ExpandablePanel(
                          header: const Text('Tasks to begin next week',
                              style: AppTextSytle.subTitle1_1TextStyle),
                          collapsed: const Text(''),
                          expanded: Text(report.nextWeekTasks
                              //?? 'task is not added'
                          )),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Card(
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      child: ExpandablePanel(
                          header: const Text('Urgent issues',
                              style: AppTextSytle.subTitle1_1TextStyle),
                          collapsed: const Text(''),
                          expanded: Text(report.urgentIssues
                              //?? 'task is not added'
                          )),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Card(
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      child: ExpandablePanel(
                          header: const Text('Self-assessments',
                              style: AppTextSytle.subTitle1_1TextStyle),
                          collapsed: const Text(''),
                          expanded: Text(report.selfAssessments
                             // ?? 'task is not added'
                          )),
                    )),
              ),
              const Divider(thickness: 1,color: primary,),
              Container(
                margin: const EdgeInsets.all(10),
                child: TextField(
                  decoration: const InputDecoration(
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
                          content: const Text('Your Feedback has been submitted'),
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
            ],
          ),
        ),
      ),
    );
  }
}
