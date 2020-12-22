// To parse this JSON data, do
//
//     final userFavouritesResponse = userFavouritesResponseFromJson(jsonString);



// To parse this JSON data, do
//
//     final userFavouritesResponse = userFavouritesResponseFromJson(jsonString);

import 'dart:convert';

import 'offer_model.dart';

UserFavouritesResponse userFavouritesResponseFromJson(String str) => UserFavouritesResponse.fromJson(json.decode(str));

String userFavouritesResponseToJson(UserFavouritesResponse data) => json.encode(data.toJson());

class UserFavouritesResponse {
  UserFavouritesResponse({
    this.favouriteOffers,
  });

  List<FavouriteOffer> favouriteOffers;

  factory UserFavouritesResponse.fromJson(Map<String, dynamic> json) => UserFavouritesResponse(
    favouriteOffers: List<FavouriteOffer>.from(json["favourite_offers"].map((x) => FavouriteOffer.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "favourite_offers": List<dynamic>.from(favouriteOffers.map((x) => x.toJson())),
  };
}

class FavouriteOffer {
  FavouriteOffer({
    this.id,
    this.offerId,
    this.userId,
    this.createdAt,
    this.updatedAt,
    this.isValid,
    this.user,
    this.offer,
  });

  int id;
  int offerId;
  int userId;
  DateTime createdAt;
  DateTime updatedAt;
  bool isValid;
  User user;
  Offer offer;

  factory FavouriteOffer.fromJson(Map<String, dynamic> json) => FavouriteOffer(
    id: json["id"],
    offerId: json["offer_id"],
    userId: json["user_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    isValid: json["is_valid"],
    user: User.fromJson(json["user"]),
    offer: Offer.fromJson(json["offer"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "offer_id": offerId,
    "user_id": userId,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "is_valid": isValid,
    "user": user.toJson(),
    "offer": offer.toJson(),
  };
}



class User {
  User({
    this.id,
    this.uuid,
    this.firstName,
    this.lastName,
    this.gender,
    this.resetPasswordCode,
    this.email,
    this.avatarType,
    this.avatarLocation,
    this.passwordChangedAt,
    this.active,
    this.confirmationCode,
    this.confirmed,
    this.timezone,
    this.lastLoginAt,
    this.lastLoginIp,
    this.toBeLoggedOut,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.fullName,
  });

  int id;
  String uuid;
  String firstName;
  String lastName;
  String gender;
  dynamic resetPasswordCode;
  String email;
  String avatarType;
  dynamic avatarLocation;
  dynamic passwordChangedAt;
  bool active;
  dynamic confirmationCode;
  bool confirmed;
  dynamic timezone;
  dynamic lastLoginAt;
  dynamic lastLoginIp;
  bool toBeLoggedOut;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;
  String fullName;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    uuid: json["uuid"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    gender: json["gender"],
    resetPasswordCode: json["reset_password_code"],
    email: json["email"],
    avatarType: json["avatar_type"],
    avatarLocation: json["avatar_location"],
    passwordChangedAt: json["password_changed_at"],
    active: json["active"],
    confirmationCode: json["confirmation_code"],
    confirmed: json["confirmed"],
    timezone: json["timezone"],
    lastLoginAt: json["last_login_at"],
    lastLoginIp: json["last_login_ip"],
    toBeLoggedOut: json["to_be_logged_out"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    deletedAt: json["deleted_at"],
    fullName: json["full_name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "uuid": uuid,
    "first_name": firstName,
    "last_name": lastName,
    "gender": gender,
    "reset_password_code": resetPasswordCode,
    "email": email,
    "avatar_type": avatarType,
    "avatar_location": avatarLocation,
    "password_changed_at": passwordChangedAt,
    "active": active,
    "confirmation_code": confirmationCode,
    "confirmed": confirmed,
    "timezone": timezone,
    "last_login_at": lastLoginAt,
    "last_login_ip": lastLoginIp,
    "to_be_logged_out": toBeLoggedOut,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "deleted_at": deletedAt,
    "full_name": fullName,
  };
}
