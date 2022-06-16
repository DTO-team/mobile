import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'landing.dart';
import 'provider/aws_cognito_provider.dart';
import 'widget/color.dart';

void main() => runApp(const CapstoneOngoingApp());

class CapstoneOngoingApp extends StatelessWidget {
  const CapstoneOngoingApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => AWSCognitoProvider(),
        ),
      ],
      child: MaterialApp(
          title: 'Amplify Auth Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSwatch().copyWith(
              primary: primary,
            ),
          ),
          home: const LandingPage()),
    );
  }
}
