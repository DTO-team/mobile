import 'package:capstone_management/constant/color.dart';
import 'package:capstone_management/modal/lecturer.dart';
import 'package:capstone_management/modal/project.dart';
import 'package:capstone_management/modal/user.dart';
import 'package:capstone_management/provider/new_feed.dart';
import 'package:capstone_management/repository/project_repository.dart';
import 'package:capstone_management/widget/project_page/detail_project_card.dart';
import 'package:capstone_management/widget/project_page/project_card.dart';
import 'package:capstone_management/widget/search_bar.dart';
import 'package:flutter/material.dart';

class ProjectPage extends StatefulWidget {
  const ProjectPage({Key? key}) : super(key: key);

  @override
  State<ProjectPage> createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
  List<Project>? prjs;
  var isLoaded = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProject();
  }

  getProject() async {
    prjs = await ProjectRepository().getAllProject();
    if (prjs != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            centerTitle: true,
            title: Text(
              'Project',
              style: TextStyle(color: primary),
            ),
            floating: true,
            backgroundColor: whiteSoft,
            elevation: 0,
          ),
          SliverToBoxAdapter(
              child: SearchBar(
            routeTo: () {},
          )),
          SliverList(
              delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ProjectCard(
                  project: prjs![index],
                  onPress: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DetailProject()));
                  },
                ),
              );
            },
            childCount: prjs?.length ?? 0,
          ))
        ],
      ),
    );
  }
}
