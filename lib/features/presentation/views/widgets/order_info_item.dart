import 'package:flutter/material.dart';
import 'package:payment_flow/core/themes/styles/app_text_styles.dart';

class OrderInfoItem extends StatelessWidget {
  const OrderInfoItem({
    super.key,
    required this.title,
    required this.price,
    this.textStyle, // Optional textStyle
  });

  final String title, price;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    // Fallback to AppTextStyles.interRegular18 if no style is provided
    final TextStyle effectiveTextStyle =
        textStyle ?? AppTextStyles.interRegular18;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: effectiveTextStyle),
        Text(price, style: effectiveTextStyle),
      ],
    );
  }
}
