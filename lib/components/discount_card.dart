import 'package:flutter/material.dart';

class DiscountCard extends StatelessWidget {
  const DiscountCard({
    Key? key,
    required this.storeName,
    required this.discountAmount,
    required this.discountCode,
  }) : super(key: key);

  final String storeName;
  final int discountAmount;
  final String discountCode;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Card(
        color: Colors.blueAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 5,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                '$discountCode ($discountAmount% OFF)',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                'On everything today!',
                style: TextStyle(color: Colors.white),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                'With code: $discountCode at $storeName',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
