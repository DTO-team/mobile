import 'package:capstone_management/constant/color.dart';
import 'package:capstone_management/constant/text_style.dart';
import 'package:capstone_management/modal/project.dart';
import 'package:flutter/material.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({Key? key, required this.project, required this.onPress})
      : super(key: key);

  final Project project;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ], color: whiteSoft, borderRadius: BorderRadius.circular(5)),
        child: Container(
          margin: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Recipe title
               Center(
                 child: Text(
                  project.topicsResponse.topicName ?? '',
                  style: AppTextSytle.tittleTextStyle,
              ),
               ),
              const Padding(padding: EdgeInsets.only(top: 10)),

              const Divider(
                thickness: 1,
                color: primary,
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.all(5),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text('Team: ',style: AppTextSytle.subTitle2TextStyle,),
                        Text(project.teamDetailResponse.teamName, style:  AppTextSytle.bodyTextStyle,),
                      ],

                    ),
                    Row(
                      children: [
                        Text('Leader: ',style: AppTextSytle.subTitle2TextStyle,),
                        Text(project.teamDetailResponse.leader.fullName ?? '', style:  AppTextSytle.bodyTextStyle,),
                      ],

                    ),
                    Container(
                        child: RichText(
                          text: TextSpan(
                              text: 'Mentor: ',
                              style: AppTextSytle.subTitle2TextStyle,
                              children: [
                                TextSpan(
                                    text: project.teamDetailResponse.mentors
                                        .map((e) => e.fullName)
                                        .toList()
                                        .join(', '),
                                    style: AppTextSytle.bodyTextStyle)
                              ]),
                        )),
                  ],
                )
              ),
              const Divider(
                thickness: 1,
                color: primary,
                height: 10,
              ),
              Container(
                  padding: const EdgeInsets.all(5),

                  child: RichText(
                    text: TextSpan(
                        text: 'Description: ',
                        style: AppTextSytle.subTitle2TextStyle,
                        children: [
                          TextSpan(
                              text: project.topicsResponse.description,
                              style: AppTextSytle.bodyTextStyle)
                        ]),
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}
