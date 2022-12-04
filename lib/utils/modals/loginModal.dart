// To parse this JSON data, do
//
//     final loginModal = loginModalFromJson(jsonString);

import 'dart:convert';

LoginModal loginModalFromJson(String str) => LoginModal.fromJson(json.decode(str));

String loginModalToJson(LoginModal data) => json.encode(data.toJson());

class LoginModal {
  LoginModal({
  required this.token,
  required this.tokenType,
  required this.expiresAt,
  required this.user,
  });

  String token;
  String tokenType;
  DateTime expiresAt;
  User user;

  factory LoginModal.fromJson(Map<String, dynamic> json) => LoginModal(
    token: json["token"],
    tokenType: json["token_type"],
    expiresAt: DateTime.parse(json["expires_at"]),
    user: User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "token": token,
    "token_type": tokenType,
    "expires_at": expiresAt.toIso8601String(),
    "user": user.toJson(),
  };
}

class User {
  User({
   required this.id,
   required this.type,
   required this.name,
  required  this.email,
    this.avatar,
    this.avatarOriginal,
    this.address,
    this.country,
    this.city,
    this.postalCode,
   required this.phone,
  });

  int id;
  String type;
  String name;
  String email;
  dynamic avatar;
  dynamic avatarOriginal;
  dynamic address;
  dynamic country;
  dynamic city;
  dynamic postalCode;
  String phone;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    type: json["type"],
    name: json["name"],
    email: json["email"],
    avatar: json["avatar"],
    avatarOriginal: json["avatar_original"],
    address: json["address"],
    country: json["country"],
    city: json["city"],
    postalCode: json["postal_code"],
    phone: json["phone"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "type": type,
    "name": name,
    "email": email,
    "avatar": avatar,
    "avatar_original": avatarOriginal,
    "address": address,
    "country": country,
    "city": city,
    "postal_code": postalCode,
    "phone": phone,
  };
}
