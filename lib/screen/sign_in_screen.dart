import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:capstone_management/button/button_type.dart';
import 'package:capstone_management/button/sign_in_button.dart';
import 'package:capstone_management/provider/app_user_provider.dart';
import 'package:capstone_management/provider/semester_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildContent(context),
      backgroundColor: Colors.grey[200],
    );
  }

  Widget _buildContent(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset('assets/fpt_logo.png'),
          // const SizedBox(
          //   height: 70,
          //   child: Text(
          //     'Capstone On Going Management',
          //     textAlign: TextAlign.center,
          //     style: TextStyle(
          //       fontSize: 32,
          //       fontWeight: FontWeight.w600,
          //     ),
          //   ),
          // ),
          const SizedBox(
            height: 48.0,
          ),
          SignInButton(
            button: ButtonType.google,
            onPressed: () async =>
                await context.read<AppUserProvider>().signIn(AuthProvider.google),
            color: Colors.white,
            text: 'Sign in with Google',
            textColor: Colors.black87,
          ),
          const SizedBox(
            height: 8.0,
          ),
        ],
      ),
    );
  }
}
