import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kupro/data/model/product.dart';
import 'package:kupro/res/app_text_style.dart';
import 'package:kupro/presentation/details/product_details_screen.dart';

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
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailScreen(
              product: Product(
                brandName: brandName,
                productName: productName,
                productPrice: productPrice,
                productImage: productImage,
              ),
            ),
          ),
        );
      },
      child: Card(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
          child: Hero(
            tag: 'product_${productName.toLowerCase()}',
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
          ),
        ),
      ),
    );
  }
}
