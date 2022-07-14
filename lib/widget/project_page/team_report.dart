import 'package:capstone_management/constant/color.dart';
import 'package:capstone_management/constant/text_style.dart';
import 'package:capstone_management/modal/project.dart';
import 'package:capstone_management/modal/semesters.dart';
import 'package:capstone_management/modal/week.dart';
import 'package:capstone_management/modal/weekly_report.dart';
import 'package:capstone_management/repository/report_repository.dart';
import 'package:capstone_management/repository/semester_repository.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/new_feed.dart';
import '../../provider/semester_provider.dart';

class TeamReport extends StatefulWidget {
  const TeamReport({Key? key, required this.project}) : super(key: key);
  final Project project;

  @override
  State<TeamReport> createState() => _TeamReportState();
}

class _TeamReportState extends State<TeamReport> {
  NewFeed? nf;
  List<NewFeed> nfs = [
    NewFeed(
        id: '1',
        userFirstName: 'chamber th france',
        team: 'DTOOOOOOOOOOOOOOO',
        userProfilePic: 'assets/chamb.png',
        tweet:
        'Do not worry, with me this will be easy. C\'est simple comme bonjour',
        tweetedAt: 'Oct 2',
        topic: 'Project OnGoinggggg'),
    NewFeed(
        id: '2',
        userFirstName: 'Lute',
        team: 'Lute100',
        userProfilePic: 'assets/chamb.png',
        tweet:
        'This killing is terrible business but I always say if I must do something, be the best',
        tweetedAt: 'Oct 4',
        topic: 'Project OnGoing'),
    NewFeed(
        id: '3',
        userFirstName: 'Lute',
        team: 'Lute100',
        userProfilePic: 'assets/chamb.png',
        tweet:
        'Our guests have arrived. Let\'s make a good first impression, shall we?',
        tweetedAt: 'Oct 4',
        topic: 'Project OnGoing'),
    NewFeed(
        id: '4',
        userFirstName: 'Lute',
        team: 'Lute100',
        userProfilePic: 'assets/chamb.png',
        tweet:
        'I still don\'t understand why teachers used to beat the shit out of 4th graders who forgot their notebook.',
        tweetedAt: 'Oct 4',
        topic: 'Project OnGoing'),
    NewFeed(
        id: '5',
        userFirstName: 'Lute',
        team: 'Lute100',
        userProfilePic: 'assets/chamb.png',
        tweet:
        'I still don\'t understand why teachers used to beat the shit out of 4th graders who forgot their notebook.',
        tweetedAt: 'Oct 4',
        topic: 'Project OnGoing'),
    NewFeed(
        id: '6',
        userFirstName: 'Lute',
        team: 'Lute100',
        userProfilePic: 'assets/chamb.png',
        tweet:
        'I still don\'t understand why teachers used to beat the shit out of 4th graders who forgot their notebook.',
        tweetedAt: 'Oct 4',
        topic: 'Project OnGoing'),
    NewFeed(
        id: '7',
        userFirstName: 'Lute',
        team: 'Lute100',
        userProfilePic: 'assets/chamb.png',
        tweet:
        'I still don\'t understand why teachers used to beat the shit out of 4th graders who forgot their notebook.',
        tweetedAt: 'Oct 4',
        topic: 'Project OnGoing'),
    NewFeed(
        id: '8',
        userFirstName: 'Lute',
        team: 'Lute100',
        userProfilePic: 'assets/chamb.png',
        tweet:
        'I still don\'t understand why teachers used to beat the shit out of 4th graders who forgot their notebook.',
        tweetedAt: 'Oct 4',
        topic: 'Project OnGoing'),
    NewFeed(
        id: '9',
        userFirstName: 'Lute',
        team: 'Lute100',
        userProfilePic: 'assets/chamb.png',
        tweet:
        'I still don\'t understand why teachers used to beat the shit out of 4th graders who forgot their notebook.',
        tweetedAt: 'Oct 4',
        topic: 'Project OnGoing'),
    NewFeed(
        id: '10',
        userFirstName: 'Lute',
        team: 'Lute100',
        userProfilePic: 'assets/chamb.png',
        tweet:
        'I still don\'t understand why teachers used to beat the shit out of 4th graders who forgot their notebook.',
        tweetedAt: 'Oct 4',
        topic: 'Project OnGoing'),
  ];

  SemesterRepository _fetchSemester = SemesterRepository();
  Week? week;
  Semester? curentSemester;
  var isLoaded = false;
  @override
  void initState() {
    super.initState();
    curentSemester = Provider.of<SemestersProvider>(context, listen:  false).currentSemester;
  }



  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
        Container(
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: 120,vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          border: Border.all(
              color: primary, style: BorderStyle.solid, width: 0.80),
        ),
        child: DropdownButton(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              value: nf,
              hint: Text('Week 1'),
              underline: SizedBox(),
              isExpanded: false,
              items:
              nfs.map<DropdownMenuItem<NewFeed>>((NewFeed week) {
                return DropdownMenuItem<NewFeed>(
                  child: Text('Week ${week.id}'),
                  value: week,
                );
              } ).toList(),
              onChanged: (NewFeed? value) {
                setState(() {
                  nf = value!;
                });
              },
              ),),

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
                              expanded: Text('A paragraph is a short collection of well-organized sentences which revolve around a single theme and is coherent. But in this article, we have written Top 10 long paragraphs that Teach You a Lesson.')),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Card(
                        child: Container(
                          padding: EdgeInsets.all(10),
                          child: ExpandablePanel(
                              header: Text('Task in-progress',
                                style: AppTextSytle.subTitle1_1TextStyle,),
                              collapsed: Text(''),
                              expanded: Text('A paragraph is a short collection of well-organized sentences which revolve around a single theme and is coherent. But in this article, we have written Top 10 long paragraphs that Teach You a Lesson.')),
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
                              expanded: Text('A paragraph is a short collection of well-organized sentences which revolve around a single theme and is coherent. But in this article, we have written Top 10 long paragraphs that Teach You a Lesson.')),
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
                              expanded: Text('A paragraph is a short collection of well-organized sentences which revolve around a single theme and is coherent. But in this article, we have written Top 10 long paragraphs that Teach You a Lesson.')),
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
                              expanded: Text('A paragraph is a short collection of well-organized sentences which revolve around a single theme and is coherent. But in this article, we have written Top 10 long paragraphs that Teach You a Lesson.')),
                        )),
                  ),

                ],
              ),

          Divider(color: primary, thickness: 1,),
          Container(
            margin: EdgeInsets.all(10),
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'FeedBack',
                  suffixIcon: Icon(Icons.edit),
                  suffixIconColor: primary
              ),
              onSubmitted: (String value) async {
                await showDialog<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Thanks!'),
                      content: Text(
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
          )
        ]
      ),
    );

  }


}
