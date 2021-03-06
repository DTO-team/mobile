import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import '../../constant/color.dart';
import '../../constant/text_style.dart';
import '../../modal/topic.dart';
import '../Lecture_card.dart';

class DetailTopicCard extends StatefulWidget {
  const DetailTopicCard({Key? key, required this.topic}) : super(key: key);

  final Topic topic;

  @override
  State<DetailTopicCard> createState() => _DetailTopicCardState();
}

class _DetailTopicCardState extends State<DetailTopicCard> {
  static const _defaultImage = AssetImage('assets/google-logo.png');


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
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
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
                      widget.topic.topicName?? '',
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

                Card(
                    child: ExpandablePanel(
                      header:lec_card(
                        name: widget.topic.lecturersDetails
                            .map((e) => e.fullName)
                            .toList().first,
                        avatar: widget.topic.lecturersDetails.map((e) => e.avatarUrl).toList().first!= null ?NetworkImage('${widget.topic.lecturersDetails.map((e) => e.avatarUrl).toList().first}'): _defaultImage,
                        email: widget.topic.lecturersDetails
                            .map((e) => e.email)
                            .toList().first,

                      ),

                      collapsed: Text(''),

                      expanded: ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: widget.topic.lecturersDetails.length > 0 ? widget.topic.lecturersDetails.length -1 : widget.topic.lecturersDetails.length,
                        itemBuilder: (BuildContext context, int index) {

                          return lec_card(
                            name: widget.topic.lecturersDetails
                                .map((e) => e.fullName).toList()[index],
                            avatar: widget.topic.lecturersDetails.map((e) => e.avatarUrl).toList()[index]!= null ?NetworkImage('${widget.topic.lecturersDetails.map((e) => e.avatarUrl).toList()[index]}'): _defaultImage,
                            email: widget.topic.lecturersDetails
                                .map((e) => e.email)
                                .toList()[index],

                          );
                        },
                      ),

                    )
                ),
                SizedBox(height: 10,),
                Text(
                  'Company',
                  style: AppTextSytle.subTitle2TextStyle,
                ),
                SizedBox(height: 5,),
                lec_card(
                  name: widget.topic.companyDetail?.fullName ?? 'This Topic is not belong to comany',
                  avatar: _defaultImage,
                  email: widget.topic.companyDetail?.email ?? '',
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
                      widget.topic.description?? '',
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