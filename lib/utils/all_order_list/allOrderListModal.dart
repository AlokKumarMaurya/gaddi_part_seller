// To parse this JSON data, do
//
//     final allOrderList = allOrderListFromJson(jsonString);

import 'dart:convert';

AllOrderList allOrderListFromJson(String str) => AllOrderList.fromJson(json.decode(str));

String allOrderListToJson(AllOrderList data) => json.encode(data.toJson());

class AllOrderList {
  AllOrderList({
  required this.order,
  required this.result,
  required this.message,
  });

  List<Order> order;
  bool result;
  String message;

  factory AllOrderList.fromJson(Map<String, dynamic> json) => AllOrderList(
    order: List<Order>.from(json["order"].map((x) => Order.fromJson(x))),
    result: json["result"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "order": List<dynamic>.from(order.map((x) => x.toJson())),
    "result": result,
    "message": message,
  };
}

class Order {
  Order({
  required  this.id,
  required  this.userId,
  required  this.guestId,
  required  this.sellerId,
  required  this.shippingAddress,
  required  this.deliveryStatus,
  required  this.paymentType,
  required  this.paymentStatus,
  required  this.paymentDetails,
  required  this.grandTotal,
  required  this.couponDiscount,
  required  this.code,
  required  this.date,
  required  this.viewed,
  required  this.deliveryViewed,
  required  this.paymentStatusViewed,
  required  this.commissionCalculated,
  required  this.createdAt,
  required  this.updatedAt,
  });

  int id;
  String userId;
  dynamic guestId;
  String sellerId;
  String shippingAddress;
  String deliveryStatus;
  String paymentType;
  String paymentStatus;
  dynamic paymentDetails;
  String grandTotal;
  String couponDiscount;
  dynamic code;
  String date;
  String viewed;
  String deliveryViewed;
  String paymentStatusViewed;
  String commissionCalculated;
  DateTime createdAt;
  DateTime updatedAt;

  factory Order.fromJson(Map<String, dynamic> json) => Order(
    id: json["id"],
    userId: json["user_id"],
    guestId: json["guest_id"],
    sellerId: json["seller_id"],
    shippingAddress: json["shipping_address"],
    deliveryStatus: json["delivery_status"],
    paymentType: json["payment_type"],
    paymentStatus: json["payment_status"],
    paymentDetails: json["payment_details"],
    grandTotal: json["grand_total"] == null ? null : json["grand_total"],
    couponDiscount: json["coupon_discount"],
    code: json["code"],
    date: json["date"],
    viewed: json["viewed"],
    deliveryViewed: json["delivery_viewed"],
    paymentStatusViewed: json["payment_status_viewed"],
    commissionCalculated: json["commission_calculated"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "guest_id": guestId,
    "seller_id": sellerId,
    "shipping_address": shippingAddress,
    "delivery_status": deliveryStatus,
    "payment_type": paymentType,
    "payment_status": paymentStatus,
    "payment_details": paymentDetails,
    "grand_total": grandTotal == null ? null : grandTotal,
    "coupon_discount": couponDiscount,
    "code": code,
    "date": date,
    "viewed": viewed,
    "delivery_viewed": deliveryViewed,
    "payment_status_viewed": paymentStatusViewed,
    "commission_calculated": commissionCalculated,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
