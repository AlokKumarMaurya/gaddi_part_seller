// To parse this JSON data, do
//
//     final sellerReturnPoliciesModal = sellerReturnPoliciesModalFromJson(jsonString);

import 'dart:convert';

SellerReturnPoliciesModal sellerReturnPoliciesModalFromJson(String str) => SellerReturnPoliciesModal.fromJson(json.decode(str));

String sellerReturnPoliciesModalToJson(SellerReturnPoliciesModal data) => json.encode(data.toJson());

class SellerReturnPoliciesModal {
  SellerReturnPoliciesModal({
   required this.data,
   required this.success,
   required this.status,
  });

  List<Datum> data;
  bool success;
  int status;

  factory SellerReturnPoliciesModal.fromJson(Map<String, dynamic> json) => SellerReturnPoliciesModal(
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
