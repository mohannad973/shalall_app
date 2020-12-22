import 'package:flutter/material.dart';
import 'package:food_app/models/offer_sorted_response.dart';
import 'package:food_app/network/app_url.dart';
import 'package:food_app/session_manager/user_preference.dart';
import 'package:http/http.dart';

class SortedOffersProvider with ChangeNotifier {
  bool loading = false;

  OffersSortedResponse offersSortedResponse = OffersSortedResponse();

  List<DateAsc> datesOffers = [];
  List<DateAsc> rateOffers = [];
  List<DateAsc> favOffers = [];
  List<DateAsc> sellOffers = [];


  UserPreferences userPreferences = UserPreferences();

  Future getSortedOffers() async {

    setLoading(true);
    try {
      String token = await userPreferences.getToken();
      Response response = await post(AppUrl.getSortedOffers,headers: {
        'Authorization': 'Bearer $token',
      });


      if (response != null && response.statusCode==200) {

        offersSortedResponse =
            offersSortedResponseFromJson(response.body);

        datesOffers = offersSortedResponse.offers.dateAsc;
        rateOffers = offersSortedResponse.offers.rateAsc;
        favOffers = offersSortedResponse.offers.favouritesAsc;
        sellOffers = offersSortedResponse.offers.sellersAsc;
        setLoading(false);
        return offersSortedResponse;

      }
      if (offersSortedResponse == null) {

        setLoading(false);

        return null;
      }
      setLoading(false);
      return offersSortedResponse;
    } catch (e) {
      print('offersSort5 ' +e.toString());
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
