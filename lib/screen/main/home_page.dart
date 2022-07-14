import 'package:capstone_management/constant/color.dart';
import 'package:capstone_management/constant/text_style.dart';
import 'package:capstone_management/modal/semesters.dart';
import 'package:capstone_management/provider/new_feed.dart';
import 'package:capstone_management/provider/semester_provider.dart';
import 'package:capstone_management/widget/home_page/new_feed_card.dart';
import 'package:capstone_management/widget/home_page/time_line_card.dart';
import 'package:capstone_management/widget/home_page/welcome_card.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../modal/lecturer.dart';
import '../../provider/app_user_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

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
  List<Semester>? ListSemester;
   Semester? _selectedSemester;
  late Lecturer _appUser;
  @override
  void initState() {
    super.initState();

    setState(() {
      loadSemester();
      _appUser =
      Provider
          .of<AppUserProvider>(context, listen: false)
          .appUser!;
      _selectedSemester = Provider.of<SemestersProvider>(context, listen:  false).currentSemester;
      print('home ${ListSemester}');
    });

  }

  void loadSemester() async{
    await Provider.of<SemestersProvider>(context,listen: false).loadSemesters();
    ListSemester = Provider.of<SemestersProvider>(context, listen:  false).semesters;

  }
  @override
  Widget build(BuildContext context) {


    int _currentCard = 0;

    List cardList = [WelcomeCard( name: _appUser.fullName?? '',), TimeLineCard()];
    return Scaffold(
      ///trao cho th nay
      ///ừ cái key đó, ta hoàn toàn có thể get được tham chiếu của chính Widget đó qua biến
      ///currentWidget và thậm chí get được cả State của Widget đó

      appBar: AppBar(
        backgroundColor: whiteSoft,
        elevation: 0,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            DropdownButton<Semester?>(

              value: _selectedSemester,
            items:
            ListSemester?.map<DropdownMenuItem<Semester?>>((Semester? sem) {
                return DropdownMenuItem<Semester?>(
                    child: Text('${sem?.season}'),
                value: sem,
                );
              } ).toList(),
              onChanged: (Semester? value) {
                setState(() {
                  Provider.of<SemestersProvider>(context, listen:  false).currentSemester  = value ;
                });
              },

            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          Container(
            color: whiteSoft,
            child: CarouselSlider(
              options: CarouselOptions(
                  aspectRatio: 16 / 9,
                  viewportFraction: 1,
                  scrollDirection: Axis.horizontal,
                  autoPlay: true,
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
          /// NOTIFICATION
          SizedBox(height: 10,),
          Container(
            padding: EdgeInsets.only(left: 10),
            child: Text('Notification',style: AppTextSytle.subTitle1_1TextStyle,),
          ),

          ListView.builder(
          physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: nfs.length, itemBuilder: (context, index) => NewFeedCard(feed: nfs[index]))
        ],
      ),



    );


  }

}