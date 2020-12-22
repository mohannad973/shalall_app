
import 'package:food_app/models/userAuthentication/user_info.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class UserPreferences {
  Future<bool> saveUser(UserInfo user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setInt("userId", user.userId);
    prefs.setString("email", user.email);
    prefs.setString("token", user.token);
    prefs.setString("gender", user.gender);
    prefs.setString("first_name", user.fName);
    prefs.setString("last_name", user.lName);
    prefs.setString("role", user.role);

    return prefs.commit();
  }

  Future<UserInfo> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    int userId = prefs.getInt("userId");
    String email = prefs.getString("email");
    String token = prefs.getString("token");
    String gender = prefs.getString("gender");
    String fName = prefs.getString("first_name");
    String lName = prefs.getString("last_name");
    String role = prefs.getString("role");


    return UserInfo(
        userId: userId,
        fName: fName,
        email: email,
        gender: gender,
        lName: lName,
        token: token,
        role: role
    );
  }

  void removeUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.remove("first_name");
    prefs.remove("last_name");
    prefs.remove("gender");
    prefs.remove("email");
    prefs.remove("token");
    prefs.remove("role");
  }

  Future<String> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token");
    return token;
  }
}