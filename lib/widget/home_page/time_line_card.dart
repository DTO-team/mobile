import 'package:capstone_management/constant/color.dart';
import 'package:capstone_management/constant/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:timelines/timelines.dart';

import '../../modal/semesters.dart';

class TimeLineCard extends StatelessWidget {
  final Semester? currentSemester;
  const TimeLineCard({Key? key, this.currentSemester}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(9),
          child:  Text(
            'Time Flow: ${currentSemester!.season} - ${currentSemester!.year} ',
            style: AppTextSytle.subTitle1_1TextStyle,
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 9),
          decoration: BoxDecoration(
              border: Border.all(color: kTeamColor),
              borderRadius: const BorderRadius.all(Radius.circular(4))),
          child: Column(
            children: const [
              TimeLineStatus(
                time: '10/05/2022',
                text: 'Start capstone',
                color: black,
                startcolor: black,
                endcolor: black,
              ),
              TimeLineStatus(
                time: '26/05/2022',
                text: 'In-progress capstone ',
                color: black,
                startcolor: black,
                endcolor: black,
              ),
              TimeLineStatus(
                time: '21/08/2022',
                text: 'Finish capstone',
                color: black,
                startcolor: black,
                endcolor: black,
              ),
            ],
          ),
        )
      ],
    );
  }
}

class TimeLineStatus extends StatelessWidget {
  const TimeLineStatus({
    Key? key,
    this.text,
    this.time,
    this.color,
    this.endcolor,
    this.startcolor,
  }) : super(key: key);
  final text;
  final time;
  final color;
  final endcolor;
  final startcolor;

  @override
  Widget build(BuildContext context) {
    return TimelineTile(
      oppositeContents: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Text(time),
      ),
      contents: Container(
        margin: const EdgeInsets.only(right: 20),
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Card(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: Text(text),
          ),
        ),
      ),
      node: TimelineNode(
        indicator: SvgPicture.asset(
          'assets/laptop.svg',
          height: 20,
          width: 20,
          color: color,
        ),
        startConnector: SolidLineConnector(
          color: startcolor,
        ),
        endConnector: SolidLineConnector(color: endcolor),
      ),
    );
  }
}
