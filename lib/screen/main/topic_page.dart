import 'package:capstone_management/modal/lecturer.dart';
import 'package:capstone_management/modal/topic.dart';
import 'package:capstone_management/repository/topic_repository.dart';
import 'package:capstone_management/constant/color.dart';
import 'package:capstone_management/widget/search_bar.dart';
import 'package:flutter/material.dart';

import '../../widget/topic_page/detail_topic_card.dart';
import '../../widget/topic_page/topic_card.dart';

class TopicPage extends StatefulWidget {
  const TopicPage({Key? key}) : super(key: key);

  @override
  State<TopicPage> createState() => _TopicPageState();
}

class _TopicPageState extends State<TopicPage> {
   List<Topic>? _topics;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    loadTopics();

    }

  Future<void> loadTopics() async {
    _topics = await TopicRepository().getAllTopic();
    if(_topics != null){
      setState(() {
        isLoaded = true;
      });
      print(isLoaded);
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
              'Topic',
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
              return Visibility(
                replacement: const Center(
                  child: CircularProgressIndicator(),
                ),
                visible: isLoaded,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TopicCard(
                    topic: _topics![index],
                    onPress: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailTopicCard(topic: _topics![index],)));
                    },
                  ),
                ),
              );
            },
            childCount: _topics?.length ?? 0,
          ))
        ],
      ),
    );
  }
}
