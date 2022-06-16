import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:capstone_management/button/button_type.dart';
import 'package:capstone_management/button/sign_in_button.dart';
import 'package:capstone_management/provider/aws_cognito_provider.dart';
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
          const SizedBox(
            height: 50.0,
            child: Text(
              'Sign In',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(
            height: 48.0,
          ),
          SignInButton(
            button: ButtonType.google,
            onPressed: () => context.read<AWSCognitoProvider>().signIn(AuthProvider.google),
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
