import 'package:flutter/material.dart';

import '../Provider/app_user.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Amplify Auth Demo'),
        actions: [
          TextButton(
            onPressed: () => context.read<AppUser>().signOut(),
            child: Text(
              'Logout',
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}