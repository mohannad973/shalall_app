class Outlet {
  Outlet({
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
    this.arAddress,
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
  String arAddress;
  String menuImageUrl;
  String pinNumber;
  dynamic countryRate;
  String qrCodeImageUrl;
  double lat;
  double long;
  DateTime createdAt;
  DateTime updatedAt;

  factory Outlet.fromJson(Map<String, dynamic> json) => Outlet(
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
    arAddress: json["ar_address"],
    menuImageUrl: json["menu_image_url"],
    pinNumber: json["pin_number"],
    countryRate: json["country_rate"],
    qrCodeImageUrl: json["qr_code_image_url"],
    lat: json["lat"].toDouble(),
    long: json["long"].toDouble(),
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
    "ar_address": arAddress,
    "menu_image_url": menuImageUrl,
    "pin_number": pinNumber,
    "country_rate": countryRate,
    "qr_code_image_url": qrCodeImageUrl,
    "lat": lat,
    "long": long,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}