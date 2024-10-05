import 'package:flutter/material.dart';

class PaymentMethodItem extends StatelessWidget {
  const PaymentMethodItem(
      {super.key, required this.cardType, this.width = 100});

  final Widget cardType;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width, // Dynamic width
      height: width * 0.6, // Keeping a consistent aspect ratio
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1.50, color: Color(0xFF34A853)),
          borderRadius: BorderRadius.circular(17),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0xFF34A853),
            blurRadius: .5,
            offset: Offset(0, 0),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Container(
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Padding(
          padding:
              const EdgeInsets.all(12), // Add padding to control image size
          child: cardType,
        ),
      ),
    );
  }
}
