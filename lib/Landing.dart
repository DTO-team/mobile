import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Provider/app_user.dart';
import 'Screens/SignIn_screen.dart';
import 'Screens/home_screen.dart';
class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appUser = context.watch<AppUser>().isSignedIn;
    print(appUser);
    return appUser ? HomePage() : SignInPage();
  }
}
