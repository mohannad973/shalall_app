import 'package:flutter/material.dart';
import 'package:food_app/models/OutletByCategoryIdResponseModel.dart';
import 'package:food_app/models/category_model.dart';
import 'package:food_app/models/getcategory_response.dart';
import 'package:food_app/models/offer_by_outletId.dart';

import 'package:food_app/models/offer_model.dart';
import 'package:food_app/models/outlet_model.dart';
import 'package:food_app/network/app_url.dart';
import 'package:food_app/session_manager/user_preference.dart';
import 'package:http/http.dart';

class OffersProvider with ChangeNotifier {
  bool loading = false;

  OfferByOutletIdResponse offerByOutletIdResponse = OfferByOutletIdResponse();
  


  List<Offer> offers = [];

  Map<String, Offer> offers2;


  UserPreferences userPreferences = UserPreferences();

  Future getOffers(String outletId) async {
    print('offers1');
    setLoading(true);
    try {
      String token = await userPreferences.getToken();
      Response response = await post(AppUrl.getOffersByOutletId, body: {
        "id":outletId
      },headers: {

        'Authorization': 'Bearer $token',
      });


      print('offers2 '+response.body);
      print('offers3 '+response.statusCode.toString());

      if (response != null && response.statusCode==200) {

        int id = int.parse(outletId);
        // if(id <= 1){
          offerByOutletIdResponse =
              offerByOutletIdResponseFromJson(response.body);

          print("offers6 "+offerByOutletIdResponse.toString());

          offers = offerByOutletIdResponse.offers;

          setLoading(false);
          return offerByOutletIdResponse;

        // }else{
        //
        //   offersResponse=offersResponseFromJson(response.body);
        //   offers2 = offersResponse.offers;
        //   offers= offers2.values.toList();
        // }




      }

      if (offerByOutletIdResponse == null) {

        setLoading(false);

        return null;
      }
      setLoading(false);
      return offerByOutletIdResponse;
    } catch (e) {
      print('offers5 ' +e.toString());
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
