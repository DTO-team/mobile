import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

import '../../constant/color.dart';
import '../../constant/text_style.dart';
import '../../modal/project.dart';
import '../Lecture_card.dart';
import '../topic_page/leader_card.dart';
class ProjectInfo extends StatelessWidget {
  const ProjectInfo({
    Key? key,
    required this.project,
  }) : super(key: key);

  final Project project;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          color: whiteSoft,
        ),
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            Text(
              'Project Name',
              style: AppTextSytle.subTitle2TextStyle,
            ),
            SizedBox(
              height: 5,
            ),
            Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: whiteSoft,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 2,
                      offset: Offset(0, 1), // changes position of shadow
                    ),
                  ],
                ),
                child: Text(
                  project.topicsResponse.topicName?? '',
                  style: AppTextSytle.subTitle1TextStyle,
                  textAlign: TextAlign.left,
                )),
            SizedBox(
              height: 10,
            ),
            Text(
              'Mentor',
              style: AppTextSytle.subTitle2TextStyle,
            ),
            SizedBox(
              height: 5,
            ),
            Card(
                child: ExpandablePanel(
                  header:lec_card(
                    name: project.teamDetailResponse.mentors
                        .map((e) => e.fullName)
                        .toList().first,
                    avatar: project.teamDetailResponse.mentors.map((e) => e.avatarUrl).toList().first != null ? NetworkImage('${project.teamDetailResponse.mentors.map((e) => e.avatarUrl).toList().first}') :AssetImage('assets/google-logo.png'),
                    email: project.teamDetailResponse.mentors
                        .map((e) => e.email)
                        .toList().first,

                  ),

                  collapsed: Text(''),

                  expanded:ListView.builder(
                    shrinkWrap: true,
                    reverse: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount:project.teamDetailResponse.mentors.length>0 ? project.teamDetailResponse.mentors.length-1 : project.teamDetailResponse.mentors.length ,
                    itemBuilder: (BuildContext context, int index) {
                      return lec_card(
                        name: project.teamDetailResponse.mentors
                            .map((e) => e.fullName)
                            .toList()[index],
                        avatar:project.teamDetailResponse.mentors.map((e) => e.avatarUrl).toList().first != null ? NetworkImage('${project.teamDetailResponse.mentors.map((e) => e.avatarUrl).toList().first}') :AssetImage('assets/google-logo.png'),
                        email: project.teamDetailResponse.mentors
                            .map((e) => e.email)
                            .toList()[index],

                      );
                    },
                  ),

                )
            ),

            SizedBox(
              height: 10,
            ),
            Text(
              'Team',
              style: AppTextSytle.subTitle2TextStyle,
            ),
            Card(
                child: ExpandablePanel(
                  header:leader_card(
                    name: project.teamDetailResponse.leader.fullName,
                    avatar: project.teamDetailResponse.leader.avatarUrl != null ? NetworkImage(
                        '${project.teamDetailResponse.leader.avatarUrl}') : AssetImage('assets/google-logo.png'),
                    email: project.teamDetailResponse.leader.email ,
                    icon: 'assets/flag.svg',
                  ),

                  collapsed: Text(''),

                  expanded:ListView.builder(
                    shrinkWrap: true,
                    reverse: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount:project.teamDetailResponse.members.length>0 ? project.teamDetailResponse.members.length-1 : project.teamDetailResponse.members.length ,
                    itemBuilder: (BuildContext context, int index) {
                      return lec_card(
                        name: project.teamDetailResponse.members
                            .map((e) => e.fullName)
                            .toList()[index],
                        avatar: project.teamDetailResponse.members.map((e) => e.avatarUrl).toList()[index] != null ? NetworkImage('${project.teamDetailResponse.members.map((e) => e.avatarUrl).toList()[index]}'): AssetImage('assets/google-logo.png'),
                        email: project.teamDetailResponse.members
                            .map((e) => e.email)
                            .toList()[index],

                      );
                    },
                  ),

                )
            ),
            SizedBox(
              height: 5,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Description',
              style: AppTextSytle.subTitle2TextStyle,
            ),
            SizedBox(
              height: 5,
            ),

            Container(
                margin: EdgeInsets.only(top: 5),
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: whiteSoft,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 2,
                      offset: Offset(0, 1), // changes position of shadow
                    ),
                  ],
                ),
                child: Text(
                  project.topicsResponse.description?? '',
                  style: AppTextSytle.bodyTextStyle,
                  textAlign: TextAlign.left,
                )),

          ],
        ),
      ),
    );
  }
}
