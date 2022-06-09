import 'package:capstone_management_dto/Widget/color.dart';
import 'package:flutter/material.dart';
class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text('Profile'),
        centerTitle: true,
        backgroundColor: Colors.grey[850],
        //shadow
        elevation: 0,
      ),

      body:
      // item o trong ko dinh vao appbar hay trai duoi phai
      Padding(
        padding: EdgeInsets.fromLTRB(30, 40, 30, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/chamb.png'),
                radius: 60,
              ),
            ),
            Divider(
              height: 90,
              color: Colors.yellowAccent,
              thickness: 1,
            ),

            // space giua cac item
            SizedBox(height: 10),
            Text('Name',
                style: TextStyle(
                    color: Colors.amberAccent,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text(
              'Chamber',
              style: TextStyle(letterSpacing: 2, color: Colors.amber),
            ),
            SizedBox(height: 10),

            SizedBox(height: 10),
            Text(
              'Super Lemonade',
              style: TextStyle(letterSpacing: 2, color: Colors.amber),
            ),
            SizedBox(height: 10),

            Row(
              children: <Widget>[
                Icon(
                  Icons.email,
                  color: Colors.green,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'My Email',
                  style: TextStyle(color: Colors.amber, letterSpacing: 2),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
