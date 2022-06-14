import 'package:capstone_management_dto/Modals/lecture.dart';
import 'package:capstone_management_dto/Modals/User.dart';
import 'package:capstone_management_dto/Services/remote_service.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
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
  void initState(){
    // TODO: implement initState
    super.initState();
    getDataUser();
    getDataLecturer();
    print(isLoaded);
  }
   getDataLecturer() async{
     lecs = await Remote().getLectures();
     if(lecs != null){
       setState(() {
         isLoaded = true;
       });
     }

   }

  getDataUser() async{
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
      body: Visibility(
        visible: isLoaded,
        child: ListView.builder(
            itemCount: users?.length,
            itemBuilder: (context, index)
            { return Container(
              child: Text(users![index].fullName),
            );

            }),
        replacement: Center(
          child:  CircularProgressIndicator(),
        ),
      ),
    );
  }

}
