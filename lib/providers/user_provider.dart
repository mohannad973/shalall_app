import 'package:flutter/material.dart';
import 'package:food_app/models/OutletByCategoryIdResponseModel.dart';
import 'package:food_app/models/category_model.dart';
import 'package:food_app/models/getcategory_response.dart';
import 'package:food_app/models/outlet_model.dart';
import 'package:food_app/models/user_profile_response_model.dart';
import 'package:food_app/network/app_url.dart';
import 'package:food_app/session_manager/user_preference.dart';
import 'package:http/http.dart';

class UserProfileProvider with ChangeNotifier {
  bool loading = false;
  // int selectedIndex =0;

  UserProfileResponse userProfileResponse = UserProfileResponse();
  UserProfile userProfile = UserProfile();

  UserPreferences userPreferences = UserPreferences();

  Future<UserProfile> getUserProfile() async {
    setLoading(true);
    try {
      String token = await userPreferences.getToken();
      Response response = await post(AppUrl.getUserProfile, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });

      print('user profile response : '+response.body);

      if (response != null && response.statusCode == 200) {
        userProfileResponse =
            userProfileResponseFromJson(response.body);

        userProfile = userProfileResponse.user;
        print('user profile response 2 : '+userProfileResponse.toString()+' '+userProfile.toString());

        setLoading(false);
        return userProfile;
      }

      if (response.statusCode != 200 ) {

        setLoading(false);

        return userProfile;
      }
      setLoading(false);
      return userProfile;
    } catch (e) {
      print("user Error" + e.toString());
      setLoading(false);
      return null;
    }
  }


  void setLoading(bool value) {
    loading = value;
    notifyListeners();
  }

  bool isLoading() {
    return loading;
  }
}
