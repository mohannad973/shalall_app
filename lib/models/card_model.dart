class CardModel {
  CardModel({
    this.id,
    this.engName,
    this.arName,
    this.price,
    this.numOfOffers,
    this.numOfMonths,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String engName;
  String arName;
  int price;
  int numOfOffers;
  String numOfMonths;
  DateTime createdAt;
  DateTime updatedAt;

  factory CardModel.fromJson(Map<String, dynamic> json) => CardModel(
    id: json["id"],
    engName: json["eng_name"],
    arName: json["ar_name"],
    price: json["price"],
    numOfOffers: json["num_of_offers"],
    numOfMonths: json["num_of_months"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "eng_name": engName,
    "ar_name": arName,
    "price": price,
    "num_of_offers": numOfOffers,
    "num_of_months": numOfMonths,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };

  @override
  String toString() {
    return 'CardModel{id: $id, engName: $engName, arName: $arName, price: $price, numOfOffers: $numOfOffers, numOfMonths: $numOfMonths, createdAt: $createdAt, updatedAt: $updatedAt}';
  }
}