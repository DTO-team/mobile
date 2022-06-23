import 'package:flutter/material.dart';

import '../../constant/color.dart';
import '../../constant/text_style.dart';
import '../../modal/topic.dart';

class DetailTopicCard extends StatelessWidget {
  const DetailTopicCard({Key? key, required this.topic}) : super(key: key);

final Topic topic;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: whiteSoft,
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        title: Text(
          'Topic Detail', style: TextStyle(color: black, fontFamily: 'Roboto', fontWeight: FontWeight.w600, fontSize: 22),
        ),
      ),
      body:SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: whiteSoft
          ),
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(margin: EdgeInsets.symmetric(vertical: 10),
                  child: Text(topic.topicName,style:AppTextSytle.tittleTextStyle,)),
              Divider(thickness: 0.5,color: primary,),

              Text('Lecturer',style: AppTextSytle.subTitle2TextStyle,),
              ListView.builder(
                shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
                itemCount: topic.lecturersDetails.length,
                itemBuilder: (BuildContext context, int index) {
                  if( topic.lecturersDetails.map((e) => e.email).toList()[index] != null){
                    return lec_card(
                      name:    topic.lecturersDetails.map((e) => e.fullName).toList()[index],
                      avatar: 'assets/chamb.png',
                      email: topic.lecturersDetails.map((e) => e.email).toList()[index],
                    );
                  }
                  else{
                    return Flexible(child: Center(child: Text('Empty')));
                  }

              },
              ),
              SizedBox(height: 10,),
              Text('Description',style: AppTextSytle.subTitle2TextStyle,),
              SizedBox(height: 5,),
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
                child: Text(topic.description,
                style: AppTextSytle.bodyTextStyle,textAlign: TextAlign.left,
              )
              )],
          ),
        ),
      ),

    );
  }
}

class lec_card extends StatelessWidget {
  const lec_card({
    Key? key, this.name, this.avatar, this.email,
  }) : super(key: key);
  final name;
  final avatar;
  final email;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5),
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
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(right: 5),
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
              Container(child: Text(name,style: AppTextSytle.subTitle1TextStyle,)),
              SizedBox(height: 2,),
              Container(
                child: Text(email,),
              )


            ],

          ),
        ],
      ),
    );
  }
}