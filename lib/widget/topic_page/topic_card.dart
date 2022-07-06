import 'package:capstone_management/constant/color.dart';
import 'package:capstone_management/constant/text_style.dart';
import 'package:capstone_management/modal/topic.dart';
import 'package:flutter/material.dart';

class TopicCard extends StatelessWidget {
  const TopicCard({Key? key, required this.topic, required this.onPress})
      : super(key: key);

  final Topic topic;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: EdgeInsets.all(10),
        padding: const EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset:  Offset(3, 0), // changes position of shadow
          ),
        ], color: whiteSoft, borderRadius: BorderRadius.circular(5)),
        child: Container(
          margin: const EdgeInsets.all(10),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Recipe title
              Center(
                child: Text(
                  topic.topicName?? '',
                  style: AppTextSytle.tittleTextStyle,
                ),
              ),
              const Padding(padding: EdgeInsets.only(top: 10)),

              const Divider(
                thickness: 1,
                color: primary,
                height: 10,
              ),
              const Padding(padding: EdgeInsets.only(top: 10)),
              Container(
                  child: RichText(
                    text: TextSpan(
                        text: 'Lecturer: ',
                        style: AppTextSytle.subTitle1TextStyle,
                        children: [
                          TextSpan(
                              text: topic.lecturersDetails
                                  .map((e) => e.email)
                                  .toList()
                                  .join(', '),
                              style: AppTextSytle.bodyTextStyle)
                        ]),
                  )),

              const Divider(
                thickness: 1,
                color: primary,
                height: 20,
              ),

              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: RichText(
                  text: TextSpan(
                      text: 'Description: ',
                      style: AppTextSytle.subTitle1TextStyle,
                      children: [
                        TextSpan(
                            text: (topic.description?.length ?? 0) > 100
                                ? '${topic.description?.substring(0, 100)}...'
                                : topic.description,
                            style: AppTextSytle.bodyTextStyle),
                      ]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
