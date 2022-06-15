import 'package:capstone_management/screen/main/project_page.dart';
import 'package:capstone_management/screen/main/topic_page.dart';
import 'package:flutter/material.dart';

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
            flexibleSpace: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
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
            ])),
        body: TabBarView(
          children: const [TopicPage(), ProjectPage()],
        ),
      ),
    );
  }
}
