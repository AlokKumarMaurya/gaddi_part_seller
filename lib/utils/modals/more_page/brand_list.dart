// To parse this JSON data, do
//
//     final brandList = brandListFromJson(jsonString);

import 'dart:convert';

BrandList brandListFromJson(String str) => BrandList.fromJson(json.decode(str));

String brandListToJson(BrandList data) => json.encode(data.toJson());

class BrandList {
  BrandList({
   required this.data,
   required this.links,
   required this.meta,
   required this.success,
   required this.status,
  });

  List<Datum> data;
  BrandListLinks links;
  Meta meta;
  bool success;
  int status;

  factory BrandList.fromJson(Map<String, dynamic> json) => BrandList(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    links: BrandListLinks.fromJson(json["links"]),
    meta: Meta.fromJson(json["meta"]),
    success: json["success"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "links": links.toJson(),
    "meta": meta.toJson(),
    "success": success,
    "status": status,
  };
}

class Datum {
  Datum({
  required this.id,
  required this.name,
  required this.logo,
  required this.links,
  });

  int id;
  String name;
  String logo;
  DatumLinks links;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    name: json["name"],
    logo: json["logo"],
    links: DatumLinks.fromJson(json["links"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "logo": logo,
    "links": links.toJson(),
  };
}

class DatumLinks {
  DatumLinks({
    required this.products,
  });

  String products;

  factory DatumLinks.fromJson(Map<String, dynamic> json) => DatumLinks(
    products: json["products"],
  );

  Map<String, dynamic> toJson() => {
    "products": products,
  };
}

class BrandListLinks {
  BrandListLinks({
   required this.first,
   required this.last,
   required this.prev,
   required this.next,
  });

  String first;
  String last;
  dynamic prev;
  dynamic next;

  factory BrandListLinks.fromJson(Map<String, dynamic> json) => BrandListLinks(
    first: json["first"],
    last: json["last"],
    prev: json["prev"],
    next: json["next"],
  );

  Map<String, dynamic> toJson() => {
    "first": first,
    "last": last,
    "prev": prev,
    "next": next,
  };
}

class Meta {
  Meta({
   required this.currentPage,
   required this.from,
   required this.lastPage,
   required this.path,
   required this.perPage,
   required this.to,
   required this.total,
  });

  int currentPage;
  int from;
  int lastPage;
  String path;
  int perPage;
  int to;
  int total;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
    currentPage: json["current_page"],
    from: json["from"],
    lastPage: json["last_page"],
    path: json["path"],
    perPage: json["per_page"],
    to: json["to"],
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "current_page": currentPage,
    "from": from,
    "last_page": lastPage,
    "path": path,
    "per_page": perPage,
    "to": to,
    "total": total,
  };
}
