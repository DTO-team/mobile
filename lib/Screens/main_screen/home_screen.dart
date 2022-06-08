import 'package:capstone_management_dto/Widget/new_feed_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Provider/newfeed.dart';
import '../../Widget/color.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /// tạo ra 1 key để toàn app có thể access vào get state hay Widget
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    List<NewFeed> nfs = [
      NewFeed(
          id: '1',
          userFirstName: 'chamber th france',
          team: 'DTOOOOOOOOOOOOOOO',
          userProfilePic: 'assets/chamb.png',
          tweet:
              'Do not worry, with me this will be easy. C\'est simple comme bonjour',
          imageLinks: ['assets/chamb.png'],
          tweetedAt: 'Oct 2',
          topic: 'Project OnGoinggggg'),
      NewFeed(
          id: '2',
          userFirstName: 'Lute',
          team: 'Lute100',
          userProfilePic: 'assets/chamb.png',
          tweet:
              'This killing is terrible business but I always say if I must do something, be the best',
          imageLinks: ['assets/chamb.png'],
          tweetedAt: 'Oct 4',
          topic: 'Project OnGoing'),
      NewFeed(
          id: '3',
          userFirstName: 'Lute',
          team: 'Lute100',
          userProfilePic: 'assets/chamb.png',
          tweet:
              'Our guests have arrived. Let\'s make a good first impression, shall we?',
          imageLinks: ['assets/chamb.png'],
          tweetedAt: 'Oct 4',
          topic: 'Project OnGoing'),
      NewFeed(
          id: '4',
          userFirstName: 'Lute',
          team: 'Lute100',
          userProfilePic: 'assets/chamb.png',
          tweet:
              'I still don\'t understand why teachers used to beat the shit out of 4th graders who forgot their notebook.',
          imageLinks: ['assets/chamb.png'],
          tweetedAt: 'Oct 4',
          topic: 'Project OnGoing'),
      NewFeed(
          id: '5',
          userFirstName: 'Lute',
          team: 'Lute100',
          userProfilePic: 'assets/chamb.png',
          tweet:
              'I still don\'t understand why teachers used to beat the shit out of 4th graders who forgot their notebook.',
          imageLinks: ['assets/chamb.png'],
          tweetedAt: 'Oct 4',
          topic: 'Project OnGoing'),
      NewFeed(
          id: '6',
          userFirstName: 'Lute',
          team: 'Lute100',
          userProfilePic: 'assets/chamb.png',
          tweet:
              'I still don\'t understand why teachers used to beat the shit out of 4th graders who forgot their notebook.',
          imageLinks: ['assets/chamb.png'],
          tweetedAt: 'Oct 4',
          topic: 'Project OnGoing'),
      NewFeed(
          id: '7',
          userFirstName: 'Lute',
          team: 'Lute100',
          userProfilePic: 'assets/chamb.png',
          tweet:
              'I still don\'t understand why teachers used to beat the shit out of 4th graders who forgot their notebook.',
          imageLinks: ['assets/chamb.png'],
          tweetedAt: 'Oct 4',
          topic: 'Project OnGoing'),
      NewFeed(
          id: '8',
          userFirstName: 'Lute',
          team: 'Lute100',
          userProfilePic: 'assets/chamb.png',
          tweet:
              'I still don\'t understand why teachers used to beat the shit out of 4th graders who forgot their notebook.',
          imageLinks: ['assets/chamb.png'],
          tweetedAt: 'Oct 4',
          topic: 'Project OnGoing'),
      NewFeed(
          id: '9',
          userFirstName: 'Lute',
          team: 'Lute100',
          userProfilePic: 'assets/chamb.png',
          tweet:
              'I still don\'t understand why teachers used to beat the shit out of 4th graders who forgot their notebook.',
          imageLinks: ['assets/chamb.png'],
          tweetedAt: 'Oct 4',
          topic: 'Project OnGoing'),
      NewFeed(
          id: '10',
          userFirstName: 'Lute',
          team: 'Lute100',
          userProfilePic: 'assets/chamb.png',
          tweet:
              'I still don\'t understand why teachers used to beat the shit out of 4th graders who forgot their notebook.',
          imageLinks: ['assets/chamb.png'],
          tweetedAt: 'Oct 4',
          topic: 'Project OnGoing'),
    ];
    return Scaffold(
      ///trao cho th nay
      ///ừ cái key đó, ta hoàn toàn có thể get được tham chiếu của chính Widget đó qua biến
      ///currentWidget và thậm chí get được cả State của Widget đó
      key: _scaffoldKey,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            centerTitle: true,
            floating: true,
            snap: true,
            elevation: 0,

          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.only(top: 1),
              height: 0.1,
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return NewFeedCard(
                  feed: nfs[index],
                );
              },
              childCount: nfs.length,
            ),
          )
        ],
      ),
    );

  }
}
