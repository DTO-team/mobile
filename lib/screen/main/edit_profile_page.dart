import 'package:capstone_management/button/button_type.dart';
import 'package:capstone_management/button/sign_in_button.dart';
import 'package:capstone_management/modal/lecturer.dart';
import 'package:capstone_management/provider/app_user_provider.dart';
import 'package:capstone_management/constant/color.dart';
import 'package:capstone_management/repository/lecturer_repository.dart';
import 'package:capstone_management/widget/profile_page/edit_user_info_tile.dart';
import 'package:capstone_management/widget/profile_page/user_info_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _formKey = GlobalKey<FormState>();
  final _repository = LecturerRepository();

  late Lecturer _appUser;

  @override
  void initState() {
    super.initState();
    setState(() {
      _appUser = Provider.of<AppUserProvider>(context, listen: false).appUser!;
    });
  }

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
        leading: const BackButton(
          color: kTitleTextColor,
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          // Section 1 - Profile Picture Wrapper
          Container(
            color: primary,
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: GestureDetector(
              onVerticalDragUpdate: (details) {},
              onHorizontalDragUpdate: (details) {
                if (details.delta.direction <= 0) {
                  Navigator.pop(context);
                }
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
                      image: (_appUser.avatarUrl != null)
                          ? DecorationImage(
                              image: NetworkImage(_appUser.avatarUrl!))
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
          Form(
            key: _formKey,
            child: Container(
              margin: const EdgeInsets.only(top: 24),
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UserInfoTile(
                      margin: const EdgeInsets.only(bottom: 16),
                      label: 'Username',
                      value: _appUser.userName,
                      padding: const EdgeInsets.all(0),
                      valueBackground: primaryExtraSoft),
                  UserInfoTile(
                      margin: const EdgeInsets.only(bottom: 16),
                      label: 'Email',
                      value: _appUser.email,
                      padding: const EdgeInsets.all(0),
                      valueBackground: primaryExtraSoft),
                  EditUserInfoTile(
                    margin: const EdgeInsets.only(bottom: 16),
                    label: 'Full name',
                    value: _appUser.fullName,
                    padding: const EdgeInsets.all(0),
                    valueBackground: primaryExtraSoft,
                    validator: (value) {
                      if (value != null && value.isNotEmpty) {
                        return null;
                      } else {
                        return 'Full name cannot be empty';
                      }
                    },
                    onSaved: (value) =>
                        setState(() => _appUser.fullName = value!),
                  ),
                  UserInfoTile(
                    margin: const EdgeInsets.only(bottom: 16),
                    label: 'Department',
                    value: _appUser.department.name,
                    valueBackground: primaryExtraSoft,
                    padding: const EdgeInsets.all(0),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState?.save();
                          _repository
                              .updateLecturer(_appUser.id, _appUser)
                              .then((value) => Provider.of<AppUserProvider>(
                                      context,
                                      listen: false)
                                  .appUser = value);
                        }
                      },
                      child: const Text('Save'),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
          ),
          SignInButton(
            button: ButtonType.signOut,
            onPressed: () => context.read<AppUserProvider>().signOut(),
            color: secondary,
            text: 'Log out',
            textColor: Colors.black87,
          ),
        ],
      ),
    );
  }
}
