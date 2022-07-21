import 'package:capstone_management/constant/color.dart';
import 'package:capstone_management/modal/semesters.dart';
import 'package:capstone_management/modal/topic.dart';
import 'package:capstone_management/provider/semester_provider.dart';
import 'package:capstone_management/repository/topic_repository.dart';
import 'package:capstone_management/widget/topic_page/detail_topic_card.dart';
import 'package:capstone_management/widget/topic_page/topic_card.dart';
import 'package:capstone_management/widget/topic_page/topic_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TopicPage extends StatefulWidget {
  const TopicPage({Key? key}) : super(key: key);

  @override
  State<TopicPage> createState() => _TopicPageState();
}

class _TopicPageState extends State<TopicPage> {
  var isLoaded = false;
  var isDescending = false;
  late Future<List<Topic>?>? dataFuture;
  Semester? currentSemester;

  @override
  void initState() {
    super.initState();
    setState(() {
      currentSemester = Provider.of<SemestersProvider>(context, listen: false).currentSemester;
      dataFuture = TopicRepository().getAllTopic(currentSemester);
    });
  }

 

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: whiteSoft,
        centerTitle: true,
        title: Text(
          'Topic',
          style: TextStyle(
              color: primary,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w600,
              fontSize: 25),
        ),
        actions: [
          IconButton(
              onPressed: () {
                showSearch(context: context, delegate: Search_Topic());
              },
              icon: Icon(
                Icons.search,
                color: black,
              )),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: (){
         return Future(()async{
           await Future.delayed(Duration(seconds: 1));
            setState(() {
              dataFuture = TopicRepository().getAllTopic(currentSemester);
            });
          });
        },
        child: Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(3, 3), // changes position of shadow
            ),
          ], color: whiteSoft, borderRadius: BorderRadius.circular(5)),
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextButton.icon(
                  onPressed: () => setState(() => isDescending = !isDescending),
                  icon: RotatedBox(
                      quarterTurns: 1, child: Icon(Icons.compare_arrows_rounded)),
                  label: Text(isDescending ? 'Z-A' : 'A-Z')),
              Expanded(
                child: FutureBuilder<List<Topic>?>(
                    future: dataFuture,
                    builder: (context, snapshot) {
                      var data = snapshot.data;
                      if (!snapshot.hasData) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if(data?.length == 0){
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (snapshot.hasError) {
                        print(snapshot.error);
                      }
                      return ListView.builder(
                        itemCount: data?.length ?? 0,
                        itemBuilder: (context, index) {
                        final sort = data
                          ?..sort((a, b) => isDescending
                                ? b.topicName!.compareTo(a.topicName!)
                                : a.topicName!.compareTo(b.topicName!));
                          return TopicCard(
                            topic: sort![index],
                            onPress: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailTopicCard(
                                            topic: data![index],
                                          )));
                            },
                          );
                        },
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
