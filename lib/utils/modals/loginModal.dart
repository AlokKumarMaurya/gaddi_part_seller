// To parse this JSON data, do
//
//     final loginModal = loginModalFromJson(jsonString);

import 'dart:convert';

LoginModal loginModalFromJson(String str) => LoginModal.fromJson(json.decode(str));

String loginModalToJson(LoginModal data) => json.encode(data.toJson());

class LoginModal {
  LoginModal({
   required this.result,
   required this.message,
   required this.accessToken,
   required this.tokenType,
   required this.expiresAt,
   required this.user,
   required this.userId,
  });

  bool result;
  String message;
  String accessToken;
  String tokenType;
  DateTime expiresAt;
  User user;
  int userId;

  factory LoginModal.fromJson(Map<String, dynamic> json) => LoginModal(
    result: json["result"],
    message: json["message"],
    accessToken: json["access_token"],
    tokenType: json["token_type"],
    expiresAt: DateTime.parse(json["expires_at"]),
    user: User.fromJson(json["user"]),
    userId: json["user_id"],
  );

  Map<String, dynamic> toJson() => {
    "result": result,
    "message": message,
    "access_token": accessToken,
    "token_type": tokenType,
    "expires_at": expiresAt.toIso8601String(),
    "user": user.toJson(),
    "user_id": userId,
  };
}

class User {
  User({
   required this.id,
   required this.type,
   required this.name,
   required this.email,
   required this.avatar,
   required this.avatarOriginal,
   required this.phone,
  });

  int id;
  String type;
  String name;
  String email;
  dynamic avatar;
  String avatarOriginal;
  String phone;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    type: json["type"],
    name: json["name"],
    email: json["email"],
    avatar: json["avatar"],
    avatarOriginal: json["avatar_original"],
    phone: json["phone"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "type": type,
    "name": name,
    "email": email,
    "avatar": avatar,
    "avatar_original": avatarOriginal,
    "phone": phone,
  };
}
