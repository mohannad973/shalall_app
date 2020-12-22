import 'package:flutter/material.dart';
import 'package:food_app/models/OutletByCategoryIdResponseModel.dart';
import 'package:food_app/models/category_model.dart';
import 'package:food_app/models/getcategory_response.dart';
import 'package:food_app/models/outlet_model.dart';
import 'package:food_app/models/success_string_response.dart';
import 'package:food_app/models/userAuthentication/user_info.dart';
import 'package:food_app/models/user_model.dart';
import 'package:food_app/network/app_url.dart';
import 'package:food_app/session_manager/user_preference.dart';
import 'package:http/http.dart';
import 'dart:convert';

class AddFavouritesProvider with ChangeNotifier {
  bool loading = false;


  SuccessStringResponse stringResponse = SuccessStringResponse();

  UserPreferences userPreferences = UserPreferences();


  Future<bool> addToFav(String offerId) async {
    print('fav1');
    setLoading(true);
    try {
      String token = await userPreferences.getToken();
      UserInfo user = await userPreferences.getUser();

      final body = jsonEncode({"user_id":user.userId.toString(),"offer_id":offerId.toString()});

      Response response = await post(AppUrl.addToFav,body: body, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });


      print('fav2'+response.body+"   "+response.statusCode.toString() );
      if (response != null && response.statusCode==200) {
        stringResponse =
            successStringResponseFromJson(response.body);

        setLoading(false);
        return true;
      }

      if (stringResponse == null) {

        setLoading(false);

        return false;
      }
      setLoading(false);
      return false;
    } catch (e) {
      print("fav3 " + e.toString());
      setLoading(false);
      return null;
    }
  }

  Future<bool> removeFromFav(String offerId) async {
    setLoading(true);
    try {
      String token = await userPreferences.getToken();
      UserInfo user = await userPreferences.getUser();

      Response response = await post(AppUrl.removeFav,body: {
        "fav_offer_id":offerId.toString()
      }, headers: {

        'Authorization': 'Bearer $token',
      });



      if (response != null && response.statusCode==200) {
        stringResponse =
            successStringResponseFromJson(response.body);

        setLoading(false);
        return true;
      }

      if (stringResponse == null) {

        setLoading(false);

        return false;
      }
      setLoading(false);
      return false;
    } catch (e) {
      print("inside the provider************" + e.toString());
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
