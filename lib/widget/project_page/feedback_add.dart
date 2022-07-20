import 'package:capstone_management/modal/weekly_report.dart';
import 'package:capstone_management/repository/report_feedback_repository.dart';
import 'package:capstone_management/widget/project_page/detail_team_report.dart';
import 'package:flutter/material.dart';

import '../../constant/color.dart';
class AddFeedBack extends StatefulWidget {
  final WeeklyReport report;
  const AddFeedBack({Key? key, required this.report}) : super(key: key);

  @override
  State<AddFeedBack> createState() => _AddFeedBackState();
}


class _AddFeedBackState extends State<AddFeedBack> {
  final TextEditingController controller = TextEditingController();
  Future<bool>?  _futureFeedBack;
  @override
  Widget build(BuildContext context) {
    TextEditingController feedbackController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text('FeedBack '),
        // leading: BackButton(
        //   onPressed: () => Navigator.pop(context, content),
        // ),
      ),
      body:
      Container(
        child: (_futureFeedBack == null) ? buildColumn() :buildFutureBuilder(),
      )


    );   }

  Column buildColumn() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TextField(
          controller: controller,
          decoration: const InputDecoration(hintText: 'Enter Title'),
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              _futureFeedBack = ReportFeedbackRepository().postFeedback(widget.report.reporter.teamDetail!.teamId,widget.report.id,controller.text);
            });
          },
          child: const Text('Add feed back'),
        ),
      ],
    );
  }
  FutureBuilder buildFutureBuilder() {
    return FutureBuilder(
      future: _futureFeedBack,
      builder: (context, snapshot) {
        var data = snapshot.data;
        if (data == true) {
          return Text(controller.text);
        }
        if(data == false){
          return Text('false');
        }

        else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        return const CircularProgressIndicator();
      },
    );
  }
  }


