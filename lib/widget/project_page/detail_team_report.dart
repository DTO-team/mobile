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
  final GlobalKey<_DetailReportState> detailKey = GlobalKey();
  final TextEditingController feedbackController = TextEditingController();
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
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.edit),
          onPressed:()=>  Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AddFeedBack(
                    report: widget.report, notifyParent: () {
                      setState(() {

                      });
                  },
                  ))),
        ),
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
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: ListView(
              children: [
            SizedBox(height: 10,),
             Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Text('Reporter',style:  AppTextSytle.subTitle2TextStyle,),
            ),
            lec_card(
              email: widget.report.reporter.email,
              avatar: widget.report.reporter.avatarUrl != null ? NetworkImage('${widget.report.reporter.avatarUrl}') : AssetImage('assets/google-logo.png'),
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
                        style:  AppTextSytle.subTitle2TextStyle),
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
                        style:  AppTextSytle.subTitle2TextStyle),
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
                        style:  AppTextSytle.subTitle2TextStyle),
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
                        style:  AppTextSytle.subTitle2TextStyle),
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
                        style:  AppTextSytle.subTitle2TextStyle),
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

                Row(
                    children: <Widget>[
                      Expanded(
                          child: Divider(
                            color: primary,
                            thickness: 1,
                          )
                      ),



                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 3),
                          child: Text("Feedback",style: AppTextSytle.subTitle2TextStyle,)),

                      Expanded(
                          child: Divider(
                            color: primary,
                            thickness: 1,

                          )
                      ),
                    ]
                ),
            SizedBox(height: 6,),

            ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: widget.report.feedback.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    child: Column(

                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start ,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 5),
                              height: 45,
                              width: 45,
                              decoration: BoxDecoration(
                                  color: white,
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage('assets/google-logo.png'),
                                  )),
                            ),
                            Expanded(
                              child: Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ///author name
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.only(left: 5),
                                            child: (Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  '${widget.report.feedback[index].author.fullName}',
                                                  style: const TextStyle(
                                                      color: kTextColor,
                                                      fontWeight: FontWeight.w500,
                                                      fontSize: 17),
                                                ),
                                              ],
                                            )),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 5,),

                                    /// content
                                 Padding(
                                   padding: const EdgeInsets.symmetric(horizontal: 5),
                                   child: Text('${_parseHtmlString(widget.report.feedback[index].content)}'
                                   ),
                                 )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),

                      ],
                    ),
                  );
                }
                ),
          ]),
        ),
      ),
    );
  }
}
