// To parse this JSON data, do
//
//     final sellerPolicies = sellerPoliciesFromJson(jsonString);

import 'dart:convert';

SellerPolicies sellerPoliciesFromJson(String str) => SellerPolicies.fromJson(json.decode(str));

String sellerPoliciesToJson(SellerPolicies data) => json.encode(data.toJson());

class SellerPolicies {
  SellerPolicies({
   required this.data,
   required this.success,
   required this.status,
  });

  List<Datum> data;
  bool success;
  int status;

  factory SellerPolicies.fromJson(Map<String, dynamic> json) => SellerPolicies(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    success: json["success"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "success": success,
    "status": status,
  };
}

class Datum {
  Datum({
   required this.content,
  });

  String content;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    content: json["content"],
  );

  Map<String, dynamic> toJson() => {
    "content": content,
  };
}
