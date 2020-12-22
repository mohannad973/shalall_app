import 'package:food_app/models/userAuthentication/user_info.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class UserPreferences {
  Future<bool> saveUser(UserInfo user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setInt("userId", user.userId);
    prefs.setString("fName", user.fName);
    prefs.setString("lName", user.lName);
    prefs.setString("email", user.email);
    prefs.setString("gender", user.gender);
    prefs.setString("token", user.token);
    prefs.setString("role", user.role);

    return prefs.commit();
  }

  Future<UserInfo> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    int userId = prefs.getInt("userId");
    String fName = prefs.getString("fName");
    String email = prefs.getString("email");
    String lName = prefs.getString("lName");
    String gender = prefs.getString("gender");
    String token = prefs.getString("token");
    String role = prefs.getString("role");

    return UserInfo(
        userId: userId,
        fName: fName,
        lName: lName,
        email: email,
        gender: gender,
        token: token,
        role: role);
  }

  void removeUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.remove("fName");
    prefs.remove("email");
    prefs.remove("lName");
    prefs.remove("gender");
    prefs.remove("token");
    prefs.remove("role");
  }

  Future<String> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token");
    return token;
  }
}
