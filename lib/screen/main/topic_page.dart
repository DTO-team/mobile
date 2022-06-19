import 'dart:io';

import 'package:capstone_management/common/http_client.dart';
import 'package:capstone_management/widget/color.dart';
import 'package:capstone_management/widget/search_bar.dart';
import 'package:capstone_management/widget/topic_page/detail_topic_card.dart';
import 'package:capstone_management/widget/topic_page/topic_card.dart';
import 'package:flutter/material.dart';
import '../../modal/topic.dart';
import '../../service/remote_service.dart';

class TopicPage extends StatefulWidget {
  const TopicPage({Key? key}) : super(key: key);

  @override
  State<TopicPage> createState() => _TopicPageState();
}

class _TopicPageState extends State<TopicPage> {

  List<Topic>? topics;
  var isLoaded = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTopics();
  }

  getTopics() async{
    topics = await Remote().getAllTopic();
    if(topics != null){
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final httpClient = HttpClient();
    final response = httpClient.post('/topics/list');
    response.then((value) => print(value));
   return Scaffold(
     body: CustomScrollView(
       slivers: [
         SliverAppBar(
           centerTitle: true,
           title: Text('Topic',style: TextStyle(color: primary),),
           floating: true,
           backgroundColor: whiteSoft,
           elevation: 0,
         ),
         SliverToBoxAdapter(
           child: SearchBar(routeTo: (){},)
         ),

         SliverList(delegate: SliverChildBuilderDelegate(
             (BuildContext context, int index){
               return Visibility(
                 replacement: Center( child: CircularProgressIndicator(),),
                 visible: isLoaded,
                 child: Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: TopicCard(topic: topics![index], onPress: () {  Navigator.push(context, MaterialPageRoute(
                       builder: (context) => DetailTopicCard()
                   )); },),
                 ),
               );
             }   ,     childCount: topics?.length,
         )
         )
       ],
     ),
   );
  }
}
