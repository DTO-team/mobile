import 'package:flutter/material.dart';

import '../../constant/color.dart';
import '../../constant/text_style.dart';
import '../../modal/topic.dart';

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
          title: const Text(
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
            decoration: const BoxDecoration(color: whiteSoft),
            height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: Center(
                        child: Text(
                      topic.topicName,
                      style: AppTextSytle.tittleTextStyle,
                    ))),
                const Divider(
                  thickness: 0.5,
                  color: primary,
                ),
                const Text(
                  'Lecturer',
                  style: AppTextSytle.subTitle2TextStyle,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: topic.lecturersDetails.length,
                  itemBuilder: (BuildContext context, int index) {
                    return lec_card(
                      name: topic.lecturersDetails[index].fullName,
                      avatar: 'assets/chamb.png',
                      email: topic.lecturersDetails[index].email,
                    );
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Description',
                  style: AppTextSytle.subTitle2TextStyle,
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                    margin: const EdgeInsets.only(top: 5),
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: whiteSoft,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 2,
                          offset:
                              const Offset(0, 1), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Text(
                      topic.description,
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

class lec_card extends StatelessWidget {
  const lec_card({
    Key? key,
    this.name,
    this.avatar,
    this.email,
  }) : super(key: key);
  final name;
  final avatar;
  final email;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 5),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: whiteSoft,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 2,
            offset: const Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(right: 5),
            height: 40,
            width: 40,
            decoration: BoxDecoration(
                color: blue,
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(avatar),
                )),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: AppTextSytle.subTitle1TextStyle,
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                email,
              )
            ],
          ),
        ],
      ),
    );
  }
}
