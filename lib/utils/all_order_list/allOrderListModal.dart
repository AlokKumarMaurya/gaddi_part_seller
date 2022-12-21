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
  required this.name,
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
  required this.orderDetails,
  });

  String? name;
  String? userId;
  dynamic guestId;
  String? sellerId;
  ShippingAddress? shippingAddress;
  String? deliveryStatus;
  String? paymentType;
  String? paymentStatus;
  dynamic paymentDetails;
  String? grandTotal;
  String? couponDiscount;
  dynamic code;
  String? date;
  String? viewed;
  String? deliveryViewed;
  String? paymentStatusViewed;
  String? commissionCalculated;
  DateTime? createdAt;
  DateTime? updatedAt;
  OrderDetails orderDetails;

  factory Order.fromJson(Map<String, dynamic> json) => Order(
    name: json["name"],
    userId: json["user_id"],
    guestId: json["guest_id"],
    sellerId: json["seller_id"],
    shippingAddress: ShippingAddress.fromJson(json["shipping_address"]),
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
    orderDetails: OrderDetails.fromJson(json["order_details"]),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "user_id": userId,
    "guest_id": guestId,
    "seller_id": sellerId,
    "shipping_address": shippingAddress!.toJson(),
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
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
    "order_details": orderDetails.toJson(),
  };
}

class OrderDetails {
  OrderDetails({
  required this.id,
  required this.orderId,
  required this.sellerId,
  required this.productId,
  required this.variation,
  required this.price,
  required this.tax,
  required this.shippingCost,
  required this.quantity,
  required this.paymentStatus,
  required this.deliveryStatus,
  required this.shippingType,
  required this.pickupPointId,
  required this.productReferralCode,
  required this.createdAt,
  required this.updatedAt,
  required this.product,
  });

  int? id;
  String? orderId;
  String? sellerId;
  String? productId;
  String? variation;
  String? price;
  String? tax;
  String? shippingCost;
  String? quantity;
  String? paymentStatus;
  String? deliveryStatus;
  String? shippingType;
  dynamic pickupPointId;
  dynamic productReferralCode;
  DateTime createdAt;
  DateTime updatedAt;
  Product product;

