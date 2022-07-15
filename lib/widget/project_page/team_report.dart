import 'package:capstone_management/constant/color.dart';
import 'package:capstone_management/constant/text_style.dart';
import 'package:capstone_management/modal/project.dart';
import 'package:capstone_management/modal/week.dart';
import 'package:capstone_management/repository/semester_repository.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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

  @override
  void initState() {
    super.initState();
    setState(() {
      selectedWeek = Provider.of<SemestersProvider>(context, listen:  false).currentWeek;
      weeks = Provider.of<SemestersProvider>(context, listen:  false).currentSemesterWeek;
      weeks?.forEach((element) => print(element.toJson()));
    });
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
          child: DropdownButton(
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            value: selectedWeek,
            underline: const SizedBox(),
            isExpanded: false,
            items: weeks?.map<DropdownMenuItem<Week>>((Week week) {
              return DropdownMenuItem<Week>(
                value: week,
                child: Text('Week ${week.number}'),
              );
            }).toList(),
            onChanged: (Object? value) {},
          ),
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Card(
                  child: Container(
                padding: EdgeInsets.all(10),
                child: ExpandablePanel(
                    header: Text('completedTasks',
                        style: AppTextSytle.subTitle1_1TextStyle),
                    collapsed: Text(''),
                    expanded: Text(
                        'A paragraph is a short collection of well-organized sentences which revolve around a single theme and is coherent. But in this article, we have written Top 10 long paragraphs that Teach You a Lesson.')),
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
                        'A paragraph is a short collection of well-organized sentences which revolve around a single theme and is coherent. But in this article, we have written Top 10 long paragraphs that Teach You a Lesson.')),
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
                        'A paragraph is a short collection of well-organized sentences which revolve around a single theme and is coherent. But in this article, we have written Top 10 long paragraphs that Teach You a Lesson.')),
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
                        'A paragraph is a short collection of well-organized sentences which revolve around a single theme and is coherent. But in this article, we have written Top 10 long paragraphs that Teach You a Lesson.')),
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
                        'A paragraph is a short collection of well-organized sentences which revolve around a single theme and is coherent. But in this article, we have written Top 10 long paragraphs that Teach You a Lesson.')),
              )),
            ),
          ],
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
