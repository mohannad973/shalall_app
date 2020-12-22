// To parse this JSON data, do
//
//     final offerByOutletIdResponse = offerByOutletIdResponseFromJson(jsonString);

import 'dart:convert';

import 'offer_model.dart';

OfferByOutletIdResponse offerByOutletIdResponseFromJson(String str) => OfferByOutletIdResponse.fromJson(json.decode(str));

String offerByOutletIdResponseToJson(OfferByOutletIdResponse data) => json.encode(data.toJson());

class OfferByOutletIdResponse {
  OfferByOutletIdResponse({
    this.offers,
  });

  List<Offer> offers;

  factory OfferByOutletIdResponse.fromJson(Map<String, dynamic> json) => OfferByOutletIdResponse(
    offers: List<Offer>.from(json["offers"].map((x) => Offer.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "offers": List<dynamic>.from(offers.map((x) => x.toJson())),
  };
}


