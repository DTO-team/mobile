import 'package:capstone_management/constant/color.dart';
import 'package:capstone_management/modal/project.dart';
import 'package:capstone_management/modal/week.dart';
import 'package:capstone_management/widget/project_page/detail_team_report.dart';
import 'package:capstone_management/widget/project_page/team_report_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../modal/semesters.dart';
import '../../provider/new_feed.dart';
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

  ///test data
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

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
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
          ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 8,
              itemBuilder: (context, index) {
                return TeamReportCard(
                    onPress: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailReport(
                                    newFeed: nfs[index],
                                  )));
                    },
                    newfeed: nfs[index]);
              })
        ],
      ),
    );
  }
}
