import 'package:capstone_management/common/http_client.dart';
import 'package:capstone_management/provider/new_feed.dart';
import 'package:capstone_management/widget/color.dart';
import 'package:capstone_management/widget/topic_page/detail_topic_card.dart';
import 'package:flutter/material.dart';

import '../../modal/topic.dart';

class TopicCard extends StatelessWidget {
  const TopicCard({Key? key, required this.topic, required this.onPress}) : super(key: key);


  //final User users;
  final Topic topic;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        height: MediaQuery.of(context).size.height/4,
        padding: EdgeInsets.fromLTRB(0, 5,5, 0),
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
            color: whiteSoft,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20.0),
          ),
        ),
        child: Container(
          margin: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Recipe title
              Text(
                topic.name,
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
              ),
              Padding(padding: EdgeInsets.only(top: 10)),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 5),
                    child: Text(
                      topic.companyEmail,
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 5),
                    child: Text(
                      topic.lecturerEmail,
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 5),
                    child: Text(
                      topic.companyEmail,
                      style: TextStyle(fontSize: 12),
                    ),
                  ),

                ],
              ),
              Divider(thickness: 1, color: primary,height: 20,),
              Container(
                padding: EdgeInsets.fromLTRB(2, 0, 2, 2),
                child: Center(
                  child: Text(topic.description,
                    maxLines: 4,overflow: TextOverflow.ellipsis, textAlign: TextAlign.left,
                  ),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}