import 'package:capstone_management/widget/color.dart';
import 'package:flutter/material.dart';

class TeamPage extends StatelessWidget {
  const TeamPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('Member List'),
            SizedBox(height: 5,),
            Card(
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(44),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color:  Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 7,
                      offset: Offset(0,3),
                    )
                  ],
                  color: blue,
                ),
                child: Text('aaa'),
              ),
            ),
          ],
        ),
      )

    );
  }
}
