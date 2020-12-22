import 'package:flutter/material.dart';
import 'package:food_app/models/OutletByCategoryIdResponseModel.dart';
import 'package:food_app/models/category_model.dart';
import 'package:food_app/models/getcategory_response.dart';
import 'package:food_app/models/offer_sorted_response.dart';
import 'package:food_app/models/outlet_model.dart';
import 'package:food_app/network/app_url.dart';
import 'package:food_app/session_manager/user_preference.dart';
import 'package:http/http.dart';

class CategoryProvider with ChangeNotifier {
  bool loading = false;
  bool outletLoading = false;

  CategoryResponseModel categoryResponseModel = CategoryResponseModel();
  OutletByCategoryIdResponseModel outletByCategoryIdResponseModel =
      OutletByCategoryIdResponseModel();
  List<CategoryModel> categories = [];


  OutletsByCatsResponse2 outletsByCatsResponse2 = OutletsByCatsResponse2();

  List<Outlet> outlets = [];
  Map<String, Outlet> outlets2 ;

  UserPreferences userPreferences = UserPreferences();

  Future<CategoryResponseModel> getCategories() async {
    setLoading(true);
    try {
      await getSortedOffers();
      String token = await userPreferences.getToken();
      Response catsResponse = await post(AppUrl.getCategories, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });
      print("cat test"+catsResponse.body.toString());


      if (catsResponse != null) {
        categoryResponseModel =
            categoryResponseModelFromJson(catsResponse.body);

         categories = categoryResponseModel.categories;

        print("inside the provider++++++++++++++++++" + categories.toString());

        setLoading(false);
        return categoryResponseModel;
      }

      if (categoryResponseModel == null) {
        print("inside the provider----------" + categories.toString());
        setLoading(false);

        return categoryResponseModel;
      }
      setLoading(false);
      return categoryResponseModel;
    } catch (e) {
      print("inside the provider************" + e.toString());
      setLoading(false);
      return null;
    }

  }

  OffersSortedResponse offersSortedResponse = OffersSortedResponse();

  List<DateAsc> datesOffers = [];
  List<DateAsc> rateOffers = [];
  List<DateAsc> favOffers = [];
  List<DateAsc> sellOffers = [];

  bool sOfferLoading = false;

  Future getSortedOffers() async {

    print('sorted1');
    setSortedOfferLoading(true);
    try {
      String token = await userPreferences.getToken();
      Response response = await post(AppUrl.getSortedOffers,headers: {
        'Authorization': 'Bearer $token',
      });


      print('sorted2 '+response.statusCode.toString());

      if (response != null && response.statusCode==200) {

        offersSortedResponse =
            offersSortedResponseFromJson(response.body);

        print('sorted3 '+offersSortedResponse.toString());

        datesOffers = offersSortedResponse.offers.dateAsc;
        rateOffers = offersSortedResponse.offers.rateAsc;
        favOffers = offersSortedResponse.offers.favouritesAsc;
        sellOffers = offersSortedResponse.offers.sellersAsc;


        print('dates offers '+datesOffers.length.toString());
        setSortedOfferLoading(false);
        return offersSortedResponse;

      }
      if (offersSortedResponse == null) {

        setSortedOfferLoading(false);

        return null;
      }
      setSortedOfferLoading(false);
      return offersSortedResponse;
    } catch (e) {
      print('sorted4 ' +e.toString());
      setSortedOfferLoading(false);
      return null;
    }
  }


  Future<OutletByCategoryIdResponseModel> getOutletByCategoryId(int id) async{
    print("idp"+id.toString());
    print("idp2"+outletLoading.toString());

    setOutletLoading(true);
    print("idp3"+outletLoading.toString());
    try{
      String token = await userPreferences.getToken();
      Response outletsResponse =
      await post(AppUrl.getOutletByCategoryId, body: {
        "id": id.toString(),
      }, headers: {

        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });

      print('responsep '+outletsResponse.body);



      // if (outletsResponse != null && id == 1) {
        outletByCategoryIdResponseModel =
            outletByCategoryIdResponseModelFromJson(outletsResponse.body);

         outlets = outletByCategoryIdResponseModel.outlets;

        print("88888888"+outlets.toString());

        setOutletLoading(false);
        return outletByCategoryIdResponseModel;

      // }else if(outletsResponse != null && id>1){
      //
      //   outletsByCatsResponse2 = outletsByCatsResponse2FromJson(outletsResponse.body);
      //
      //   outlets2 = outletsByCatsResponse2.outlets;
      //
      //   print('here '+outletsByCatsResponse2.outlets.toString());
      //   outlets = outlets2.values.toList();
      //
      //
      //
      // }

      if (outletByCategoryIdResponseModel == null) {
        print("inside the provider----------" + categories.toString());
        setOutletLoading(false);

        return outletByCategoryIdResponseModel;
      }
      setOutletLoading(false);
      return outletByCategoryIdResponseModel;
    }catch(e){
      print("77777"+e.toString());
      setOutletLoading(false);
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

  bool isOutletLoading() {
    return outletLoading;
  }
  void setOutletLoading(bool value) {

    outletLoading = value;

    notifyListeners();
  }

  bool isSortedOfferLoading() {
    return sOfferLoading;
  }
  void setSortedOfferLoading(bool value) {
    sOfferLoading = value;
    notifyListeners();
  }
}
