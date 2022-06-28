import 'package:capstone_management/constant/color.dart';
import 'package:capstone_management/constant/text_style.dart';
import 'package:capstone_management/provider/new_feed.dart';
import 'package:capstone_management/widget/home_page/new_feed_card.dart';
import 'package:capstone_management/widget/home_page/time_line_card.dart';
import 'package:capstone_management/widget/home_page/welcome_card.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /// tạo ra 1 key để toàn app có thể access vào get state hay Widget
//  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

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
    int _currentCard = 0;
    List cardList = [WelcomeCard(), TimeLineCard()];
    List<T> map<T>(List list, Function handler) {
      List<T> result = [];
      for (var i = 0; i < list.length; i++) {
        result.add(handler(i, list[i]));
      }
      return result;
    }

    return Scaffold(
      ///trao cho th nay
      ///ừ cái key đó, ta hoàn toàn có thể get được tham chiếu của chính Widget đó qua biến
      ///currentWidget và thậm chí get được cả State của Widget đó
      // key: _scaffoldKey,

      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            // expandedHeight: 120,
            centerTitle: true,
            floating: true,
            elevation: 0,
            backgroundColor: whiteSoft,

            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                'What\'s News',
                style: TextStyle(color: primary),
              ),
              centerTitle: true,
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: whiteSoft,
                  child: CarouselSlider(
                    options: CarouselOptions(
                        aspectRatio: 16 / 9,
                        viewportFraction: 1,
                        scrollDirection: Axis.horizontal,
                        // autoPlay: true,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _currentCard = index;
                          });
                        }),
                    items: cardList.map((card) {
                      return Builder(builder: (BuildContext context) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          child: Container(
                            child: card,
                          ),
                        );
                      });
                    }).toList(),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Text(
                    'Notifications',
                    style: AppTextSytle.subTitle2TextStyle,
                  ),
                ),
              ],
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
