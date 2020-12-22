// To parse this JSON data, do
//
//     final cardsResponse = cardsResponseFromJson(jsonString);

import 'dart:convert';

import 'card_model.dart';

CardsResponse cardsResponseFromJson(String str) => CardsResponse.fromJson(json.decode(str));

String cardsResponseToJson(CardsResponse data) => json.encode(data.toJson());

class CardsResponse {
  CardsResponse({
    this.cards,
  });

  List<CardModel> cards;

  factory CardsResponse.fromJson(Map<String, dynamic> json) => CardsResponse(
    cards: List<CardModel>.from(json["cards"].map((x) => CardModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "cards": List<dynamic>.from(cards.map((x) => x.toJson())),
  };
}


