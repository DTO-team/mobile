import 'package:flutter/material.dart';

import 'widget/nav_bar/bottom_nav_bar.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    //   final appUser = context.watch<AppUser>().isSignedIn;
    //   print(appUser);
    //  return appUser ? const BottomNavBar() : SignInPage();
    return const BottomNavBar();
  }
}
