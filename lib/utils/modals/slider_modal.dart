// To parse this JSON data, do
//
//     final sliderModal = sliderModalFromJson(jsonString);

import 'dart:convert';

SliderModal sliderModalFromJson(String str) =>
    SliderModal.fromJson(json.decode(str));

String sliderModalToJson(SliderModal data) => json.encode(data.toJson());

class SliderModal {
  SliderModal({
    required this.data,
    required this.success,
    required this.status,
  });

  List<Datum> data;
  bool success;
  int status;

  factory SliderModal.fromJson(Map<String, dynamic> json) => SliderModal(
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
    required this.photo,
  });

  String photo;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        photo: json["photo"],
      );

  Map<String, dynamic> toJson() => {
        "photo": photo,
      };
}
