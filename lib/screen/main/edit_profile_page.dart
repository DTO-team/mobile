import 'dart:io';

import 'package:capstone_management/constant/color.dart';
import 'package:capstone_management/modal/lecturer.dart';
import 'package:capstone_management/provider/app_user_provider.dart';
import 'package:capstone_management/repository/lecturer_repository.dart';
import 'package:capstone_management/screen/main/profile_page.dart';
import 'package:capstone_management/widget/profile_page/edit_user_info_tile.dart';
import 'package:capstone_management/widget/profile_page/user_info_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  static const _defaultImage = AssetImage('assets/chamb.png');

  final _formKey = GlobalKey<FormState>();
  final _repository = LecturerRepository();
  final _picker = ImagePicker();

  late Lecturer _appUser;
  ImageProvider _avatarProvider = _defaultImage;

  @override
  void initState() {
    super.initState();
    setState(() {
      _appUser = Provider.of<AppUserProvider>(context, listen: false).appUser!;
      if (_appUser.avatarUrl != null) {
        _avatarProvider = NetworkImage(_appUser.avatarUrl!);
      }
    });
  }


  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragUpdate: (details) {},
      onHorizontalDragUpdate: (details) {
        if (details.delta.direction <= 0) {
          Navigator.pop(context);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: whiteSoft,
          centerTitle: true,
          title: const Text(
            'My Profile',
            style: TextStyle(
                color: black,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w600,
                fontSize: 22),
          ),
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
                    backgroundImage: _avatarProvider,
                  ),
                  Positioned(
                    bottom: 10.0,
                    right: 10.0,
                    child: InkWell(
                      onTap: () => showBottomSheet(
                          context: context,
                          builder: (builder) => bottomSheet()),
                      child: const Icon(
                        Icons.camera_alt,
                        color: Colors.white,
                        size: 23.0,
                      ),
                    ),
                  ),
                ]),
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
                        value: _appUser.userName ?? '',
                        padding: const EdgeInsets.all(0),
                        valueBackground: primaryExtraSoft),
                    UserInfoTile(
                        margin: const EdgeInsets.only(bottom: 16),
                        label: 'Email',
                        value: _appUser.email ?? '',
                        padding: const EdgeInsets.all(0),
                        valueBackground: primaryExtraSoft),
                    EditUserInfoTile(
                      margin: const EdgeInsets.only(bottom: 16),
                      label: 'Full name',
                      value: _appUser.fullName ?? '',
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
                                    .appUser = value)
                                .then((value) =>
                                    EasyLoading.showSuccess('Save success!'))
                                .onError((error, stackTrace) =>
                                    EasyLoading.showError('Save fail!'));
                          }
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const ProfilePage())).then((value) =>
                              setState(() => _appUser =
                                  Provider.of<AppUserProvider>(context,
                                          listen: false)
                                      .appUser!));
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
          ],
        ),
      ),
    );
  }

  Widget bottomSheet() {
    return Container(
        height: 100.0,
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Column(
          children: [
            const Text("Choose profile photo",
                style: TextStyle(fontSize: 20.0)),
            const SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                    onPressed: () => setPhoto(ImageSource.camera),
                    icon: const Icon(Icons.camera),
                    label: const Text('Camera')),
                ElevatedButton.icon(
                    onPressed: () => setPhoto(ImageSource.gallery),
                    icon: const Icon(Icons.image),
                    label: const Text('Gallery')),
              ],
            )
          ],
        ));
  }

  void setPhoto(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() => _avatarProvider = FileImage(File(pickedFile.path)));
    }
  }

}
