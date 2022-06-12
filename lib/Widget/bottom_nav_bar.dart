import 'package:capstone_management_dto/Screens/main_screen/topic_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

import '../Screens/main_screen/home_screen.dart';
import '../Screens/main_screen/profile_screen.dart';
import '../Screens/main_screen/project_screen.dart';
import 'color.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedItem = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedItem = index;
    });
  }

  static const List<Widget> _pages = <Widget>[
    HomePage(),
    ProjectPage(),
    TopicPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: _pages.elementAt(_selectedItem),
      ),
      //---------------------------------------------------------
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      elevation: 0,
      iconSize: 17,
      backgroundColor: primary,
      ///Selected color
      selectedItemColor: secondary,
      ///Unselected color
      showUnselectedLabels: true,
      unselectedItemColor: Colors.white,
      type: BottomNavigationBarType.fixed,

      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          backgroundColor: kTextColor,
          icon: ImageIcon(Svg('assets/home.svg')), label: 'Home',),
        BottomNavigationBarItem(
            backgroundColor: kTextColor,
            icon: ImageIcon(Svg('assets/project.svg')), label: 'Project'),
        BottomNavigationBarItem(
            backgroundColor: kTextColor,
            icon: ImageIcon(Svg('assets/topic.svg')), label: 'Topic'),
        BottomNavigationBarItem(
            backgroundColor: kTextColor,
            icon: ImageIcon(Svg('assets/user.svg')), label: 'Profile'),
      ],
      currentIndex: _selectedItem,
      onTap: _onItemTapped,
    );
  }
}
