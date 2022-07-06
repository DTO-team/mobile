import 'package:capstone_management/modal/project.dart';
import 'package:capstone_management/repository/project_repository.dart';
import 'package:capstone_management/widget/project_page/detail_project_card.dart';
import 'package:capstone_management/widget/project_page/project_card.dart';
import 'package:flutter/material.dart';


class Search_project extends SearchDelegate{
  ProjectRepository _fetchTopic = ProjectRepository();
  @override
  String get searchFieldLabel => 'Project name';
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(onPressed: (){
        query = "";
      }, icon: Icon(Icons.close))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(onPressed: (){
      Navigator.pop(context);
    }, icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return  Container(
      padding: EdgeInsets.all(10),
      child: FutureBuilder<List<Project>?>(
          future: _fetchTopic.getAllProject(query:  query),
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
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Center(
      child: Text(''),
    );
  }

}