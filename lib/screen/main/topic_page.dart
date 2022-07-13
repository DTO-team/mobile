import 'package:capstone_management/constant/color.dart';
import 'package:capstone_management/constant/text_style.dart';
import 'package:capstone_management/modal/topic.dart';
import 'package:capstone_management/repository/topic_repository.dart';
import 'package:capstone_management/widget/topic_page/detail_topic_card.dart';
import 'package:capstone_management/widget/topic_page/topic_card.dart';
import 'package:flutter/material.dart';

import '../../widget/topic_page/topic_search_bar.dart';

class TopicPage extends StatefulWidget {
  const TopicPage({Key? key}) : super(key: key);

  @override
  State<TopicPage> createState() => _TopicPageState();
}

class _TopicPageState extends State<TopicPage> {
  List<Topic>? _topics;
  var isLoaded = false;
  var isDescending = false;
  TopicRepository _fetchTopic = TopicRepository();

  @override
  void initState() {
    super.initState();
    loadTopics();
  }

  Future<void> loadTopics() async {
    _topics = await TopicRepository().getAllTopic();
    if (_topics != null) {
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
            title: Text('Topic', style: TextStyle(color: primary, fontFamily: 'Roboto', fontWeight: FontWeight.w600, fontSize: 25),),
            actions: [
              IconButton(
                  onPressed: (){
                    showSearch(context: context, delegate: Search_Topic());
                  },
                  icon: Icon(Icons.search, color:  black,)),
            ],
          ),
      body: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset:  Offset(3, 3), // changes position of shadow
          ),
        ], color: whiteSoft, borderRadius: BorderRadius.circular(5)),
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextButton.icon(onPressed:()=> setState(()
            => isDescending = !isDescending), icon: RotatedBox(quarterTurns: 1,
                child: Icon(Icons.compare_arrows_rounded)), label: Text(isDescending ? 'Z-A' : 'A-Z')),
            Expanded(
              child: FutureBuilder<List<Topic>?>(
                future: _fetchTopic.getAllTopic(),
                builder: (context, snapshot) {
                  var data = snapshot.data;
                  if(!snapshot.hasData){
                    return Center(child: CircularProgressIndicator(),);
                  }
                  if(snapshot.hasError){
                    print(snapshot.error);
                  }
                  return ListView.builder(
                    itemCount: data?.length?? 0,
                    itemBuilder: ( context,  index) {
                      final sort = data?..sort((a, b) => isDescending ? b.topicName!.compareTo(a.topicName!) : a.topicName!.compareTo(b.topicName!));
                      final sortedTopic = sort![index];
                      return TopicCard(
                        topic: sortedTopic,
                        onPress: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailTopicCard(
                                        topic: sortedTopic,
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
    ));
  }
}
