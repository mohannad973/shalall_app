// To parse this JSON data, do
//
//     final userProfileResponse = userProfileResponseFromJson(jsonString);

import 'dart:convert';

UserProfileResponse userProfileResponseFromJson(String str) => UserProfileResponse.fromJson(json.decode(str));

String userProfileResponseToJson(UserProfileResponse data) => json.encode(data.toJson());

class UserProfileResponse {
  UserProfileResponse({
    this.user,
  });

  UserProfile user;

  factory UserProfileResponse.fromJson(Map<String, dynamic> json) => UserProfileResponse(
    user: UserProfile.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "user": user.toJson(),
  };

  @override
  String toString() {
    return 'UserProfileResponse{user: $user}';
  }
}

class UserProfile {
  UserProfile({
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

  factory UserProfile.fromJson(Map<String, dynamic> json) => UserProfile(
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

  @override
  String toString() {
    return 'UserProfile{id: $id, uuid: $uuid, firstName: $firstName, lastName: $lastName, gender: $gender, resetPasswordCode: $resetPasswordCode, email: $email, avatarType: $avatarType, avatarLocation: $avatarLocation, passwordChangedAt: $passwordChangedAt, active: $active, confirmationCode: $confirmationCode, confirmed: $confirmed, timezone: $timezone, lastLoginAt: $lastLoginAt, lastLoginIp: $lastLoginIp, toBeLoggedOut: $toBeLoggedOut, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt, fullName: $fullName}';
  }
}
