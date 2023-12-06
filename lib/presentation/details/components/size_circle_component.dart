import 'package:flutter/material.dart';

class SizeCircleComponent extends StatelessWidget {
  const SizeCircleComponent({
    super.key,
    required this.size,
    this.onPressed,
    required this.isSelected,
  });
  final String size;
  final VoidCallback? onPressed;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: isSelected ? Colors.black : Colors.white,
          border: Border.all(
            color: Colors.black,
            width: isSelected ? 0 : 0.5,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            size,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
