import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'constant/color.dart';
import 'landing.dart';
import 'provider/app_user_provider.dart';

void main() => runApp(const CapstoneOngoingApp());

class CapstoneOngoingApp extends StatelessWidget {
  const CapstoneOngoingApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => AppUserProvider(),
        ),
      ],
      child: MaterialApp(
          title: 'Capstone Ongoing',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSwatch().copyWith(
              primary: primary,
            ),
          ),
          home: const LandingPage()),
    );
  }
}
