import 'outlet_model.dart';

class Datum {
  Datum({
    this.id,
    this.engName,
    this.arName,
    this.createdAt,
    this.updatedAt,
    this.outlets,
  });

  int id;
  String engName;
  String arName;
  DateTime createdAt;
  DateTime updatedAt;
  List<Outlet> outlets;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    engName: json["eng_name"],
    arName: json["ar_name"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    outlets: List<Outlet>.from(json["outlets"].map((x) => Outlet.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "eng_name": engName,
    "ar_name": arName,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "outlets": List<dynamic>.from(outlets.map((x) => x.toJson())),
  };
}