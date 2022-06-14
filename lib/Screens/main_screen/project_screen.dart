import 'package:capstone_management_dto/Modals/lecture.dart';
import 'package:capstone_management_dto/Modals/User.dart';
import 'package:capstone_management_dto/Services/remote_service.dart';
import 'package:capstone_management_dto/Widget/color.dart';
import 'package:flutter/material.dart';


class ProjectPage extends StatefulWidget {
  const ProjectPage({Key? key}) : super(key: key);

  @override
  State<ProjectPage> createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
  List<User>? users;
  List<Lecturer>? lecturers;
  var isLoaded =false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUser();
    getLec();
  }

  getLec() async{
    lecturers = await Remote().getLectures();
    if(users != null){
      setState(() {
        isLoaded = true;
      });
    }
  }


  getUser()async{
    users = await Remote().getUsers();
    if(users != null){
      setState(() {
        isLoaded = true;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Demo API'),
      ),
      body:
        Text('Project'),
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
