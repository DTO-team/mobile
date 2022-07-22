import 'package:capstone_management/constant/color.dart';
import 'package:capstone_management/constant/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:timelines/timelines.dart';

import '../../modal/project.dart';
import '../../modal/semesters.dart';
import '../../modal/student.dart';
import '../../modal/topic.dart';

class TimeLineCard extends StatelessWidget {
  final List<Topic>? topics;
  final List<Project>? project;
  final Semester? currentSemester;
  const TimeLineCard({Key? key, this.currentSemester, this.topics, this.project}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              padding: EdgeInsets.symmetric(vertical: 25,horizontal: 15),

              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                  gradient: LinearGradient(
                      begin: Alignment.centerRight,
                      end: Alignment.centerLeft,
                      colors: [ Color(0xFF11FFBD),Color(0xFFAAFFA9)])
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.paste_rounded,),
                  SizedBox(width: 5,),
                  Text('Total Project: ${project!.length}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15)),
                ],
              )),
        ),
        SizedBox(height: 5,),
        Expanded(
          child: Container(
            width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(vertical: 25,horizontal: 15),
              margin:  EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.bottomRight,
                      colors: [Color(0xFFB3FFAB), Color(0xFF12FFF7)])
              ),
              child: Center(child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.library_books_rounded),
                  SizedBox(width: 5,),
                  Center(child: Text('Total Topic: ${topics!.length}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15))),
                ],
              ))),
        )
      ],
    );
  }
}