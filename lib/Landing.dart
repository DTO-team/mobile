import 'package:capstone_management_dto/Widget/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Provider/app_user.dart';
import 'Screens/SignIn_screen.dart';
import 'Screens/main_screen/home_screen.dart';
class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appUser = context.watch<AppUser>().isSignedIn;
    print(appUser);
    return appUser ? BottomNavBar() : SignInPage();
    //return BottomNavBar();
  }
}
