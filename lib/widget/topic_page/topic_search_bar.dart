import 'package:capstone_management/widget/topic_page/detail_topic_card.dart';
import 'package:capstone_management/widget/topic_page/topic_card.dart';
import 'package:flutter/material.dart';

import '../../modal/topic.dart';
import '../../repository/topic_repository.dart';

class Search_Topic extends SearchDelegate{
TopicRepository _fetchTopic = TopicRepository();
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(onPressed: (){
        query = "";
      }, icon: Icon(Icons.close))
    ];
  }
@override
String get searchFieldLabel => 'Topic name';
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
      child: FutureBuilder<List<Topic>?>(
          future: _fetchTopic.getAllTopic(query:  query),
          builder: (context, snapshot) {
            var data = snapshot.data;
            if(!snapshot.hasData){
              return Center(child: CircularProgressIndicator(),);
            }
            return ListView.builder(
              itemCount: data?.length?? 0,
              itemBuilder: ( context,  index) {
                return TopicCard(
                  topic: data![index],
                  onPress: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailTopicCard(
                              topic: data[index],
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