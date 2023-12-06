import 'package:flutter/material.dart';
import 'package:kupro/components/amount_button.dart';
import 'package:kupro/presentation/details/components/size_circle_component.dart';
import 'package:kupro/presentation/details/providers/size_provider.dart';
import 'package:kupro/res/app_text_style.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key, this.product});

  final dynamic product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              if (product != null)
                Stack(
                  children: [
                    Image.network(
                      product!.productImage,
                      fit: BoxFit.fitHeight,
                    ),
                  ],
                ),
              Container(
                color: Colors.white,
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 8.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              product?.brandName,
                              style: AppTextStyle().poppins20Black700,
                            ),
                            Text(
                              product?.productName,
                              style: AppTextStyle().poppins12Black500,
                            ),
                          ],
                        ),
                        AmountActionButton()
                      ],
                    ),
                    Text(
                      'Size',
                      style: AppTextStyle().poppins20Black700,
                    ),
                    Consumer<SizeProvider>(
                        builder: (context, sizeProvider, __) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizeCircleComponent(
                            size: 'S',
                            isSelected: sizeProvider.selectedSize == 'S',
                            onPressed: () {
                              sizeProvider.selectedSize = 'S';
                            },
                          ),
                          SizedBox(width: 10),
                          SizeCircleComponent(
                            size: 'M',
                            isSelected: sizeProvider.selectedSize == 'M',
                            onPressed: () {
                              sizeProvider.selectedSize = 'M';
                            },
                          ),
                          SizedBox(width: 10),
                          SizeCircleComponent(
                            size: 'L',
                            isSelected: sizeProvider.selectedSize == 'L',
                            onPressed: () {
                              sizeProvider.selectedSize = 'L';
                            },
                          ),
                          SizedBox(width: 10),
                        ],
                      );
                    })
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
