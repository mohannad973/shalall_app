// To parse this JSON data, do
//
//     final allOffersResponse = allOffersResponseFromJson(jsonString);

import 'dart:convert';

import 'offer_model.dart';

AllOffersResponse allOffersResponseFromJson(String str) => AllOffersResponse.fromJson(json.decode(str));

String allOffersResponseToJson(AllOffersResponse data) => json.encode(data.toJson());

class AllOffersResponse {
  AllOffersResponse({
    this.offers,
  });

  List<Offer> offers;

  factory AllOffersResponse.fromJson(Map<String, dynamic> json) => AllOffersResponse(
    offers: List<Offer>.from(json["offers"].map((x) => Offer.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "offers": List<dynamic>.from(offers.map((x) => x.toJson())),
  };

  @override
  String toString() {
    return 'AllOffersResponse{offers: $offers}';
  }
}

