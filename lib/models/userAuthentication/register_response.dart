// To parse this JSON data, do
//
//     final registerResponse = registerResponseFromJson(jsonString);

import 'dart:convert';

RegisterResponse registerResponseFromJson(String str) => RegisterResponse.fromJson(json.decode(str));

String registerResponseToJson(RegisterResponse data) => json.encode(data.toJson());

class RegisterResponse {
  RegisterResponse({
    this.success,
  });

  Success success;

  factory RegisterResponse.fromJson(Map<String, dynamic> json) => RegisterResponse(
    success: Success.fromJson(json["success"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success.toJson(),
  };
}

class Success {
  Success({
    this.user,
    this.token,
  });

  User user;
  String token;

  factory Success.fromJson(Map<String, dynamic> json) => Success(
    user: User.fromJson(json["user"]),
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "user": user.toJson(),
    "token": token,
  };
}

class User {
  User({
    this.firstName,
    this.lastName,
    this.email,
    this.gender,
    this.uuid,
    this.updatedAt,
    this.createdAt,
    this.id,
    this.fullName,
    this.roles,
  });

  String firstName;
  String lastName;
  String email;
  String gender;
  String uuid;
  DateTime updatedAt;
  DateTime createdAt;
  int id;
  String fullName;
  List<Role> roles;

  factory User.fromJson(Map<String, dynamic> json) => User(
    firstName: json["first_name"],
    lastName: json["last_name"],
    email: json["email"],
    gender: json["gender"],
    uuid: json["uuid"],
    updatedAt: DateTime.parse(json["updated_at"]),
    createdAt: DateTime.parse(json["created_at"]),
    id: json["id"],
    fullName: json["full_name"],
    roles: List<Role>.from(json["roles"].map((x) => Role.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "first_name": firstName,
    "last_name": lastName,
    "email": email,
    "gender": gender,
    "uuid": uuid,
    "updated_at": updatedAt.toIso8601String(),
    "created_at": createdAt.toIso8601String(),
    "id": id,
    "full_name": fullName,
    "roles": List<dynamic>.from(roles.map((x) => x.toJson())),
  };
}

class Role {
  Role({
    this.id,
    this.name,
    this.guardName,
    this.createdAt,
    this.updatedAt,
    this.pivot,
  });

  int id;
  String name;
  String guardName;
  DateTime createdAt;
  DateTime updatedAt;
  Pivot pivot;

  factory Role.fromJson(Map<String, dynamic> json) => Role(
    id: json["id"],
    name: json["name"],
    guardName: json["guard_name"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    pivot: Pivot.fromJson(json["pivot"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "guard_name": guardName,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "pivot": pivot.toJson(),
  };
}

class Pivot {
  Pivot({
    this.modelId,
    this.roleId,
    this.modelType,
  });

  int modelId;
  int roleId;
  String modelType;

  factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
    modelId: json["model_id"],
    roleId: json["role_id"],
    modelType: json["model_type"],
  );

  Map<String, dynamic> toJson() => {
    "model_id": modelId,
    "role_id": roleId,
    "model_type": modelType,
  };
}
