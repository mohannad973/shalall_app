import 'package:flutter/material.dart';
import 'package:food_app/models/OutletByCategoryIdResponseModel.dart';
import 'package:food_app/models/category_model.dart';
import 'package:food_app/models/getcategory_response.dart';
import 'package:food_app/models/outlet_model.dart';
import 'package:food_app/models/userAuthentication/user_info.dart';
import 'package:food_app/models/user_favourites_response.dart';
import 'package:food_app/models/user_profile_response_model.dart';
import 'package:food_app/network/app_url.dart';
import 'package:food_app/session_manager/user_preference.dart';
import 'package:http/http.dart';

class FavouritesProvider with ChangeNotifier {
  bool loading = false;

  UserFavouritesResponse userFavouritesResponse = UserFavouritesResponse();

  List<FavouriteOffer> favouritesOffersList = [];
  UserPreferences userPreferences = UserPreferences();

  Future<UserFavouritesResponse> getFavourites() async {
    setLoading(true);
    try {
      String token = await userPreferences.getToken();
      UserInfo userInfo = await userPreferences.getUser();
      Response response = await post(AppUrl.getUserFavourites, headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      }, body: {
        'user_id': userInfo.userId.toString()
      });


      print('user fav response : ' + response.body);

      if (response != null && response.statusCode == 200) {
        userFavouritesResponse = userFavouritesResponseFromJson(response.body);
        favouritesOffersList = userFavouritesResponse.favouriteOffers;
        setLoading(false);
        return userFavouritesResponse;
      }

      if (response.statusCode != 200) {
        setLoading(false);

        return null;
      }
      setLoading(false);
      return userFavouritesResponse;
    } catch (e) {
      print("fav Error" + e.toString());
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
