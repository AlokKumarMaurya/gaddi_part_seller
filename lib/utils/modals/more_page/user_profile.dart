// To parse this JSON data, do
//
//     final userProfile = userProfileFromJson(jsonString);

import 'dart:convert';

UserProfile userProfileFromJson(String str) => UserProfile.fromJson(json.decode(str));

String userProfileToJson(UserProfile data) => json.encode(data.toJson());

class UserProfile {
  UserProfile({
  required this.name,
  required this.email,
  required this.address,
  required this.country,
  required this.city,
  required this.postalCode,
  required this.phone,
  required this.balance,
  required this.avatarOriginal,
  });

  String name;
  String email;
  String address;
  String country;
  String city;
  String postalCode;
  String phone;
  String balance;
  String avatarOriginal;

  factory UserProfile.fromJson(Map<String, dynamic> json) => UserProfile(
    name: json["name"],
    email: json["email"],
    address: json["address"],
    country: json["country"],
    city: json["city"],
    postalCode: json["postal_code"],
    phone: json["phone"],
    balance: json["balance"],
    avatarOriginal: json["avatar_original"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
    "address": address,
    "country": country,
    "city": city,
    "postal_code": postalCode,
    "phone": phone,
    "balance": balance,
    "avatar_original": avatarOriginal,
  };
}
