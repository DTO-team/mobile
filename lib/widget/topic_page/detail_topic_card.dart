import 'package:flutter/material.dart';

class DetailTopicCard extends StatelessWidget {
  const DetailTopicCard({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          'topic detail',
        ),
      ),

    );
  }
}
