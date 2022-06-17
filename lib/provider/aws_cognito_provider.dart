import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:capstone_management/amplifyconfiguration.dart';
import 'package:flutter/material.dart';

class AWSCognitoProvider extends ChangeNotifier {
  bool isSignedIn = false;

  AWSCognitoProvider() {
    if (!Amplify.isConfigured) configureAmplify();
  }

  void configureAmplify() async {
    AmplifyAuthCognito authPlugin = AmplifyAuthCognito();
    Amplify.addPlugins([authPlugin]);

    try {
      await Amplify.configure(amplifyconfig);
    } catch (e) {
      print('Error $e');
    } finally {
      // For development let's make sure we are signed out
      signOut();
    }
  }

  void signIn(AuthProvider authProvider) async {
    try {
      final signInResult =
          await Amplify.Auth.signInWithWebUI(provider: authProvider);
      isSignedIn = signInResult.isSignedIn;
      final idToken = signInResult.nextStep?.additionalInfo?['token'];
      notifyListeners();
    } catch (e) {
      print('Error $e');
    }
  }

  void signOut() async {
    try {
      await Amplify.Auth.signOut().whenComplete(() => isSignedIn = false);
      notifyListeners();
    } on AuthException catch (e) {
      print('Error $e');
    }
  }
}
