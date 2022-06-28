import 'package:capstone_management/button/button_type.dart';
import 'package:capstone_management/button/sign_in_button.dart';
import 'package:capstone_management/modal/lecturer.dart';
import 'package:capstone_management/provider/app_user_provider.dart';
import 'package:capstone_management/constant/color.dart';
import 'package:capstone_management/screen/main/edit_profile_page.dart';
import 'package:capstone_management/widget/profile_page/user_info_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Lecturer appUser = context.watch<AppUserProvider>().appUser!;

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
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const EditProfilePage()));
            },
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
              onTap: () {},
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
                      image: (appUser.avatarUrl != null)
                          ? DecorationImage(
                              image: NetworkImage(appUser.avatarUrl!))
                          : const DecorationImage(
                              image: AssetImage('assets/chamb.png')),
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
                    label: 'Username',
                    value: appUser.userName,
                    padding: const EdgeInsets.all(0),
                    valueBackground: primaryExtraSoft),
                UserInfoTile(
                    margin: const EdgeInsets.only(bottom: 16),
                    label: 'Email',
                    value: appUser.email,
                    padding: const EdgeInsets.all(0),
                    valueBackground: primaryExtraSoft),
                UserInfoTile(
                    margin: const EdgeInsets.only(bottom: 16),
                    label: 'Full Name',
                    value: appUser.fullName,
                    padding: const EdgeInsets.all(0),
                    valueBackground: primaryExtraSoft),
                UserInfoTile(
                  margin: const EdgeInsets.only(bottom: 16),
                  label: 'Department',
                  value: appUser.department.name,
                  valueBackground: primaryExtraSoft,
                  padding: const EdgeInsets.all(0),
                ),
                const SizedBox(
                  height: 15,
                ),
                SignInButton(
                  button: ButtonType.signOut,
                  onPressed: () => context.read<AppUserProvider>().signOut(),
                  color: secondary,
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
