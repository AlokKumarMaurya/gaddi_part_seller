// To parse this JSON data, do
//
//     final signUpModal = signUpModalFromJson(jsonString);

import 'dart:convert';

SignUpModal signUpModalFromJson(String str) => SignUpModal.fromJson(json.decode(str));

String signUpModalToJson(SignUpModal data) => json.encode(data.toJson());

class SignUpModal {
  SignUpModal({
   required this.result,
   required this.message,
   required this.userId,
  });

  bool result;
  String message;
  int userId;

  factory SignUpModal.fromJson(Map<String, dynamic> json) => SignUpModal(
    result: json["result"],
    message: json["message"],
    userId: json["user_id"],
  );

  Map<String, dynamic> toJson() => {
    "result": result,
    "message": message,
    "user_id": userId,
  };
}
