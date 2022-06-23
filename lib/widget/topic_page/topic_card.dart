import 'package:capstone_management/constant/text_style.dart';
import 'package:capstone_management/modal/topic.dart';
import 'package:capstone_management/provider/new_feed.dart';
import 'package:capstone_management/constant/color.dart';
import 'package:capstone_management/widget/topic_page/detail_topic_card.dart';
import 'package:flutter/material.dart';

class TopicCard extends StatelessWidget {
  const TopicCard({Key? key, required this.topic, required this.onPress}) : super(key: key);

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
            borderRadius: BorderRadius.circular(5)
        ),
        child: Container(
          margin: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Recipe title
              Text(
                topic.topicName,
                style: AppTextSytle.tittleTextStyle,
              ),
              Padding(padding: EdgeInsets.only(top: 10)),
              Container(
                  margin: EdgeInsets.only(left: 5),
                  child: RichText(text: TextSpan(
                      text: 'Lecturer: ',
                      style: AppTextSytle.subTitle1TextStyle,
                      children: [
                        TextSpan(text: '${topic.lecturersDetails.map((e) => e.email).toList().join(', ')}', style: AppTextSytle.bodyTextStyle )
                      ]

                  ),

                  )
              ),
             
                  Divider(thickness: 1, color: primary,height: 20,),
              Container(
                padding: EdgeInsets.fromLTRB(2, 0, 2, 2),
                child: Text(topic.description.length > 100 ? '${topic.description.substring(0,100)}...': topic.description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis, textAlign: TextAlign.left,
                  style: AppTextSytle.bodyTextStyle,
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}