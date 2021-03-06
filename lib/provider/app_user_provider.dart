import 'dart:convert';

import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:capstone_management/amplifyconfiguration.dart';
import 'package:capstone_management/common/http_client.dart';
import 'package:capstone_management/common/string_util.dart';
import 'package:capstone_management/modal/lecturer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class AppUserProvider extends ChangeNotifier {
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
      throw Exception(e);
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
        if (response.statusCode != 200) {
          return;
        }

        final body = jsonDecode(response.body);
        if (body['accessToken'] != null) {
          httpClient.token = body['accessToken'];
          appUser = Lecturer.fromJson(body);
          isSignedIn = true;
          EasyLoading.showSuccess('Login success!');
        }
      }
    } catch (e) {
      EasyLoading.showError('Login fail!');
      throw Exception(e);
    } finally {
      if (!isSignedIn) {
        _clearSignInState();
      }
      notifyListeners();
    }
  }

  void signOut() async {
    try {
      _clearSignInState();
      Amplify.Auth.signOut();
      EasyLoading.showSuccess('Sign out success!');
    } on AuthException catch (e) {
      EasyLoading.showError('Sign out fail!');
      throw Exception(e);
    } finally {
      notifyListeners();
    }
  }

  void _clearSignInState() {
    HttpClient().token = null;
    appUser = null;
    isSignedIn = false;
  }
}
