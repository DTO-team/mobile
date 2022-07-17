import 'package:capstone_management/constant/color.dart';
import 'package:capstone_management/provider/new_feed.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

import '../../constant/text_style.dart';
import '../../modal/weekly_report.dart';
class DetailReport extends StatelessWidget {
  const DetailReport({Key? key, required this.newFeed
   // , required this.weeklyReport
  })
      : super(key: key);

//  final WeeklyReport? weeklyReport;
 final NewFeed newFeed;


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
          title: Text('Detail Report'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          padding: EdgeInsets.all(5),
          child: ListView(
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
                          expanded: Text(newFeed.tweet
                             // ?? 'task is not added'
                          )),
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
                          expanded: Text(newFeed.tweet
                            //  ?? 'task is not added'
                          )),
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
                          expanded: Text(newFeed.tweet
                              //?? 'task is not added'
                          )),
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
                          expanded: Text(newFeed.tweet
                              //?? 'task is not added'
                          )),
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
                          expanded: Text(newFeed.tweet
                             // ?? 'task is not added'
                          )),
                    )),
              ),
              Divider(thickness: 1,color: primary,),
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
            ],
          ),
        ),
      ),
    );
  }
}
