import 'package:flutter/material.dart';
import 'package:food_app/models/OutletByCategoryIdResponseModel.dart';
import 'package:food_app/models/card_model.dart';
import 'package:food_app/models/cards_response_model.dart';
import 'package:food_app/models/category_model.dart';
import 'package:food_app/models/getcategory_response.dart';
import 'package:food_app/models/outlet_model.dart';
import 'package:food_app/network/app_url.dart';
import 'package:food_app/session_manager/user_preference.dart';
import 'package:http/http.dart';

class CardsProvider with ChangeNotifier {
  bool loading = false;

  CardsResponse cardsResponse = CardsResponse();
  OutletByCategoryIdResponseModel outletByCategoryIdResponseModel =
  OutletByCategoryIdResponseModel();
  List<CardModel> cards = [];

  Future<CardsResponse> getCards() async {
    setLoading(true);
    try {

      Response response = await post(AppUrl.getCards,);
      if (response != null) {
        cardsResponse =
            cardsResponseFromJson(response.body);

        cards = cardsResponse.cards;

        print("card are :" + cards.toString());

        setLoading(false);
        return cardsResponse;
      }

      if (cardsResponse == null) {

        setLoading(false);

        return cardsResponse;
      }
      setLoading(false);
      return cardsResponse;
    } catch (e) {
      print("error : " + e.toString());
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
