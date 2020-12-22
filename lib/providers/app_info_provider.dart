import 'package:flutter/material.dart';
import 'package:food_app/models/app_info_model.dart';
import 'package:food_app/models/offer_sorted_response.dart';
import 'package:food_app/network/app_url.dart';
import 'package:food_app/session_manager/user_preference.dart';
import 'package:http/http.dart';

class AppInfoProvider with ChangeNotifier {
  bool loading = false;

  AppInfoModel appInfoModel = AppInfoModel();

  List<Info> infoList = [];
  List<Info> termsList = [];



  UserPreferences userPreferences = UserPreferences();

  Future getAppInfo() async {

    infoList.clear();
    termsList.clear();

    setLoading(true);
    try {
      String token = await userPreferences.getToken();
      Response response = await post(AppUrl.getAppInfo,headers: {
        'Authorization': 'Bearer $token',
      });


      if (response != null && response.statusCode==200) {

        appInfoModel =
            appInfoModelFromJson(response.body);

        for(int i = 0; i<appInfoModel.info.length ; i++){
          if(appInfoModel.info[i].key.contains('term')){
            termsList.add(appInfoModel.info[i]);
          }
        }


        infoList = appInfoModel.info;

        print('appinfo '+infoList.toString());

        setLoading(false);
        return appInfoModel;

      }
      if (appInfoModel == null) {

        setLoading(false);

        return null;
      }
      setLoading(false);
      return appInfoModel;
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
