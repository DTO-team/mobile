import 'package:flutter/material.dart';

import '../../Provider/newfeed.dart';
import '../color.dart';

class TopicCard extends StatelessWidget {
  const TopicCard({Key? key, required this.feed}) : super(key: key);

  //final User users;
  final NewFeed feed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 15, 10, 0),
        child: Container(
          decoration: BoxDecoration(
            color: AppColor.secondary,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // Recipe Info
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(left: 10),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Recipe title
                      Container(
                        margin: EdgeInsets.only(bottom: 12),
                        child: Text(
                          feed.topic,
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ),
                      // Recipe Calories and Time
                      Row(
                        children: [

                          Container(
                            margin: EdgeInsets.only(left: 5),
                            child: Text(
                              feed.id,
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.alarm,
                            size: 14,
                            color: Colors.black,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 5),
                            child: Text(
                              feed.tweetedAt,
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
