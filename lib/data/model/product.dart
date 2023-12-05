import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class Product {
  final String brandName;
  final String productName;
  final String productPrice;
  final String productImage;

  Product({
    required this.brandName,
    required this.productName,
    required this.productPrice,
    required this.productImage,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      brandName: json['brandName'],
      productName: json['productName'],
      productPrice: json['productPrice'],
      productImage: json['productImage'],
    );
  }
}

Future<List<Product>> loadProducts() async {
  String jsonString = await rootBundle.loadString('assets/json/product.json');
  List<dynamic> jsonList = json.decode(jsonString);

  return jsonList.map((item) => Product.fromJson(item)).toList();
}
