import 'package:capstone_management/modal/project.dart';
import 'package:capstone_management/widget/project_page/project_information.dart';
import 'package:capstone_management/widget/project_page/team_report.dart';
import 'package:flutter/material.dart';

import '../../constant/color.dart';
import '../../constant/text_style.dart';
import '../Lecture_card.dart';

class DetailProject extends StatelessWidget {
  const DetailProject({Key? key, required this.project}) : super(key: key);

  final Project project;
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar:AppBar(
            automaticallyImplyLeading: false,
            elevation: 0,
            backgroundColor: whiteSoft,
            centerTitle: true,

            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => Navigator.of(context).pop(),
            ),
            bottom: TabBar(
              labelColor: black,
              labelStyle: AppTextSytle.subTitle1TextStyle,
              tabs: [
                Tab(text: "Report",),
                Tab(text: "Detail",)
              ],
            ),
            title: Text(
              'Project Detail',
              style: TextStyle(
                  color: black,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w600,
                  fontSize: 22),
            ),
          ),
          body: TabBarView(children: [
            TeamReport(project: project,),
            ProjectInfo(project: project),

          ]),
        ),
      ),
    );
  }
}
