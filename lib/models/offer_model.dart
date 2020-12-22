import 'all_offers_response.dart';
import 'outlet_model.dart';

class Offer {
  Offer({
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

  factory Offer.fromJson(Map<String, dynamic> json) => Offer(
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
    isValid: json["is_valid"],
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
    "is_valid": isValid,
  };
}