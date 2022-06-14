import 'package:capstone_management_dto/Widget/HomePage_Widget/new_feed_card.dart';
import 'package:capstone_management_dto/Widget/TopicPage_Widget/topic_card.dart';
import 'package:capstone_management_dto/Widget/search_bar.dart';
import 'package:capstone_management_dto/Widget/color.dart';
import 'package:flutter/material.dart';

import '../../Provider/newfeed.dart';
import '../../Widget/search_bar.dart';

class TopicPage extends StatefulWidget {
  const TopicPage({Key? key}) : super(key: key);

  @override
  State<TopicPage> createState() => _TopicPageState();
}

class _TopicPageState extends State<TopicPage> {
  List<NewFeed> nfs = [
    NewFeed(
        id: '1',
        userFirstName: 'chamber th france',
        team: 'DTOOOOOOOOOOOOOOO',
        userProfilePic: 'assets/chamb.png',
        tweet:
        'Do not worry, with me this will be easy. C\'est simple comme bonjour',
        tweetedAt: 'Oct 2',
        topic: 'Project OnGoinggggg'),
    NewFeed(
        id: '2',
        userFirstName: 'Lute',
        team: 'Lute100',
        userProfilePic: 'assets/chamb.png',
        tweet:
        'This killing is terrible business but I always say if I must do something, be the best',
        tweetedAt: 'Oct 4',
        topic: 'Project OnGoing'),
    NewFeed(
        id: '3',
        userFirstName: 'Lute',
        team: 'Lute100',
        userProfilePic: 'assets/chamb.png',
        tweet:
        'Our guests have arrived. Let\'s make a good first impression, shall we?',
        tweetedAt: 'Oct 4',
        topic: 'Project OnGoing'),
    NewFeed(
        id: '4',
        userFirstName: 'Lute',
        team: 'Lute100',
        userProfilePic: 'assets/chamb.png',
        tweet:
        'I still don\'t understand why teachers used to beat the shit out of 4th graders who forgot their notebook.',
        tweetedAt: 'Oct 4',
        topic: 'Project OnGoing'),
    NewFeed(
        id: '5',
        userFirstName: 'Lute',
        team: 'Lute100',
        userProfilePic: 'assets/chamb.png',
        tweet:
        'I still don\'t understand why teachers used to beat the shit out of 4th graders who forgot their notebook.',
        tweetedAt: 'Oct 4',
        topic: 'Project OnGoing'),
    NewFeed(
        id: '6',
        userFirstName: 'Lute',
        team: 'Lute100',
        userProfilePic: 'assets/chamb.png',
        tweet:
        'I still don\'t understand why teachers used to beat the shit out of 4th graders who forgot their notebook.',
        tweetedAt: 'Oct 4',
        topic: 'Project OnGoing'),
    NewFeed(
        id: '7',
        userFirstName: 'Lute',
        team: 'Lute100',
        userProfilePic: 'assets/chamb.png',
        tweet:
        'I still don\'t understand why teachers used to beat the shit out of 4th graders who forgot their notebook.',
        tweetedAt: 'Oct 4',
        topic: 'Project OnGoing'),
    NewFeed(
        id: '8',
        userFirstName: 'Lute',
        team: 'Lute100',
        userProfilePic: 'assets/chamb.png',
        tweet:
        'I still don\'t understand why teachers used to beat the shit out of 4th graders who forgot their notebook.',
        tweetedAt: 'Oct 4',
        topic: 'Project OnGoing'),
    NewFeed(
        id: '9',
        userFirstName: 'Lute',
        team: 'Lute100',
        userProfilePic: 'assets/chamb.png',
        tweet:
        'I still don\'t understand why teachers used to beat the shit out of 4th graders who forgot their notebook.',
        tweetedAt: 'Oct 4',
        topic: 'Project OnGoing'),
    NewFeed(
        id: '10',
        userFirstName: 'Lute',
        team: 'Lute100',
        userProfilePic: 'assets/chamb.png',
        tweet:
        'I still don\'t understand why teachers used to beat the shit out of 4th graders who forgot their notebook.',
        tweetedAt: 'Oct 4',
        topic: 'Project OnGoing'),
  ];

  // late List<User>? users;
  // var isLoaded = false;
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   getUsers();
  // }
  // getUsers()async{
  //   users = await Remote().getUsers();
  //   setState(() {
  //     if(users != null){
  //       isLoaded = true;
  //     }
  //   });
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primary,
        title: Text('Topic'),
        centerTitle: true,
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [Container(
          margin: EdgeInsets.only(top: 2),
          color: Colors.white,
          child: Stack(
            children: [
              Column(
                children: [
                  SearchBar(
                    routeTo: (){},
                  )
                ],
              )
            ],
          ),

        ),
          ListView.separated(
            shrinkWrap: true,
            itemCount: nfs.length,
            physics: NeverScrollableScrollPhysics()
            ,
            separatorBuilder: (context, index) {
              return SizedBox(height: 1);
            },
            itemBuilder: (context, int index) {
              return TopicCard(feed: nfs[index]);
            },)
        ],

      ),

    );
  }
}
