import 'package:capstone_management/modal/lecturer.dart';
import 'package:capstone_management/modal/user.dart';
import 'package:capstone_management/service/remote_service.dart';
import 'package:flutter/material.dart';

import '../../provider/new_feed.dart';
import '../../widget/color.dart';
import '../../widget/project_page/detail_project_card.dart';
import '../../widget/project_page/project_card.dart';
import '../../widget/search_bar.dart';

class ProjectPage extends StatefulWidget {
  const ProjectPage({Key? key}) : super(key: key);

  @override
  State<ProjectPage> createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
  List<User>? users;
  List<Lecturer>? lecturers;
  var isLoaded = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUser();
    getLec();
  }

  getLec() async {
    lecturers = await Remote().getLectures();
    if (users != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  getUser() async {
    users = (await Remote().getUsers()) as List<User>?;
    if (users != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

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
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            centerTitle: true,
            title: Text('Project',style: TextStyle(color: primary),),
            floating: true,
            backgroundColor: whiteSoft,
            elevation: 0,
          ),
          SliverToBoxAdapter(
              child: SearchBar(routeTo: (){},)
          ),

          SliverList(delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index){
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ProjectCard(feed: nfs[index], onPress: () {  Navigator.push(context, MaterialPageRoute(
                    builder: (context) => DetailProject()
                )); },),
              );
            },
            childCount: nfs.length,
          )
          )
        ],
      ),
    );
  }
}
