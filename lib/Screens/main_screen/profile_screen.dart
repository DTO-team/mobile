import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../Buttons/Button_Type.dart';
import '../../Buttons/Sign_in_button.dart';
import '../../Provider/app_user.dart';
import '../../Widget/UserInfoTile.dart';
import '../../Widget/color.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        backgroundColor: primary,
        elevation: 0,
        centerTitle: true,
        title: Text('My Profile', style: TextStyle(fontFamily: 'inter', fontWeight: FontWeight.w400, fontSize: 16)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              'Edit',
              style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600),
            ),
            style: TextButton.styleFrom(primary: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100))),
          ),
        ],
      ),
      body: ListView(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        children: [
          // Section 1 - Profile Picture Wrapper
          Container(
            color: primary,
            padding: EdgeInsets.symmetric(vertical: 24),
            child: GestureDetector(
              onTap: () {
                print('Code to open file manager');
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 130,
                    height: 130,
                    margin: EdgeInsets.only(bottom: 15),
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(100),
                      // Profile Picture
                      image: DecorationImage(image: AssetImage('assets/chamb.png'), fit: BoxFit.cover),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Change Profile Picture', style: TextStyle(fontFamily: 'inter', fontWeight: FontWeight.w600, color: Colors.white)),
                      SizedBox(width: 8),
                      SvgPicture.asset('assets/camera.svg', color: Colors.white),
                    ],
                  )
                ],
              ),
            ),
          ),
          // Section 2 - User Info Wrapper
          Container(
            margin: EdgeInsets.only(top: 24),
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UserInfoTile(
                  margin: EdgeInsets.only(bottom: 16),
                  label: 'Email',
                  value: 'chauhclse150664@fpt.edu.vn', padding: EdgeInsets.all(0),valueBackground: Colors.white
                ),
                UserInfoTile(
                  margin: EdgeInsets.only(bottom: 16),
                  label: 'Full Name',
                  value: 'Reina Zahra Azizah', padding:EdgeInsets.all(0),valueBackground: Colors.white
                ),
                UserInfoTile(
                  margin: EdgeInsets.only(bottom: 16),
                  label: 'Subscription Type',
                  value: 'Premium Subscription',
                  valueBackground: Colors.white, padding: EdgeInsets.all(0),
                ),
                UserInfoTile(
                  margin: EdgeInsets.only(bottom: 16),
                  label: 'Subscription Time',
                  value: 'Until 22 Oct 2021', valueBackground: Colors.white, padding: EdgeInsets.all(0),
                ),
                SizedBox(
                  height: 15,
                ),
                SignInButton(
                  button: ButtonType.Signout,
                  onPressed: () =>
                      context.read<AppUser>().signOut(),
                  color: AppColor.secondary,
                  text: 'Log out',
                  textColor: Colors.black87,
                ),
                SizedBox(
                  height: 15,
                ),

              ],
            ),
          )
        ],
      ),
    );
  }
}