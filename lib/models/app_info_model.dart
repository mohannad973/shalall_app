// To parse this JSON data, do
//
//     final appInfoModel = appInfoModelFromJson(jsonString);

import 'dart:convert';

AppInfoModel appInfoModelFromJson(String str) => AppInfoModel.fromJson(json.decode(str));

String appInfoModelToJson(AppInfoModel data) => json.encode(data.toJson());

class AppInfoModel {
  AppInfoModel({
    this.info,
  });

  List<Info> info;

  factory AppInfoModel.fromJson(Map<String, dynamic> json) => AppInfoModel(
    info: List<Info>.from(json["info"].map((x) => Info.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "info": List<dynamic>.from(info.map((x) => x.toJson())),
  };

  @override
  String toString() {
    return 'AppInfoModel{info: $info}';
  }
}

class Info {
  Info({
    this.id,
    this.key,
    this.value,
    this.arKey,
    this.arValue,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String key;
  String value;
  String arKey;
  String arValue;
  DateTime createdAt;
  DateTime updatedAt;

  factory Info.fromJson(Map<String, dynamic> json) => Info(
    id: json["id"],
    key: json["key"],
    value: json["value"],
    arKey: json["ar_key"],
    arValue: json["ar_value"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "key": key,
    "value": value,
    "ar_key": arKey,
    "ar_value": arValue,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };

  @override
  String toString() {
    return 'Info{id: $id, key: $key, value: $value, arKey: $arKey, arValue: $arValue, createdAt: $createdAt, updatedAt: $updatedAt}';
  }
}
