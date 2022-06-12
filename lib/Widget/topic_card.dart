import 'package:capstone_management_dto/Widget/color.dart';
import 'package:flutter/material.dart';

import '../Modals/User.dart';
import '../Provider/newfeed.dart';

class TopicCard extends StatelessWidget {

  const TopicCard({Key? key,required this.feed}) : super(key: key);
  //final User users;
  final NewFeed feed;

  @override
  Widget build(BuildContext context) {
    return Container(
          margin:  EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: Padding(padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: Container(
            decoration: BoxDecoration(
              color: info,
              borderRadius:
                BorderRadius.circular(3.0),

            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text('${feed.userFirstName}', style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 5,),
                Text(feed.tweet),
                SizedBox(height: 10,),



              ],
            ),

          ),),
        );

        

  }
}
