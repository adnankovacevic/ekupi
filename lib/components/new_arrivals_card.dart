import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kupro/res/app_text_style.dart';

class NewArrivalsCard extends StatelessWidget {
  const NewArrivalsCard({
    super.key,
    required this.brandName,
    required this.productName,
    required this.productPrice,
    required this.productImage,
  });
  final String productImage;
  final String brandName;
  final String productName;
  final String productPrice;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Image.network(productImage),
              ],
            ),
          ),
          Text(
            brandName,
            style: AppTextStyle().poppins14Black500,
          ),
          Text(
            productName,
            style: AppTextStyle().poppins12Black500,
          ),
          Text(
            productPrice,
            style: AppTextStyle().poppins10Blue500,
          ),
        ],
      ),
    );
  }
}
