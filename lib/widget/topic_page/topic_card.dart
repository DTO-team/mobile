import 'package:capstone_management/modal/topic.dart';
import 'package:capstone_management/widget/color.dart';
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
        padding: const EdgeInsets.fromLTRB(0, 5,5, 0),
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 7,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
            color: whiteSoft,
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(20.0),
          ),
        ),
        child: Container(
          margin: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Recipe title
              Text(
                topic.name,
                style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
              ),
              const Padding(padding: EdgeInsets.only(top: 10)),
              /*Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 5),
                    child: Text(
                      topic.companyDetail.fullName,
                      style: const TextStyle(fontSize: 12),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 5),
                    child: Text(
                      topic.lecturerEmail,
                      style: const TextStyle(fontSize: 12),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 5),
                    child: Text(
                      topic.companyEmail,
                      style: const TextStyle(fontSize: 12),
                    ),
                  ),

                ],
              ),*/
              const Divider(thickness: 1, color: primary,height: 20,),
              Container(
                padding: const EdgeInsets.fromLTRB(2, 0, 2, 2),
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