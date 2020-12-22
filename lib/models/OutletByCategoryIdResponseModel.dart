// To parse this JSON data, do
//
//     final outletByCategoryIdResponseModel = outletByCategoryIdResponseModelFromJson(jsonString);

import 'dart:convert';

import 'outlet_model.dart';

OutletByCategoryIdResponseModel outletByCategoryIdResponseModelFromJson(String str) => OutletByCategoryIdResponseModel.fromJson(json.decode(str));

String outletByCategoryIdResponseModelToJson(OutletByCategoryIdResponseModel data) => json.encode(data.toJson());

class OutletByCategoryIdResponseModel {
  OutletByCategoryIdResponseModel({
    this.outlets,
  });

  List<Outlet> outlets;

  factory OutletByCategoryIdResponseModel.fromJson(Map<String, dynamic> json) => OutletByCategoryIdResponseModel(
    outlets: List<Outlet>.from(json["outlets"].map((x) => Outlet.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "outlets": List<dynamic>.from(outlets.map((x) => x.toJson())),
  };
}


// To parse this JSON data, do
//
//     final outletsByCatsResponse2 = outletsByCatsResponse2FromJson(jsonString);



OutletsByCatsResponse2 outletsByCatsResponse2FromJson(String str) => OutletsByCatsResponse2.fromJson(json.decode(str));

String outletsByCatsResponse2ToJson(OutletsByCatsResponse2 data) => json.encode(data.toJson());

class OutletsByCatsResponse2 {

  OutletsByCatsResponse2({
    this.outlets,
  });

  Map<String, Outlet> outlets;

  factory OutletsByCatsResponse2.fromJson(Map<String, dynamic> json) => OutletsByCatsResponse2(
    outlets: Map.from(json["outlets"]).map((k, v) => MapEntry<String, Outlet>(k, Outlet.fromJson(v))),
  );

  Map<String, dynamic> toJson() => {
    "outlets": Map.from(outlets).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
  };

  @override
  String toString() {
    return 'OutletsByCatsResponse2{outlets: $outlets}';
  }
}

class Outlets {
  Outlets({
    this.id,
    this.engName,
    this.arName,
    this.categoryId,
    this.imageUrl,
    this.logoUrl,
    this.engDesc,
    this.arDesc,
    this.open,
    this.close,
    this.phone,
    this.mobile,
    this.address,
    this.menuImageUrl,
    this.pinNumber,
    this.countryRate,
    this.qrCodeImageUrl,
    this.lat,
    this.long,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String engName;
  String arName;
  int categoryId;
  String imageUrl;
  String logoUrl;
  String engDesc;
  String arDesc;
  String open;
  String close;
  String phone;
  String mobile;
  String address;
  String menuImageUrl;
  String pinNumber;
  double countryRate;
  String qrCodeImageUrl;
  dynamic lat;
  dynamic long;
  DateTime createdAt;
  DateTime updatedAt;

  factory Outlets.fromJson(Map<String, dynamic> json) => Outlets(
    id: json["id"],
    engName: json["eng_name"],
    arName: json["ar_name"],
    categoryId: json["category_id"],
    imageUrl: json["image_url"],
    logoUrl: json["logo_url"],
    engDesc: json["eng_desc"],
    arDesc: json["ar_desc"],
    open: json["open"],
    close: json["close"],
    phone: json["phone"],
    mobile: json["mobile"],
    address: json["address"],
    menuImageUrl: json["menu_image_url"],
    pinNumber: json["pin_number"],
    countryRate: json["country_rate"],
    qrCodeImageUrl: json["qr_code_image_url"],
    lat: json["lat"],
    long: json["long"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "eng_name": engName,
    "ar_name": arName,
    "category_id": categoryId,
    "image_url": imageUrl,
    "logo_url": logoUrl,
    "eng_desc": engDesc,
    "ar_desc": arDesc,
    "open": open,
    "close": close,
    "phone": phone,
    "mobile": mobile,
    "address": address,
    "menu_image_url": menuImageUrl,
    "pin_number": pinNumber,
    "country_rate": countryRate,
    "qr_code_image_url": qrCodeImageUrl,
    "lat": lat,
    "long": long,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };

  @override
  String toString() {
    return 'Outlets{id: $id, engName: $engName, arName: $arName, categoryId: $categoryId, imageUrl: $imageUrl, logoUrl: $logoUrl, engDesc: $engDesc, arDesc: $arDesc, open: $open, close: $close, phone: $phone, mobile: $mobile, address: $address, menuImageUrl: $menuImageUrl, pinNumber: $pinNumber, countryRate: $countryRate, qrCodeImageUrl: $qrCodeImageUrl, lat: $lat, long: $long, createdAt: $createdAt, updatedAt: $updatedAt}';
  }
}
