import 'package:flutter/material.dart';
import 'package:food_app/models/OutletByCategoryIdResponseModel.dart';
import 'package:food_app/models/category_model.dart';
import 'package:food_app/models/getcategory_response.dart';
import 'package:food_app/models/outlet_model.dart';
import 'package:food_app/network/app_url.dart';
import 'package:food_app/session_manager/user_preference.dart';
import 'package:http/http.dart';

class OutletsProvider with ChangeNotifier {
  bool loading = false;

  CategoryResponseModel categoryResponseModel = CategoryResponseModel();

  OutletByCategoryIdResponseModel outletByCategoryIdResponseModel =
  OutletByCategoryIdResponseModel();

  OutletsByCatsResponse2 outletsByCatsResponse2 = OutletsByCatsResponse2();

  List<CategoryModel> categories = [];
  List<Outlet> outlets = [];

  UserPreferences userPreferences = UserPreferences();

  Future getCategories() async {
    setLoading(true);
    try {
      String token = await userPreferences.getToken();
      Response catsResponse = await post(AppUrl.getOutletsByCatId, headers: {
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

  Future<OutletByCategoryIdResponseModel> getOutletByCategoryId(int id) async{
    setLoading(true);
    try{
      String token = await userPreferences.getToken();
      Response outletsResponse =
      await post(AppUrl.getOutletByCategoryId, body: {
        "id": id,
      }, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });


      if (outletsResponse != null) {
        outletByCategoryIdResponseModel =
            outletByCategoryIdResponseModelFromJson(outletsResponse.body);

        // outlets = outletByCategoryIdResponseModel.outlets;



        setLoading(false);
        return outletByCategoryIdResponseModel;
      }

      if (outletByCategoryIdResponseModel == null) {
        print("inside the provider----------" + categories.toString());
        setLoading(false);

        return outletByCategoryIdResponseModel;
      }
      setLoading(false);
      return outletByCategoryIdResponseModel;
    }catch(e){
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
