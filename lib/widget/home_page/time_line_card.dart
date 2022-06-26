import 'package:capstone_management/constant/color.dart';
import 'package:capstone_management/constant/text_style.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:timelines/timelines.dart';
class TimeLineCard extends StatelessWidget {
  const TimeLineCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      child: Container(

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(child: Text('Time Flow: 2022 SUMMER SEMESTER',style: AppTextSytle.subTitle1_1TextStyle, ),padding: EdgeInsets.all(9),),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 9),
            decoration: BoxDecoration(

              border: Border.all(color: kTeamColor), borderRadius: BorderRadius.all(Radius.circular(4))
            ),
            child: Column(
              children: [
                TimeLineStatus(time: '10/05/2022',text: 'Start capstone',color: black,startcolor: black,endcolor: black,),
                TimeLineStatus(time: '26/05/2022',text: 'In-progress capstone ',color: black,startcolor: black,endcolor: black,),
                TimeLineStatus(time: '21/08/2022',text: 'Finish capstone',color: black,startcolor: black,endcolor: black,),
              ],
            ),
          )


          ],
        ),
      ),
    );

   
  }
}

class TimeLineStatus extends StatelessWidget {
  const TimeLineStatus({
    Key? key, this.text, this.time, this.color, this.endcolor, this.startcolor,
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
          margin: EdgeInsets.only(right: 20),
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Card(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
              child: Text(text),
            ),
          ),
        ),
        node: TimelineNode(
          indicator: SvgPicture.asset('assets/laptop.svg',height: 20,width: 20,color: color,),
          startConnector: SolidLineConnector(color: startcolor,),
          endConnector: SolidLineConnector(color: endcolor),
        ),
      );
  }
}
