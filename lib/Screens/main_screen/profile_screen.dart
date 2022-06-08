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
      appBar: AppBar(
        title: Text('Profile'),
        centerTitle: true,
      ),
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(child:
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
              color: Colors.grey,
              thickness: 1,
            ),

            // space giua cac item
            SizedBox(height: 10),
            Text('Name',
                style: TextStyle(
                    color: kTeamColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),

            SizedBox(height: 10),
            Text(
              'Super Lemonade',
              style: TextStyle(letterSpacing: 2, color: kTeamColor),
            ),
            SizedBox(height: 10),

            Row(
              children: <Widget>[
                Icon(
                  Icons.email,
                  color: secondary,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'My Email',
                  style: TextStyle(color: kTeamColor, letterSpacing: 2),
                )
              ],
            )
          ],
        ),
      ),
      ),
      // item o trong ko dinh vao appbar hay trai duoi phai

    );
  }
}
