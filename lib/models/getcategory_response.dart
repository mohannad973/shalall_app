// To parse this JSON data, do
//
//     final categoryResponseModel = categoryResponseModelFromJson(jsonString);

import 'dart:convert';

import 'category_model.dart';
import 'outlet_model.dart';

CategoryResponseModel categoryResponseModelFromJson(String str) => CategoryResponseModel.fromJson(json.decode(str));

String categoryResponseModelToJson(CategoryResponseModel data) => json.encode(data.toJson());

class CategoryResponseModel {
  CategoryResponseModel({
    this.categories,
  });

  List<CategoryModel> categories;

  factory CategoryResponseModel.fromJson(Map<String, dynamic> json) => CategoryResponseModel(
    categories: List<CategoryModel>.from(json["categories"].map((x) => CategoryModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
  };
}




