import 'package:capstone_management/constant/color.dart';
import 'package:capstone_management/constant/text_style.dart';
import 'package:capstone_management/modal/project.dart';
import 'package:capstone_management/modal/weekly_report.dart';
import 'package:capstone_management/provider/current_semester_provider.dart';
import 'package:capstone_management/repository/report_repository.dart';
import 'package:capstone_management/screen/main/edit_profile_page.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

import '../../provider/new_feed.dart';

class TeamReport extends StatefulWidget {
  const TeamReport({Key? key, required this.project}) : super(key: key);

  final Project project;

  @override
  State<TeamReport> createState() => _TeamReportState();
}

class _TeamReportState extends State<TeamReport> {
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
  NewFeed? _selectedvalue;
  @override
  Widget build(BuildContext context) {

    return Container(
      child: ListView(
        children: [
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(horizontal: 50,vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              border: Border.all(
                  color: primary, style: BorderStyle.solid, width: 0.80),
            ),
            child: DropdownButton(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              hint:  Container(
                child: Text(
                  "Select Week",
                  style: AppTextSytle.subTitle2TextStyle,
                ),
              ),
              value: _selectedvalue,
              underline: SizedBox(),
              isExpanded: false,
              items:
              nfs.map<DropdownMenuItem<NewFeed>>((NewFeed nf) {
                return DropdownMenuItem<NewFeed>(
                  child: Text(nf.team + ' ' + nf.tweetedAt),
                  value: nf,
                );
              } ).toList(),
              onChanged: (NewFeed? value) {
                setState(() {
                  _selectedvalue = value;
                });
              },

            ),
          ),


          // FutureBuilder<WeeklyReport>(
          //     future: ReportRepository()
          //         .getTeamWeeklyReport(project.teamDetailResponse.teamId, 9, SemestersProvider().getCurrentSemester()),
          //     builder: (context, snapshot) {
          //       var data = snapshot.data;
          //       if (snapshot.connectionState == ConnectionState.done) {
          //         if (snapshot.hasError) {
          //           print(snapshot.error);
          //         }
          //       }
          //       if (!snapshot.hasData) {
          //         print(snapshot.data?.completedTasks ?? '');
          //         return Center(
          //           child: CircularProgressIndicator(),
          //         );
          //       }
          //       return
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Card(
                          child: Container(
                            padding: EdgeInsets.all(10),
                            child: ExpandablePanel(
                                header: Text('Task Completed ',style: AppTextSytle.subTitle1_1TextStyle),
                                collapsed: Text(''),
                                expanded: Text('expanded')),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Card(
                          child: Container(
                            padding: EdgeInsets.all(10),
                            child: ExpandablePanel(
                                header: Text('Task in-progress',style: AppTextSytle.subTitle1_1TextStyle,),
                                collapsed: Text(''),
                                expanded: Text('expanded')),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Card(
                          child: Container(
                            padding: EdgeInsets.all(10),
                            child: ExpandablePanel(
                                header: Text('Tasks to begin next week',style: AppTextSytle.subTitle1_1TextStyle),
                                collapsed: Text(''),
                                expanded: Text('expanded')),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Card(
                          child: Container(
                            padding: EdgeInsets.all(10),
                            child: ExpandablePanel(
                                header: Text('Urgent issues',style: AppTextSytle.subTitle1_1TextStyle),
                                collapsed: Text(''),
                                expanded: Text('expanded')),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Card(
                          child: Container(
                            padding: EdgeInsets.all(10),
                            child: ExpandablePanel(
                                header: Text('Self-assessments',style: AppTextSytle.subTitle1_1TextStyle),
                                collapsed: Text(''),
                                expanded: Text('expanded')),
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
