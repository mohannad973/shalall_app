
class Rate {
  Rate({
    this.id,
    this.offerId,
    this.userId,
    this.rate,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  int offerId;
  int userId;
  double rate;
  DateTime createdAt;
  DateTime updatedAt;

  factory Rate.fromJson(Map<String, dynamic> json) => Rate(
    id: json["id"],
    offerId: json["offer_id"],
    userId: json["user_id"],
    rate: json["rate"].toDouble(),
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "offer_id": offerId,
    "user_id": userId,
    "rate": rate,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
