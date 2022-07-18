import 'package:capstone_management/constant/color.dart';
import 'package:capstone_management/constant/text_style.dart';
import 'package:capstone_management/modal/project.dart';
import 'package:capstone_management/modal/weekly_report.dart';
import 'package:capstone_management/provider/new_feed.dart';
import 'package:flutter/material.dart';
import 'package:html/parser.dart';

class TeamReportCard extends StatelessWidget {
  const TeamReportCard({Key? key, required this.onPress, required this.report})
      : super(key: key);

  final WeeklyReport report;
  final VoidCallback onPress;
  String _parseHtmlString(String htmlString) {
    final document = parse(htmlString);
    final String parsedString = parse(document.body!.text).documentElement!.text;
    return parsedString;
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
        margin: const EdgeInsets.all(10),
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

              Container(
                  padding: const EdgeInsets.all(5),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.info,size: 16,),
                          SizedBox(width: 5,),
                          Text('Member: ',style: AppTextSytle.subTitle2TextStyle,),
                          Text( _parseHtmlString(report.reporter.fullName ?? ''), style:AppTextSytle.bodyTextStyle,),
                        ],

                      ),
                      Row(
                        children: [
                          Icon(Icons.pending_actions, size: 16,),
                          SizedBox(width: 5,),
                          Text('total feedback: ',style: AppTextSytle.subTitle2TextStyle,),
                          Text( '${report.feedback.length}' , style:  AppTextSytle.bodyTextStyle,),
                        ],

                      )
                    ],
                  )
              ),

            ],
          ),
        ),
      ),
    );
  }
}
