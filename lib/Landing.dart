import 'package:capstone_management_dto/Widget/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Provider/app_user.dart';
import 'Screens/SignIn_screen.dart';
class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    final appUser = context.watch<AppUser>().isSignedIn;
    print(appUser);
   return appUser ? const BottomNavBar() : SignInPage();
  //  return BottomNavBar();

  }
}
