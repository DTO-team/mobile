import 'package:capstone_management/constant/color.dart';
import 'package:capstone_management/modal/project.dart';
import 'package:capstone_management/repository/project_repository.dart';
import 'package:capstone_management/widget/project_page/detail_project_card.dart';
import 'package:capstone_management/widget/project_page/project_card.dart';
import 'package:capstone_management/widget/topic_page/topic_search_bar.dart';
import 'package:flutter/material.dart';

import '../../widget/project_page/project_search_bar.dart';

class ProjectPage extends StatefulWidget {
  const ProjectPage({Key? key}) : super(key: key);

  @override
  State<ProjectPage> createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
  List<Project>? _projects;
  var isLoaded = false;
  ProjectRepository _fetchTopic = ProjectRepository();

  @override
  void initState() {
    super.initState();
    loadTopics();
  }

  Future<void> loadTopics() async {
    _projects = await ProjectRepository().getAllProject();
    if (_projects != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: whiteSoft,
            centerTitle: true,
            title: Text('Project', style: TextStyle(color: primary, fontFamily: 'Roboto', fontWeight: FontWeight.w600, fontSize: 25),),
            actions: [
              IconButton(
                  onPressed: (){
                    showSearch(context: context, delegate: Search_project());
                  },
                  icon: Icon(Icons.search, color:  black,)),
            ],
          ),
          body: Container(
            padding: const EdgeInsets.all(8.0),
            child: FutureBuilder<List<Project>?>(
                future: _fetchTopic.getAllProject(),
                builder: (context, snapshot) {
                  var data = snapshot.data;
                  if(!snapshot.hasData){
                    return Center(child: CircularProgressIndicator(),);
                  }
                  return ListView.builder(
                    itemCount: data?.length?? 0,
                    itemBuilder: ( context,  index) {
                      return ProjectCard(
                        project: data![index],
                        onPress: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailProject(
                                    project: data[index],
                                  )));
                        },
                      );
                    },
                  );
                }
            ),
          ),
        ));
  }
}
