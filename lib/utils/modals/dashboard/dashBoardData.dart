// To parse this JSON data, do
//
//     final allDashBoardData = allDashBoardDataFromJson(jsonString);

import 'dart:convert';

List<AllDashBoardData> allDashBoardDataFromJson(String str) => List<AllDashBoardData>.from(json.decode(str).map((x) => AllDashBoardData.fromJson(x)));

String allDashBoardDataToJson(List<AllDashBoardData> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AllDashBoardData {
  AllDashBoardData({
 required this.totalProduct,
 required this.totalSale,
 required this.deliveryStatus,
 required this.totalOrder,
 required this.pandingOrder,
 required this.cancleOrder,
 required this.successOrder,
 required this.orderDetails,
  });

  int totalProduct;
  int totalSale;
  int deliveryStatus;
  int totalOrder;
  int pandingOrder;
  int cancleOrder;
  int successOrder;
  List<OrderDetail> orderDetails;

  factory AllDashBoardData.fromJson(Map<String, dynamic> json) => AllDashBoardData(
    totalProduct: json["total_product"],
    totalSale: json["total_sale"],
    deliveryStatus: json["delivery_status"],
    totalOrder: json["total_order"],
    pandingOrder: json["panding_order"],
    cancleOrder: json["cancle_order"],
    successOrder: json["success_order"],
    orderDetails: List<OrderDetail>.from(json["order_details"].map((x) => OrderDetail.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "total_product": totalProduct,
    "total_sale": totalSale,
    "delivery_status": deliveryStatus,
    "total_order": totalOrder,
    "panding_order": pandingOrder,
    "cancle_order": cancleOrder,
    "success_order": successOrder,
    "order_details": List<dynamic>.from(orderDetails.map((x) => x.toJson())),
  };
}

class OrderDetail {
  OrderDetail({
   required this.id,
   required this.userId,
   required this.guestId,
   required this.sellerId,
   required this.shippingAddress,
   required this.deliveryStatus,
   required this.paymentType,
   required this.paymentStatus,
   required this.paymentDetails,
   required this.grandTotal,
   required this.couponDiscount,
   required this.code,
   required this.date,
   required this.viewed,
   required this.deliveryViewed,
   required this.paymentStatusViewed,
   required this.commissionCalculated,
   required this.createdAt,
   required this.updatedAt,
  });

  int id;
  String userId;
  dynamic guestId;
  String sellerId;
  String shippingAddress;
  DeliveryStatus? deliveryStatus;
  PaymentType? paymentType;
  PaymentStatus? paymentStatus;
  dynamic paymentDetails;
  String? grandTotal;
  String couponDiscount;
  dynamic code;
  String date;
  String viewed;
  String deliveryViewed;
  String paymentStatusViewed;
  String commissionCalculated;
  DateTime createdAt;
  DateTime updatedAt;

  factory OrderDetail.fromJson(Map<String, dynamic> json) => OrderDetail(
    id: json["id"],
    userId: json["user_id"],
    guestId: json["guest_id"],
    sellerId: json["seller_id"],
    shippingAddress: json["shipping_address"],
    deliveryStatus: deliveryStatusValues.map[json["delivery_status"]],
    paymentType: paymentTypeValues.map[json["payment_type"]],
    paymentStatus: paymentStatusValues.map[json["payment_status"]],
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
    "delivery_status": deliveryStatusValues.reverse![deliveryStatus],
    "payment_type": paymentTypeValues.reverse![paymentType],
    "payment_status": paymentStatusValues.reverse![paymentStatus],
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

enum DeliveryStatus { PENDING }

final deliveryStatusValues = EnumValues({
  "pending": DeliveryStatus.PENDING
});

enum PaymentStatus { UNPAID }

final paymentStatusValues = EnumValues({
  "unpaid": PaymentStatus.UNPAID
});

enum PaymentType { RAZORPAY }

final paymentTypeValues = EnumValues({
  "razorpay": PaymentType.RAZORPAY
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
