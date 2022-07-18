import 'package:capstone_management/constant/color.dart';
import 'package:capstone_management/widget/Lecture_card.dart';
import 'package:capstone_management/widget/topic_page/leader_card.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:html/parser.dart';

import '../../constant/text_style.dart';
import '../../modal/weekly_report.dart';

class DetailReport extends StatelessWidget {
  const DetailReport({Key? key, required this.report}) : super(key: key);

  final WeeklyReport report;

  String _parseHtmlString(String htmlString) {
    final document = parse(htmlString);
    final String parsedString =
        parse(document.body!.text).documentElement!.text;
    return parsedString;
  }

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
          title:  Text('Detail Report Week ${report.week.number}',style: AppTextSytle.subTitle2TextStyle,),
          elevation: 0.5,
          backgroundColor: whiteSoft,
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
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text('Reporter '),
              ),
              leader_card(
                email: report.reporter.email ,
                avatar: 'assets/chamb.png',
                name: report.reporter.fullName,
                icon: '',
              ),
              Divider(thickness: 1,),
              Card(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Task completed',
                          style: AppTextSytle.subTitle1_1TextStyle),
                      SizedBox(height: 10,),

                      Text(_parseHtmlString(report.urgentIssues),
                        style: AppTextSytle.bodyTextStyle,),
                      SizedBox(height: 10,),

                    ],
                  ),
                ),
              ),
              Card(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Tasks in-progress',
                          style: AppTextSytle.subTitle1_1TextStyle),
                      SizedBox(height: 10,),

                      Text(_parseHtmlString(report.inProgressTasks),
                        style: AppTextSytle.bodyTextStyle,),
                      SizedBox(height: 10,),

                    ],
                  ),
                ),
              ),
              Card(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Tasks to begin next week',
                          style: AppTextSytle.subTitle1_1TextStyle),
                      SizedBox(height: 10,),

                      Text(_parseHtmlString(report.nextWeekTasks),
                        style: AppTextSytle.bodyTextStyle,),
                      SizedBox(height: 10,),

                    ],
                  ),
                ),
              ),
              Card(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Urgent issues',
                          style: AppTextSytle.subTitle1_1TextStyle),
                    SizedBox(height: 10,),

                      Text(_parseHtmlString(report.urgentIssues),
                        style: AppTextSytle.bodyTextStyle,),
                      SizedBox(height: 10,),
                    ],
                  ),
                ),
              ),
              Card(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Self-assessments',
                          style: AppTextSytle.subTitle1_1TextStyle),
                      SizedBox(height: 10,),

                      Text(_parseHtmlString(report.selfAssessments),
                        style: AppTextSytle.bodyTextStyle,),
                      SizedBox(height: 10,),

                    ],
                  ),
                ),
              ),

              Card(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Self-assessments',
                          style: AppTextSytle.subTitle1_1TextStyle),
                      SizedBox(height: 10,),

                      Text(_parseHtmlString(report.selfAssessments),
                        style: AppTextSytle.bodyTextStyle,),
                      SizedBox(height: 10,),

                    ],
                  ),
                ),
              ),

              const Divider(
                thickness: 1,
                color: primary,
              ),
              Column(
                children: [
                  // Container(
                  //     padding: EdgeInsets.all(10),
                  //     child: ListView.builder(
                  //       itemBuilder: (BuildContext context, int index) {
                  //         return lec_card(
                  //           name: report.feedback.map((e) => e.author.fullName),
                  //           avatar: 'assets/chamb.png',
                  //           email: report.feedback.map((e) => e.author.email),
                  //         );
                  //       },
                  //     )),
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
                              content: const Text(
                                  'Your Feedback has been submitted'),
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
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
