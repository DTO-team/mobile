import 'package:capstone_management/provider/app_user_provider.dart';
import 'package:capstone_management/screen/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'widget/nav_bar/bottom_nav_bar.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return context.watch<AppUserProvider>().isSignedIn
        ? const BottomNavBar()
        : const SignInPage();
  }
}
