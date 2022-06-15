import 'package:capstone_management/modal/lecturer.dart';
import 'package:capstone_management/modal/user.dart';
import 'package:capstone_management/service/remote_service.dart';
import 'package:flutter/material.dart';

class DemoAPI extends StatefulWidget {
  const DemoAPI({Key? key}) : super(key: key);

  @override
  State<DemoAPI> createState() => _DemoAPIState();
}

class _DemoAPIState extends State<DemoAPI> {
  List<User>? users;
  List<Lecturer>? lecs;

  var isLoaded = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDataUser();
    getDataLecturer();
    print(isLoaded);
  }

  getDataLecturer() async {
    lecs = await Remote().getLectures();
    if (lecs != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  getDataUser() async {
    users = await Remote().getUsers();
    if (users != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Demo API'),
      ),
      body: Visibility(
        visible: isLoaded,
        replacement: const Center(
          child: CircularProgressIndicator(),
        ),
        child:  ListView.builder(
            itemCount: users?.length,
            itemBuilder: (context, index) {
              return Text(users![index].fullName);
            }),
      ),
    );
  }
}
