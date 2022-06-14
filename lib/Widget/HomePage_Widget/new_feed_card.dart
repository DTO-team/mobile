import 'package:capstone_management_dto/Widget/color.dart';
import 'package:flutter/material.dart';

import '../../Provider/newfeed.dart';

class NewFeedCard extends StatelessWidget {
  final NewFeed feed;

  const NewFeedCard({Key? key, required this.feed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// 2 row: picture| name   time   ( expand)
    ///               |team            column
    ///               |feed          column
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ///profile picture
        Container(
          margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                    color: blue,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(feed.userProfilePic),
                    )),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: (Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                          ///
                           Text(feed.userFirstName, style: TextStyle(
                               color: kTextColor,
                               fontWeight: FontWeight.w500,
                               fontSize: 17),),
                          SizedBox(width: 5),

                          ///
                          Container(
                            height: 3,
                            width: 3,
                            decoration: BoxDecoration(
                                color: gray, shape: BoxShape.circle),
                          ),
                            SizedBox(width: 5),
                            Flexible(
                           child: Text(feed.team.length > 10 ? feed.team.substring(0, 10)+'...' : feed.team ,
                             style: TextStyle(color: kTeamColor, fontSize: 15),
                              overflow: TextOverflow.ellipsis,
                            ),
                         ),
                          SizedBox(width: 5),
                          ///
                          Container(
                            height: 3,
                            width: 3,
                            decoration: BoxDecoration(
                                color: gray, shape: BoxShape.circle),
                          ),
                            SizedBox(width: 5),
                            Text(feed.tweetedAt,
                              style: TextStyle(color: kTeamColor, fontSize: 15),),
                        ]),
                      ///Topic
                      SizedBox(height: 5,),
                     // Text('Topic: ${feed.topic}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17,color: kTextColor),),
                      SizedBox(height: 2,),
                      Text(feed.tweet),
                      SizedBox(height: 6,),
                      ///Picture


                    ],
                  )),
                ),
              ),
            ],
          ),
        ),
        Divider(
          thickness: 0.8,
          color: gray,
          height: 20,
        )
      ],
    );
  }
}
