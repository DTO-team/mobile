import 'package:capstone_management/modal/weekly_report.dart';
import 'package:capstone_management/repository/report_feedback_repository.dart';
import 'package:capstone_management/repository/report_repository.dart';
import 'package:capstone_management/widget/project_page/detail_team_report.dart';
import 'package:flutter/material.dart';

import '../../constant/color.dart';
class AddFeedBack extends StatefulWidget {
  final Function() notifyParent;

  final WeeklyReport report;
   AddFeedBack({Key? key, required this.report, required this.notifyParent}) : super(key: key);

  @override
  State<AddFeedBack> createState() => _AddFeedBackState();
}


class _AddFeedBackState extends State<AddFeedBack> {
  final TextEditingController controller = TextEditingController();
  Future<bool>?  _futureFeedBack;
  late Future<WeeklyReport> feedback;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    TextEditingController feedbackController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text('FeedBack'),
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

      children: <Widget>[
        Expanded(
          child: Container(
              margin: EdgeInsets.all(8),
              child:
          ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: widget.report.feedback.length,
              itemBuilder: (context, index) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  child: Column(

                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start ,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 5),
                            height: 45,
                            width: 45,
                            decoration: BoxDecoration(
                                color: blue,
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage('assets/chamb.png'),
                                )),
                          ),
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ///author name
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.only(left: 5),
                                          child: (Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.end,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                '${widget.report.feedback[index].author.fullName}',
                                                style: const TextStyle(
                                                    color: kTextColor,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 17),
                                              ),
                                            ],
                                          )),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 5,),

                                  /// content
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 5),
                                    child: Text('${widget.report.feedback[index].content}'
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),

                    ],
                  ),
                );
              }
          )


            ),
        ),
        Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: ListTile(
        title: TextFormField(
          controller:  controller,
          decoration: InputDecoration(labelText: "FeedBack"),
        ),
        trailing:  IconButton(
          onPressed: (){
            setState(() {
              _futureFeedBack = ReportFeedbackRepository().postFeedback(widget.report.reporter.teamDetail!.teamId,widget.report.id,controller.text);
            });
          }, icon:  Icon(Icons.send)
        ),
      )
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
          return AlertDialog(
            title: Text('Success'),
            content: Text('Submit successfully'),
            actions: [
              TextButton(onPressed:(){ Navigator.pop(context);}, child: Text('OK'),

              )
            ],
          );

        }
        if(data == false){
          return AlertDialog(
            title: Text('Failed'),
            content: Text('Submit Failed, Please try again '),
            actions: [
              TextButton(onPressed:(){ Navigator.pop(context);}, child: Text('OK'),

              )
            ],
          );
        }

        else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        return const CircularProgressIndicator();
      },
    );
  }
  }


