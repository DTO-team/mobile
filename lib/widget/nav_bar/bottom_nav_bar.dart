import 'package:capstone_management/screen/main/home_page.dart';
import 'package:capstone_management/screen/main/profile_page.dart';
import 'package:capstone_management/screen/main/project_page.dart';
import 'package:capstone_management/screen/main/topic_page.dart';
import 'package:capstone_management/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);
  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedItem = 0;
  final List<GlobalKey<NavigatorState>> _navigatorKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>()
  ];


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
  Map<String, WidgetBuilder> _routeBuilders(BuildContext context, int index) {
    return {
      '/': (context) {
        return [
          HomePage(),
          ProjectPage(),
          TopicPage(),
          ProfilePage()
        ].elementAt(index);
      },
    };
  }
  Widget _buildOffstageNavigator(int index) {
    var routeBuilders = _routeBuilders(context, index);

    return Offstage(
      offstage: _selectedItem != index,
      child: Navigator(
        onGenerateRoute: (routeSettings) {
          return MaterialPageRoute(
            builder: (context) => routeBuilders[routeSettings.name!]!(context),
          );
        },
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final isFirstRouteInCurrentTab =
        !await _navigatorKeys[_selectedItem].currentState!.maybePop();

        // let system handle back button if we're on the first route
        return isFirstRouteInCurrentTab;
      },
      child: Scaffold(
        body: Stack(
          children: [
            _buildOffstageNavigator(0),
            _buildOffstageNavigator(1),
            _buildOffstageNavigator(2),
            _buildOffstageNavigator(3),

          ],
        ),
        //---------------------------------------------------------
        bottomNavigationBar: buildBottomNavigationBar(),
      ),
    );
  }

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: _selectedItem,
      onTap: _onItemTapped,
      elevation: 10,
      iconSize: 17,
      backgroundColor: whiteSoft,

      ///Selected color
      selectedItemColor: primary,

      ///Unselected color
      showUnselectedLabels: true,
      unselectedItemColor: Colors.black,
      type: BottomNavigationBarType.fixed,

      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          backgroundColor: kTextColor,
          icon: ImageIcon(Svg('assets/home.svg')),
          label: 'Home',
        ),
        BottomNavigationBarItem(
            backgroundColor: kTextColor,
            icon: ImageIcon(Svg('assets/project.svg')),
            label: 'Project'),
        BottomNavigationBarItem(
            backgroundColor: kTextColor,
            icon: ImageIcon(Svg('assets/topic.svg')),
            label: 'Topic'),
        BottomNavigationBarItem(
            backgroundColor: kTextColor,
            icon: ImageIcon(Svg('assets/user.svg')),
            label: 'Profile'),
      ],

    );
  }
}
