import 'package:flutter/material.dart';
import 'package:payment_flow/core/themes/styles/app_colors.dart';

class PaymentMethodItem extends StatelessWidget {
  const PaymentMethodItem({
    super.key,
    required this.cardType,
    this.width = 100,
    required this.isActive,
  });

  final Widget cardType;
  final double width;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: width,
      height: width * 0.6,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(
              width: 1.50,
              color: isActive ? AppColors.primaryColor : Colors.grey),
          borderRadius: BorderRadius.circular(17),
        ),
        shadows: [
          BoxShadow(
            color: isActive ? AppColors.primaryColor : Colors.grey,
            blurRadius: 1,
            offset: const Offset(0, 0),
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
          padding: const EdgeInsets.all(12),
          child: cardType,
        ),
      ),
    );
  }
}
