import 'package:capstone_management/button/button_type.dart';
import 'package:capstone_management/button/sign_in_button.dart';
import 'package:capstone_management/provider/aws_cognito_provider.dart';
import 'package:capstone_management/widget/color.dart';
import 'package:capstone_management/widget/profile_page/user_info_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
        ),
        backgroundColor: whiteSoft,
        elevation: 0,
        centerTitle: true,
        title: const Text('My Profile',
            style: TextStyle(
              color: kTitleTextColor,
                fontFamily: 'inter',
                fontWeight: FontWeight.w400,
                fontSize: 16)),
        ////return page
        // leading: IconButton(
        //   icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
        //   onPressed: () {
        //     Navigator.of(context).pop();
        //   },
        // ),
        actions: [
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
                primary: primary,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100))),
            child: const Text(
              'Edit',
              style: TextStyle(
                  color: kTitleTextColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          // Section 1 - Profile Picture Wrapper
          Container(
            color: primary,
            padding: const EdgeInsets.symmetric(vertical: 24),
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
                    margin: const EdgeInsets.only(bottom: 15),
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(100),
                      // Profile Picture
                      image: const DecorationImage(
                          image: AssetImage('assets/chamb.png'),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Change Profile Picture',
                          style: TextStyle(
                              fontFamily: 'inter',
                              fontWeight: FontWeight.w600,
                              color: Colors.white)),
                      const SizedBox(width: 8),
                      SvgPicture.asset('assets/camera.svg',
                          color: Colors.white),
                    ],
                  )
                ],
              ),
            ),
          ),
          // Section 2 - User Info Wrapper
          Container(
            margin: const EdgeInsets.only(top: 24),
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UserInfoTile(
                    margin: const EdgeInsets.only(bottom: 16),
                    label: 'Email',
                    value: 'chauhclse150664@fpt.edu.vn',
                    padding: const EdgeInsets.all(0),
                    valueBackground: primaryExtraSoft),
                UserInfoTile(
                    margin: const EdgeInsets.only(bottom: 16),
                    label: 'Full Name',
                    value: 'Hoang Cac Loan Chau',
                    padding: const EdgeInsets.all(0),
                    valueBackground: primaryExtraSoft),
                UserInfoTile(
                  margin: const EdgeInsets.only(bottom: 16),
                  label: 'Deparment Code',
                  value: 'SE150664',
                  valueBackground: primaryExtraSoft,
                  padding: const EdgeInsets.all(0),
                ),
                UserInfoTile(
                  margin: const EdgeInsets.only(bottom: 16),
                  label: 'DoB',
                  value: '07 04 2001',
                  valueBackground: primaryExtraSoft,
                  padding: const EdgeInsets.all(0),
                ),
                const SizedBox(
                  height: 15,
                ),
                SignInButton(
                  button: ButtonType.signOut,
                  onPressed: () => context.read<AWSCognitoProvider>().signOut(),
                  color: AppColor.secondary,
                  text: 'Log out',
                  textColor: Colors.black87,
                ),
                const SizedBox(
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
