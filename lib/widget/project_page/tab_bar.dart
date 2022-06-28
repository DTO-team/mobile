import 'package:capstone_management/widget/project_page/team_page.dart';
import 'package:flutter/material.dart';

class TabBarProject extends StatefulWidget {
  const TabBarProject({Key? key}) : super(key: key);

  @override
  State<TabBarProject> createState() => _TabBarProjectState();
}

class _TabBarProjectState extends State<TabBarProject> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Project Detail'),
          bottom: const TabBar(
            tabs: [
              Tab(
                text: 'Detail',
              ),
              Tab(
                text: 'Team',
              )
            ],
          ),
        ),
        body: const TabBarView(
          children: [TeamPage()],
        ),
      ),
    );
  }
}
