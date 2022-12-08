// To parse this JSON data, do
//
//     final sellerSupportModal = sellerSupportModalFromJson(jsonString);

import 'dart:convert';

SellerSupportModal sellerSupportModalFromJson(String str) => SellerSupportModal.fromJson(json.decode(str));

String sellerSupportModalToJson(SellerSupportModal data) => json.encode(data.toJson());

class SellerSupportModal {
  SellerSupportModal({
   required this.data,
   required this.success,
   required this.status,
  });

  List<Datum> data;
  bool success;
  int status;

  factory SellerSupportModal.fromJson(Map<String, dynamic> json) => SellerSupportModal(
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
