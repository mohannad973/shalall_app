import 'package:flutter/material.dart';
import 'package:food_app/models/OutletByCategoryIdResponseModel.dart';
import 'package:food_app/models/all_offers_response.dart';
import 'package:food_app/models/category_model.dart';
import 'package:food_app/models/getcategory_response.dart';
import 'package:food_app/models/offer_by_outletId.dart';
import 'package:food_app/models/offer_model.dart';
import 'package:food_app/models/outlet_model.dart';
import 'package:food_app/network/app_url.dart';
import 'package:food_app/session_manager/user_preference.dart';
import 'package:http/http.dart';

class OffersByDateProvider with ChangeNotifier {
  bool loading = false;

  AllOffersResponse allOffersResponse = AllOffersResponse();


  List<Offer> offers = [];


  UserPreferences userPreferences = UserPreferences();


  Future getOfferByDate() async {

    setLoading(true);
    try {
      String token = await userPreferences.getToken();
      Response response = await post(AppUrl.getAllOffers, body: {
        'type':'date',
        'order':'asc'
      },headers: {
        'Authorization': 'Bearer $token',
      });


      if (response != null && response.statusCode==200) {

        allOffersResponse =
            allOffersResponseFromJson(response.body);

        offers = allOffersResponse.offers;

        print('by date '+offers.toString());
        setLoading(false);
        return allOffersResponse;


      }

      if (allOffersResponse == null) {

        setLoading(false);

        return null;
      }
      setLoading(false);
      return allOffersResponse;
    } catch (e) {

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
