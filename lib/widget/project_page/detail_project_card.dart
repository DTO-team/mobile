import 'package:capstone_management/modal/project.dart';
import 'package:capstone_management/widget/project_page/tab_bar.dart';
import 'package:capstone_management/widget/topic_page/leader_card.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

import '../../constant/color.dart';
import '../../constant/text_style.dart';
import '../Lecture_card.dart';

class DetailProject extends StatelessWidget {
  const DetailProject({Key? key, required this.project}) : super(key: key);

  final Project project;
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onVerticalDragUpdate: (details) {},
      onHorizontalDragUpdate: (detail){
        if(detail.delta.direction <= 0){
          Navigator.pop(context);
        }
      },
      child: Scaffold(
        appBar:AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: whiteSoft,
          centerTitle: true,
          title: Text(
            'Project Detail',
            style: TextStyle(
                color: black,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w600,
                fontSize: 22),
          ),
        ),
        body: SingleChildScrollView(
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
                        avatar: 'assets/chamb.png',
                        email: project.teamDetailResponse.mentors
                            .map((e) => e.email)
                            .toList().first,
                        icon: '',

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
                            avatar: 'assets/chamb.png',
                            email: project.teamDetailResponse.mentors
                                .map((e) => e.email)
                                .toList()[index],
                            icon:  '',

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
                        avatar: 'assets/chamb.png',
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
                          avatar: 'assets/chamb.png',
                          email: project.teamDetailResponse.members
                              .map((e) => e.email)
                              .toList()[index],
                          icon:  '',

                        );
                      },
                    ),

                )
                ),

                // leader_card(
                //   name: project.teamDetailResponse.leader.fullName,
                //   avatar: 'assets/chamb.png',
                //   email: project.teamDetailResponse.leader.email ,
                //   icon: 'assets/flag.svg',
                // ),
                //
                // ListView.builder(
                //   shrinkWrap: true,
                //   reverse: true,
                //   physics: NeverScrollableScrollPhysics(),
                //   itemCount:project.teamDetailResponse.members.length>0 ? project.teamDetailResponse.members.length-1 : project.teamDetailResponse.members.length ,
                //   itemBuilder: (BuildContext context, int index) {
                //       return lec_card(
                //         name: project.teamDetailResponse.members
                //             .map((e) => e.fullName)
                //             .toList()[index],
                //         avatar: 'assets/chamb.png',
                //         email: project.teamDetailResponse.members
                //             .map((e) => e.email)
                //             .toList()[index],
                //        icon:  '',
                //
                //       );
                //   },
                // ),


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
        ),
      ),
    );
  }
}
