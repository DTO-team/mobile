import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Landing.dart';
import 'Provider/app_user.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => AppUser(),
        ),
      ],
      child: MaterialApp(
        title: 'Amplify Auth Demo',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
        ),
        home: LandingPage(),
      ),
    );
  }
}