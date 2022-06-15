import 'package:capstone_management/provider/new_feed.dart';
import 'package:capstone_management/widget/color.dart';
import 'package:flutter/material.dart';

class TopicCard extends StatelessWidget {
  const TopicCard({Key? key, required this.feed}) : super(key: key);

  //final User users;
  final NewFeed feed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
      },
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
            color: AppColor.secondary,
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
                'Name',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
              ),
              Padding(padding: EdgeInsets.only(top: 10)),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 5),
                    child: Text(
                      feed.team,
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  SizedBox(
                    width: 10,
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
              Divider(thickness: 1, color: AppColor.primary,height: 60,),
              Container(
                padding: EdgeInsets.fromLTRB(2, 0, 2, 2),
                child: Center(
                  child: Text('Description : this is a long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long ',
                    maxLines: 3,overflow: TextOverflow.ellipsis, textAlign: TextAlign.left,
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