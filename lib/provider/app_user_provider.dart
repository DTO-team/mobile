import 'dart:convert';

import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:capstone_management/amplifyconfiguration.dart';
import 'package:capstone_management/common/http_client.dart';
import 'package:capstone_management/common/string_util.dart';
import 'package:capstone_management/modal/lecturer.dart';
import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

class AppUserProvider extends ChangeNotifier {
  static final logger = Logger();

  bool isSignedIn = false;
  Lecturer? appUser;

  AppUserProvider() {
    if (!Amplify.isConfigured) configureAmplify();
  }

  Future<void> configureAmplify() async {
    Amplify.addPlugin(AmplifyAuthCognito());
    try {
      await Amplify.configure(amplifyconfig);
    } catch (e) {
      logger.e(e);
    } finally {
      signOut();
    }
  }

  Future<void> signIn(AuthProvider authProvider) async {
    try {
      final signInResult =
          await Amplify.Auth.signInWithWebUI(provider: authProvider);

      final idToken = signInResult.nextStep?.additionalInfo?['token'];
      if (signInResult.isSignedIn && !isNullOrEmpty(idToken)) {
        final httpClient = HttpClient();

        final response =
            await httpClient.post('/auth/login', body: {'idToken': idToken});
        if (response.statusCode == 200) {
          final body = jsonDecode(response.body);
          if (body['accessToken'] != null) {
            httpClient.token = body['accessToken'];
            appUser = Lecturer.fromJson(body);
            isSignedIn = true;
          } else {
            signOut();
          }
        } else {
          // TODO toast 'Login fail'
          signOut();
        }
      } else {
        // TODO toast 'Login fail'
        signOut();
      }
      notifyListeners();
    } catch (e) {
      logger.e(e);
    }
  }

  void signOut() async {
    try {
      await Amplify.Auth.signOut().whenComplete(() {
        HttpClient().token = null;
        appUser = null;
        isSignedIn = false;
      });
      notifyListeners();
    } on AuthException catch (e) {
      logger.e(e);
    }
  }
}
