import 'dart:convert';

import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:capstone_management/amplifyconfiguration.dart';
import 'package:capstone_management/common/http_client.dart';
import 'package:capstone_management/common/string_util.dart';
import 'package:flutter/foundation.dart';

class AWSCognitoProvider extends ChangeNotifier {
  bool isSignedIn = false;

  AWSCognitoProvider() {
    if (!Amplify.isConfigured) configureAmplify();
  }

  void configureAmplify() async {
    Amplify.addPlugin(AmplifyAuthCognito());

    try {
      await Amplify.configure(amplifyconfig);
    } catch (e) {
      if (kDebugMode) {
        print('Error $e');
      }
    } finally {
      signOut();
    }
  }

  void signIn(AuthProvider authProvider) async {
    try {
      final signInResult =
          await Amplify.Auth.signInWithWebUI(provider: authProvider);
      final idToken = signInResult.nextStep?.additionalInfo?['token'];
      if (!isNullOrEmpty(idToken)) {
        final httpClient = HttpClient();
        final response =
            await httpClient.post('/auth/login', body: {'idToken': idToken});
        if (response.statusCode == 200) {
          final body = jsonDecode(response.body);
          httpClient.token = body['accessToken'];
          isSignedIn = true;
        } else {
          // TODO toast 'Login fail'
        }
      } else {
        // TODO toast 'Login fail'
      }
      notifyListeners();
    } catch (e) {
      if (kDebugMode) {
        print('Error $e');
      }
    }
  }

  void signOut() async {
    try {
      await Amplify.Auth.signOut().whenComplete(() {
        isSignedIn = false;
        HttpClient().token = null;
      });
      notifyListeners();
    } on AuthException catch (e) {
      if (kDebugMode) {
        print('Error $e');
      }
    }
  }
}
