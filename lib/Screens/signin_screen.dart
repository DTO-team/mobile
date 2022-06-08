import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:capstone_management_dto/Buttons/Button_Type.dart';
import 'package:capstone_management_dto/Buttons/Sign_in_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider/app_user.dart';
class SignInPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildContent(context),
      backgroundColor: Colors.grey[200],
    );
  }

  Widget _buildContent(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            child: Text(
              'Sign In',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w600,
              ),
            ),
            height: 50.0,
          ),
          SizedBox(
            height: 48.0,
          ),
          SignInButton(
            button: ButtonType.Google,
            onPressed: () =>
                context.read<AppUser>().signIn(AuthProvider.google),
            color: Colors.white,
            text: 'Sign in with Google',
            textColor: Colors.black87,
          ),
          SizedBox(
            height: 8.0,

          ),

          SizedBox(
            height: 8.0,
          ),
       
        ],
      ),
    );
  }
}