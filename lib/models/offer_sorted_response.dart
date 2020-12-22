// To parse this JSON data, do
//
//     final offersSortedResponse = offersSortedResponseFromJson(jsonString);

import 'dart:convert';

import 'outlet_model.dart';

OffersSortedResponse offersSortedResponseFromJson(String str) => OffersSortedResponse.fromJson(json.decode(str));

String offersSortedResponseToJson(OffersSortedResponse data) => json.encode(data.toJson());

class OffersSortedResponse {
  OffersSortedResponse({
    this.offers,
  });

  Offers offers;

  factory OffersSortedResponse.fromJson(Map<String, dynamic> json) => OffersSortedResponse(
    offers: Offers.fromJson(json["offers"]),
  );

  Map<String, dynamic> toJson() => {
    "offers": offers.toJson(),
  };

  @override
  String toString() {
    return 'OffersSortedResponse{offers: $offers}';
  }
}

class Offers {
  Offers({
    this.dateAsc,
    this.dateDesc,
    this.rateAsc,
    this.rateDesc,
    this.favouritesAsc,
    this.favouritesDesc,
    this.sellersAsc,
    this.sellersDesc,
  });

  List<DateAsc> dateAsc;
  List<DateAsc> dateDesc;
  List<DateAsc> rateAsc;
  List<DateAsc> rateDesc;
  List<DateAsc> favouritesAsc;
  List<DateAsc> favouritesDesc;
  List<DateAsc> sellersAsc;
  List<DateAsc> sellersDesc;

  factory Offers.fromJson(Map<String, dynamic> json) => Offers(
    dateAsc: List<DateAsc>.from(json["date_asc"].map((x) => DateAsc.fromJson(x))),
    dateDesc: List<DateAsc>.from(json["date_desc"].map((x) => DateAsc.fromJson(x))),
    rateAsc: List<DateAsc>.from(json["rate_asc"].map((x) => DateAsc.fromJson(x))),
    rateDesc: List<DateAsc>.from(json["rate_desc"].map((x) => DateAsc.fromJson(x))),
    favouritesAsc: List<DateAsc>.from(json["favourites_asc"].map((x) => DateAsc.fromJson(x))),
    favouritesDesc: List<DateAsc>.from(json["favourites_desc"].map((x) => DateAsc.fromJson(x))),
    sellersAsc: List<DateAsc>.from(json["sellers_asc"].map((x) => DateAsc.fromJson(x))),
    sellersDesc: List<DateAsc>.from(json["sellers_desc"].map((x) => DateAsc.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "date_asc": List<dynamic>.from(dateAsc.map((x) => x.toJson())),
    "date_desc": List<dynamic>.from(dateDesc.map((x) => x.toJson())),
    "rate_asc": List<dynamic>.from(rateAsc.map((x) => x.toJson())),
    "rate_desc": List<dynamic>.from(rateDesc.map((x) => x.toJson())),
    "favourites_asc": List<dynamic>.from(favouritesAsc.map((x) => x.toJson())),
    "favourites_desc": List<dynamic>.from(favouritesDesc.map((x) => x.toJson())),
    "sellers_asc": List<dynamic>.from(sellersAsc.map((x) => x.toJson())),
    "sellers_desc": List<dynamic>.from(sellersDesc.map((x) => x.toJson())),
  };

  @override
  String toString() {
    return 'Offers{dateAsc: $dateAsc, dateDesc: $dateDesc, rateAsc: $rateAsc, rateDesc: $rateDesc, favouritesAsc: $favouritesAsc, favouritesDesc: $favouritesDesc, sellersAsc: $sellersAsc, sellersDesc: $sellersDesc}';
  }
}

class DateAsc {
  DateAsc({
    this.id,
    this.outletId,
    this.engTitle,
    this.arTitle,
    this.price,
    this.imageUrl,
    this.engAbout,
    this.arAbout,
    this.startDate,
    this.endDate,
    this.termsAndConditions,
    this.arTermsAndConditions,
    this.createdAt,
    this.updatedAt,
    this.isValid,
    this.outlet,
  });

  int id;
  int outletId;
  String engTitle;
  String arTitle;
  String price;
  String imageUrl;
  String engAbout;
  String arAbout;
  DateTime startDate;
  DateTime endDate;
  String termsAndConditions;
  String arTermsAndConditions;
  DateTime createdAt;
  DateTime updatedAt;
  bool isValid;
  Outlet outlet;

  factory DateAsc.fromJson(Map<String, dynamic> json) => DateAsc(
    id: json["id"],
    outletId: json["outlet_id"],
    engTitle: json["eng_title"],
    arTitle: json["ar_title"],
    price: json["price"],
    imageUrl: json["image_url"],
    engAbout: json["eng_about"],
    arAbout: json["ar_about"],
    startDate: DateTime.parse(json["start_date"]),
    endDate: DateTime.parse(json["end_date"]),
    termsAndConditions: json["terms_and_conditions"],
    arTermsAndConditions: json["ar_terms_and_conditions"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    isValid: json["is_valid"] == null ? null : json["is_valid"],
    outlet: Outlet.fromJson(json["outlet"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "outlet_id": outletId,
    "eng_title": engTitle,
    "ar_title": arTitle,
    "price": price,
    "image_url": imageUrl,
    "eng_about": engAbout,
    "ar_about": arAbout,
    "start_date": "${startDate.year.toString().padLeft(4, '0')}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}",
    "end_date": "${endDate.year.toString().padLeft(4, '0')}-${endDate.month.toString().padLeft(2, '0')}-${endDate.day.toString().padLeft(2, '0')}",
    "terms_and_conditions": termsAndConditions,
    "ar_terms_and_conditions": arTermsAndConditions,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "is_valid": isValid == null ? null : isValid,
    "outlet": outlet.toJson(),
  };
}


