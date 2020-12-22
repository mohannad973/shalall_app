// To parse this JSON data, do
//
//     final outletsByCatsResponse = outletsByCatsResponseFromJson(jsonString);

import 'dart:convert';

import 'outlet_model.dart';

OutletsByCatsResponse outletsByCatsResponseFromJson(String str) => OutletsByCatsResponse.fromJson(json.decode(str));

String outletsByCatsResponseToJson(OutletsByCatsResponse data) => json.encode(data.toJson());

class OutletsByCatsResponse {
  OutletsByCatsResponse({
    this.outlets,
  });

  List<Outlet> outlets;

  factory OutletsByCatsResponse.fromJson(Map<String, dynamic> json) => OutletsByCatsResponse(
    outlets: List<Outlet>.from(json["outlets"].map((x) => Outlet.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "outlets": List<dynamic>.from(outlets.map((x) => x.toJson())),
  };
}


