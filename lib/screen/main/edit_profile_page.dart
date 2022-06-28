import 'package:capstone_management/button/button_type.dart';
import 'package:capstone_management/button/sign_in_button.dart';
import 'package:capstone_management/modal/lecturer.dart';
import 'package:capstone_management/provider/app_user_provider.dart';
import 'package:capstone_management/constant/color.dart';
import 'package:capstone_management/repository/lecturer_repository.dart';
import 'package:capstone_management/widget/profile_page/edit_user_info_tile.dart';
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
  final LecturerRepository repository = LecturerRepository();

  late Lecturer appUser;

  @override
  Widget build(BuildContext context) {
    appUser = context.watch<AppUserProvider>().appUser!;

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
          Form(
            key: _formKey,
            child: Container(
              margin: const EdgeInsets.only(top: 24),
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  EditUserInfoTile(
                    margin: const EdgeInsets.only(bottom: 16),
                    label: 'Full name',
                    value: appUser.fullName,
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
                        setState(() => appUser.fullName = value!),
                  ),
                  EditUserInfoTile(
                    margin: const EdgeInsets.only(bottom: 16),
                    label: 'Department',
                    value: appUser.department.name,
                    valueBackground: primaryExtraSoft,
                    padding: const EdgeInsets.all(0),
                  ),
                  TextButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState?.save();
                        repository.updateLecturer(appUser.id, appUser).then(
                            (value) => Provider.of<AppUserProvider>(context,
                                    listen: false)
                                .appUser = value);
                      }
                    },
                    child: const Text('Save'),
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
