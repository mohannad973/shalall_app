import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:food_app/models/userAuthentication/login_response.dart';
import 'package:food_app/models/userAuthentication/user_info.dart';
import 'package:food_app/network/app_url.dart';
import 'package:food_app/session_manager/user_preference.dart';
import 'package:http/http.dart';

enum Status {
  NotLoggedIn,
  NotRegistered,
  LoggedIn,
  Registered,
  Authenticating,
  Registering,
  LoggedOut
}

class AuthProvider with ChangeNotifier {
  Status _loggedInStatus = Status.NotLoggedIn;
  Status _registeredInStatus = Status.NotRegistered;

  Status get loggedInStatus => _loggedInStatus;

  Status get registeredInStatus => _registeredInStatus;

  Future<Map<String, dynamic>> login(String email, String password) async {
    var result;

    final Map<String, dynamic> loginData = {
      'user': {'email': email, 'password': password}
    };

    _loggedInStatus = Status.Authenticating;
    notifyListeners();

    Response response = await post(
      AppUrl.login,
      body: jsonEncode({'email': email, 'password': password}),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);

      var userData = responseData;


      LoginResponse authUser = LoginResponse.fromJson(userData);

      UserInfo userInfo =
          UserInfo(userId: authUser.userId, token: authUser.accessToken);
      UserPreferences().saveUser(userInfo);

      print("token "+ userInfo.token);
      print("user id "+ userInfo.userId.toString());
      _loggedInStatus = Status.LoggedIn;
      notifyListeners();

      result = {'status': true, 'message': 'Successful', 'user': authUser};
    } else {
      _loggedInStatus = Status.NotLoggedIn;
      notifyListeners();
      result = {
        'status': false,
        'message': json.decode(response.body)['error']
      };
    }
    return result;
  }
}
