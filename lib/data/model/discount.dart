import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class Discount {
  final String storeName;
  final int discountPercent;
  final String discountCode;

  Discount({
    required this.storeName,
    required this.discountPercent,
    required this.discountCode,
  });

  factory Discount.fromJson(Map<String, dynamic> json) {
    return Discount(
      storeName: json['storeName'],
      discountPercent: json['discountPercent'],
      discountCode: json['discountCode'],
    );
  }
}

Future<List<Discount>> loadDiscounts() async {
  String jsonString = await rootBundle.loadString('assets/json/discount.json');
  List<dynamic> jsonList = json.decode(jsonString);

  return jsonList.map((item) => Discount.fromJson(item)).toList();
}
