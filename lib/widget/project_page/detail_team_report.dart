import 'package:capstone_management/constant/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:html/parser.dart';

import '../../constant/text_style.dart';
import '../../modal/weekly_report.dart';
import '../Lecture_card.dart';
import 'feedback_add.dart';

class DetailReport extends StatefulWidget {
  const DetailReport({Key? key, required this.report}) : super(key: key);

  final WeeklyReport report;

  @override
  State<DetailReport> createState() => _DetailReportState();
}

class _DetailReportState extends State<DetailReport> {
  bool _isEnable = false;
  String title = '';
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
          title: Text(
            'Detail Report Week ${widget.report.week.number}',
            style: AppTextSytle.subTitle2TextStyle,
          ),
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
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Text('Reporter'),
              ),
              lec_card(
                email: widget.report.reporter.email,
                avatar: 'assets/chamb.png',
                name: widget.report.reporter.fullName,
              ),
              const Divider(
                thickness: 1,
              ),
              Card(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Task completed',
                          style: AppTextSytle.subTitle1_1TextStyle),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        _parseHtmlString(widget.report.urgentIssues),
                        style: AppTextSytle.bodyTextStyle,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
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
                      const Text('Tasks in-progress',
                          style: AppTextSytle.subTitle1_1TextStyle),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        _parseHtmlString(widget.report.inProgressTasks),
                        style: AppTextSytle.bodyTextStyle,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
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
                      const Text('Tasks to begin next week',
                          style: AppTextSytle.subTitle1_1TextStyle),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        _parseHtmlString(widget.report.nextWeekTasks),
                        style: AppTextSytle.bodyTextStyle,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
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
                      const Text('Urgent issues',
                          style: AppTextSytle.subTitle1_1TextStyle),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        _parseHtmlString(widget.report.urgentIssues),
                        style: AppTextSytle.bodyTextStyle,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
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
                      const Text('Self-assessments',
                          style: AppTextSytle.subTitle1_1TextStyle),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        _parseHtmlString(widget.report.selfAssessments),
                        style: AppTextSytle.bodyTextStyle,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
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
                      const Text('Self-assessments',
                          style: AppTextSytle.subTitle1_1TextStyle),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        _parseHtmlString(widget.report.selfAssessments),
                        style: AppTextSytle.bodyTextStyle,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
              const Divider(
                thickness: 1,
                color: primary,
              ),
              IconButton(onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AddFeedBack(
                          report: widget.report,
                        )));

              }
                  ,icon: Icon(Icons.add)),
             ListView.builder(
               physics: NeverScrollableScrollPhysics(),
               shrinkWrap: true,
               itemCount:  widget.report.feedback.length,
               itemBuilder: (context, index) {

               return Row(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [



                   Expanded(
                     child: Container(
                       margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                       padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),

                       decoration: BoxDecoration(
                         border: Border.all(color: Colors.grey),
                         borderRadius: BorderRadius.all(Radius.circular(10))

                       ),
                       child:  Row(
                           children: [
                          Column(children: [
                            Text('${widget.report.feedback[index].author.fullName}'),
                            Text('${widget.report.feedback[index].content}'),

                          ],),
                       ]),

                     ),
                   )
                 ],
          );}
        ),
      ]),
    )));
  }


}
