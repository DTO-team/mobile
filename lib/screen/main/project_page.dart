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
  var isLoaded = false;
  var isDescending = false;
  late Future<List<Project>?>? dataFuture;

  ProjectRepository _fetchTopic = ProjectRepository();

  @override
  void initState() {
    super.initState();
    dataFuture = ProjectRepository().getAllProject();
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
          body: RefreshIndicator(
            onRefresh: (){
              return Future(()async{
                await Future.delayed(Duration(seconds: 2));
                setState(() {
                  dataFuture = ProjectRepository().getAllProject();
                });
              });
            },
            child: Container(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextButton.icon(onPressed:()=> setState(()
                  => isDescending = !isDescending), icon: RotatedBox(quarterTurns: 1,
                  child: Icon(Icons.compare_arrows_rounded)), label: Text(isDescending ? 'Z-A' : 'A-Z')),
                  Expanded(
                    child: FutureBuilder<List<Project>?>(
                        future: dataFuture,
                        builder: (context, snapshot) {
                          var data = snapshot.data;
                          if(snapshot.hasError){
                            print(snapshot.error);
                          }
                          if(!snapshot.hasData){
                            return Center(child: CircularProgressIndicator(),);
                          }

                          return ListView.builder(
                            itemCount: data?.length?? 0,
                            itemBuilder: ( context,  index) {
                              final sort = data?..sort((a,b)=> isDescending ? b.topicsResponse.topicName!.compareTo(a.topicsResponse.topicName!) :
                              a.topicsResponse.topicName!.compareTo(b.topicsResponse.topicName!) );
                              final sortedProjects = sort![index];
                              return ProjectCard(
                                project: sortedProjects,
                                onPress: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => DetailProject(
                                            project: data![index],
                                          )));
                                },
                              );
                            },
                          );
                        }
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
