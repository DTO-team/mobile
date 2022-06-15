import 'package:capstone_management/modal/lecturer.dart';
import 'package:capstone_management/modal/user.dart';
import 'package:capstone_management/service/remote_service.dart';
import 'package:flutter/material.dart';

class ProjectPage extends StatefulWidget {
  const ProjectPage({Key? key}) : super(key: key);

  @override
  State<ProjectPage> createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
  List<User>? users;
  List<Lecturer>? lecturers;
  var isLoaded = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUser();
    getLec();
  }

  getLec() async {
    lecturers = await Remote().getLectures();
    if (users != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  getUser() async {
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
      body: const Text('Project'),
      // Visibility(
      //   visible: isLoaded,
      //   replacement: const Center(
      //     child:  CircularProgressIndicator(),
      //   ),
      //
      //   child: ListView.builder(
      //       itemCount: users?.length,
      //       itemBuilder: (context, index)
      //       { return Container(
      //         child: Text(users![index].userName),
      //       );
      //       }),
      //
      //
      // ),
    );
  }
}
