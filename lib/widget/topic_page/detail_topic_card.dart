import 'package:flutter/material.dart';
import '../../constant/color.dart';
import '../../constant/text_style.dart';
import '../../modal/topic.dart';
import '../Lecture_card.dart';

class DetailTopicCard extends StatelessWidget {
  const DetailTopicCard({Key? key, required this.topic}) : super(key: key);

  final Topic topic;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragUpdate: (details) {},
      onHorizontalDragUpdate: (details) {
        if (details.delta.direction <= 0) {
          Navigator.pop(context);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: whiteSoft,
          centerTitle: true,
          title: Text(
            'Topic Detail',
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
                  'Topic Name',
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
                      topic.topicName?? '',
                      style: AppTextSytle.subTitle1TextStyle,
                      textAlign: TextAlign.left,
                    )),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Lecturer',
                  style: AppTextSytle.subTitle2TextStyle,
                ),
                SizedBox(
                  height: 5,
                ),

                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: topic.lecturersDetails?.length,
                  itemBuilder: (BuildContext context, int index) {
                    if (topic.lecturersDetails
                            !.map((e) => e.email)
                            .toList()[index] !=
                        null) {
                      return lec_card(
                        name: topic.lecturersDetails
                            !.map((e) => e.fullName)
                            .toList()[index],
                        avatar: 'assets/chamb.png',
                        email: topic.lecturersDetails
                            !.map((e) => e.email)
                            .toList()[index],
                        icon: '',

                      );
                    } else {
                      return Flexible(child: Center(child: Text('Empty')));
                    }
                  },
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
                      topic.description?? '',
                      style: AppTextSytle.bodyTextStyle,
                      textAlign: TextAlign.left,
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
