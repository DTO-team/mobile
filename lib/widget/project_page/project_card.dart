import 'package:capstone_management/constant/color.dart';
import 'package:capstone_management/provider/new_feed.dart';
import 'package:flutter/material.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({Key? key, required this.feed, required this.onPress})
      : super(key: key);

  //final User users;
  final NewFeed feed;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        height: MediaQuery.of(context).size.height / 4,
        padding: const EdgeInsets.fromLTRB(0, 5, 5, 0),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ], color: whiteSoft, borderRadius: BorderRadius.circular(5)),
        child: Container(
          margin: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Recipe title
              const Text(
                'Name',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
              ),
              const Padding(padding: EdgeInsets.only(top: 10)),

              const Divider(
                thickness: 1,
                color: primary,
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(2, 0, 2, 2),
                child: const Center(
                  child: Text(
                    'Description : this is a long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long4 long long long long long long long long long ',
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
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
