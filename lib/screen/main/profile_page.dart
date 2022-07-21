import 'package:capstone_management/button/button_type.dart';
import 'package:capstone_management/button/sign_in_button.dart';
import 'package:capstone_management/constant/color.dart';
import 'package:capstone_management/modal/lecturer.dart';
import 'package:capstone_management/provider/app_user_provider.dart';
import 'package:capstone_management/screen/main/edit_profile_page.dart';
import 'package:capstone_management/widget/profile_page/user_info_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ProfilePage();
}

class _ProfilePage extends State<ProfilePage> {
  static const _defaultImage = AssetImage('assets/avatar.jpg');

  late Lecturer _appUser;
  @override
  void initState() {
    super.initState();
    setState(() => _appUser =
        Provider.of<AppUserProvider>(context, listen: false).appUser!);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: whiteSoft,
          centerTitle: true,
          title: Text('My Profile', style: TextStyle(color: primary, fontFamily: 'Roboto', fontWeight: FontWeight.w600, fontSize: 25),),

          actions: [
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const EditProfilePage())).then(
                    (value) => setState(() => _appUser =
                        Provider.of<AppUserProvider>(context, listen: false)
                            .appUser!));
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
              child: Center(
                child: Stack(children: <Widget>[
                  CircleAvatar(
                    radius: 70.0,
                    backgroundImage: _getAvatarProvider(),
                  ),
                ]),
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
                      value: _appUser.userName ?? '',
                      padding: const EdgeInsets.all(0),
                      valueBackground: primaryExtraSoft),
                  UserInfoTile(
                      margin: const EdgeInsets.only(bottom: 16),
                      label: 'Email',
                      value: _appUser.email ?? '',
                      padding: const EdgeInsets.all(0),
                      valueBackground: primaryExtraSoft),
                  UserInfoTile(
                      margin: const EdgeInsets.only(bottom: 16),
                      label: 'Full Name',
                      value: _appUser.fullName ?? '',
                      padding: const EdgeInsets.all(0),
                      valueBackground: primaryExtraSoft),
                  UserInfoTile(
                    margin: const EdgeInsets.only(bottom: 16),
                    label: 'Department',
                    value: _appUser.department.name,
                    valueBackground: primaryExtraSoft,
                    padding: const EdgeInsets.all(0),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SignInButton(
                    button: ButtonType.signOut,
                    onPressed: () => context.read<AppUserProvider>().signOut(),
                    color: primary,
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
      ),
    );
  }

  ImageProvider _getAvatarProvider() {
    if (_appUser.avatarUrl == null) {
      return _defaultImage;
    }
    return NetworkImage(_appUser.avatarUrl!);
  }
}
