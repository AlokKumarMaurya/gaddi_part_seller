// To parse this JSON data, do
//
//     final profileUpdateModal = profileUpdateModalFromJson(jsonString);

import 'dart:convert';

ProfileUpdateModal profileUpdateModalFromJson(String str) => ProfileUpdateModal.fromJson(json.decode(str));

String profileUpdateModalToJson(ProfileUpdateModal data) => json.encode(data.toJson());

class ProfileUpdateModal {
  ProfileUpdateModal({
    required this.message,
  });

  String message;

  factory ProfileUpdateModal.fromJson(Map<String, dynamic> json) => ProfileUpdateModal(
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
  };
}
