import 'package:capstone_management_dto/Screens/main_screen/project_screen.dart';
import 'package:flutter/material.dart';

import '../../Screens/main_screen/topic_screen.dart';
class TabBarTopic extends StatefulWidget {
  const TabBarTopic({Key? key}) : super(key: key);

  @override
  State<TabBarTopic> createState() => _TabBarTopicState();
}

class _TabBarTopicState extends State<TabBarTopic> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
            flexibleSpace:
                Column(mainAxisAlignment: MainAxisAlignment.end, children: const [
          TabBar(
            tabs: [
              Tab(
                text: 'Applied Topic',
              ),
              Tab(
                text: 'Available Topic',
              )
            ],
          )
        ])
        ),
        body: TabBarView(
          children: const [TopicPage(), ProjectPage()],
        ),
      ),
    );
  }
}