  factory OrderDetails.fromJson(Map<String, dynamic> json) => OrderDetails(
    id: json["id"],
    orderId: json["order_id"],
    sellerId: json["seller_id"],
    productId: json["product_id"],
    variation: json["variation"],
    price: json["price"],
    tax: json["tax"],
    shippingCost: json["shipping_cost"],
    quantity: json["quantity"],
    paymentStatus: json["payment_status"],
    deliveryStatus: json["delivery_status"],
    shippingType: json["shipping_type"],
    pickupPointId: json["pickup_point_id"],
    productReferralCode: json["product_referral_code"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    product: Product.fromJson(json["product"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "order_id": orderId,
    "seller_id": sellerId,
    "product_id": productId,
    "variation": variation,
    "price": price,
    "tax": tax,
    "shipping_cost": shippingCost,
    "quantity": quantity,
    "payment_status": paymentStatus,
    "delivery_status": deliveryStatus,
    "shipping_type": shippingType,
    "pickup_point_id": pickupPointId,
    "product_referral_code": productReferralCode,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "product": product.toJson(),
  };
}

class Product {
  Product({
   required this.id,
   required this.name,
   required this.addedBy,
   required this.userId,
   required this.categoryId,
   required this.brandId,
   required this.photos,
   required this.thumbnailImg,
   required this.videoProvider,
   required this.videoLink,
   required this.tags,
   required this.description,
   required this.unitPrice,
   required this.purchasePrice,
   required this.variantProduct,
   required this.attributes,
   required this.choiceOptions,
   required this.colors,
   required this.variations,
   required this.todaysDeal,
   required this.published,
   required this.approved,
   required this.stockVisibilityState,
   required this.cashOnDelivery,
   required this.featured,
   required this.sellerFeatured,
   required this.currentStock,
   required this.unit,
   required this.minQty,
   required this.lowStockQuantity,
   required this.discount,
   required this.discountType,
   required this.discountStartDate,
   required this.discountEndDate,
   required this.tax,
   required this.taxType,
   required this.shippingType,
   required this.shippingCost,
   required this.isQuantityMultiplied,
   required this.estShippingDays,
   required this.numOfSale,
   required this.metaTitle,
   required this.metaDescription,
   required this.metaImg,
   required this.pdf,
   required this.slug,
   required this.rating,
   required this.barcode,
   required this.digital,
   required this.fileName,
   required this.filePath,
   required this.createdAt,
   required this.updatedAt,
   required this.isGenuine,
   required this.quality,
   required this.weight,
  });

  int? id;
  String? name;
  String? addedBy;
  String? userId;
  String? categoryId;
  String? brandId;
  String? photos;
  String? thumbnailImg;
  String? videoProvider;
  String? videoLink;
  String? tags;
  String? description;
  String? unitPrice;
  dynamic purchasePrice;
  String? variantProduct;
  String? attributes;
  String? choiceOptions;
  String? colors;
  dynamic variations;
  String? todaysDeal;
  String? published;
  String? approved;
  String? stockVisibilityState;
  String? cashOnDelivery;
  String? featured;
  String? sellerFeatured;
  String? currentStock;
  String? unit;
  String? minQty;
  String? lowStockQuantity;
  String? discount;
  String? discountType;
  String? discountStartDate;
  String? discountEndDate;
  dynamic tax;
  dynamic taxType;
  String? shippingType;
  String? shippingCost;
  String? isQuantityMultiplied;
  String? estShippingDays;
  String? numOfSale;
  String? metaTitle;
  String? metaDescription;
  String? metaImg;
  dynamic pdf;
  String? slug;
  String? rating;
  dynamic barcode;
  String? digital;
  dynamic fileName;
  dynamic filePath;
  DateTime createdAt;
  DateTime updatedAt;
  String? isGenuine;
  String? quality;
  String? weight;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    name: json["name"],
    addedBy: json["added_by"],
    userId: json["user_id"],
    categoryId: json["category_id"],
    brandId: json["brand_id"],
    photos: json["photos"],
    thumbnailImg: json["thumbnail_img"],
    videoProvider: json["video_provider"],
    videoLink: json["video_link"] == null ? null : json["video_link"],
    tags: json["tags"],
    description: json["description"] == null ? null : json["description"],
    unitPrice: json["unit_price"],
    purchasePrice: json["purchase_price"],
    variantProduct: json["variant_product"],
    attributes: json["attributes"],
    choiceOptions: json["choice_options"],
    colors: json["colors"],
    variations: json["variations"],
    todaysDeal: json["todays_deal"],
    published: json["published"],
    approved: json["approved"],
    stockVisibilityState: json["stock_visibility_state"],
    cashOnDelivery: json["cash_on_delivery"],
    featured: json["featured"],
    sellerFeatured: json["seller_featured"],
    currentStock: json["current_stock"],
    unit: json["unit"],
    minQty: json["min_qty"],
    lowStockQuantity: json["low_stock_quantity"],
    discount: json["discount"],
    discountType: json["discount_type"],
    discountStartDate: json["discount_start_date"] == null ? null : json["discount_start_date"],
    discountEndDate: json["discount_end_date"] == null ? null : json["discount_end_date"],
    tax: json["tax"],
    taxType: json["tax_type"],
    shippingType: json["shipping_type"],
    shippingCost: json["shipping_cost"],
    isQuantityMultiplied: json["is_quantity_multiplied"],
    estShippingDays: json["est_shipping_days"] == null ? null : json["est_shipping_days"],
    numOfSale: json["num_of_sale"],
    metaTitle: json["meta_title"],
    metaDescription: json["meta_description"],
    metaImg: json["meta_img"],
    pdf: json["pdf"],
    slug: json["slug"],
    rating: json["rating"],
    barcode: json["barcode"],
    digital: json["digital"],
    fileName: json["file_name"],
    filePath: json["file_path"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    isGenuine: json["is_genuine"] == null ? null : json["is_genuine"],
    quality: json["quality"] == null ? null : json["quality"],
    weight: json["weight"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "added_by": addedBy,
    "user_id": userId,
    "category_id": categoryId,
    "brand_id": brandId,
    "photos": photos,
    "thumbnail_img": thumbnailImg,
    "video_provider": videoProvider,
    "video_link": videoLink == null ? null : videoLink,
    "tags": tags,
    "description": description == null ? null : description,
    "unit_price": unitPrice,
    "purchase_price": purchasePrice,
    "variant_product": variantProduct,
    "attributes": attributes,
    "choice_options": choiceOptions,
    "colors": colors,
    "variations": variations,
    "todays_deal": todaysDeal,
    "published": published,
    "approved": approved,
    "stock_visibility_state": stockVisibilityState,
    "cash_on_delivery": cashOnDelivery,
    "featured": featured,
    "seller_featured": sellerFeatured,
    "current_stock": currentStock,
    "unit": unit,
    "min_qty": minQty,
    "low_stock_quantity": lowStockQuantity,
    "discount": discount,
    "discount_type": discountType,
    "discount_start_date": discountStartDate == null ? null : discountStartDate,
    "discount_end_date": discountEndDate == null ? null : discountEndDate,
    "tax": tax,
    "tax_type": taxType,
    "shipping_type": shippingType,
    "shipping_cost": shippingCost,
    "is_quantity_multiplied": isQuantityMultiplied,
    "est_shipping_days": estShippingDays == null ? null : estShippingDays,
    "num_of_sale": numOfSale,
    "meta_title": metaTitle,
    "meta_description": metaDescription,
    "meta_img": metaImg,
    "pdf": pdf,
    "slug": slug,
    "rating": rating,
    "barcode": barcode,
    "digital": digital,
    "file_name": fileName,
    "file_path": filePath,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "is_genuine": isGenuine == null ? null : isGenuine,
    "quality": quality == null ? null : quality,
    "weight": weight,
  };
}

class ShippingAddress {
  ShippingAddress({
   required this.id,
   required this.userId,
   required this.address,
   required this.country,
   required this.city,
   required this.longitude,
   required this.latitude,
   required this.postalCode,
   required this.phone,
   required this.setDefault,
   required this.createdAt,
   required this.updatedAt,
   required this.name,
   required this.email,
  });

  int? id;
  String? userId;
  String? address;
  String? country;
  String? city;
  dynamic longitude;
  dynamic latitude;
  String? postalCode;
  String? phone;
  String? setDefault;
  DateTime createdAt;
  DateTime updatedAt;
  String? name;
  String? email;

  factory ShippingAddress.fromJson(Map<String, dynamic> json) => ShippingAddress(
    id: json["id"],
    userId: json["user_id"],
    address: json["address"],
    country: json["country"],
    city: json["city"],
    longitude: json["longitude"],
    latitude: json["latitude"],
    postalCode: json["postal_code"],
    phone: json["phone"],
    setDefault: json["set_default"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    name: json["name"],
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "address": address,
    "country": country,
    "city": city,
    "longitude": longitude,
    "latitude": latitude,
    "postal_code": postalCode,
    "phone": phone,
    "set_default": setDefault,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "name": name,
    "email": email,
  };
}
