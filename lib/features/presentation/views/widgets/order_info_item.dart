import 'package:flutter/material.dart';
import 'package:payment_flow/core/themes/styles/app_text_styles.dart';

class OrderInfoItem extends StatelessWidget {
  const OrderInfoItem({
    super.key,
    required this.title,
    required this.price,
    this.titleStyle, // Optional title textStyle
    this.priceStyle, // Optional price textStyle
  });

  final String title, price;
  final TextStyle? titleStyle;
  final TextStyle? priceStyle;

  @override
  Widget build(BuildContext context) {
    // Fallback to AppTextStyles.interRegular18 if no style is provided
    final TextStyle effectiveTitleTextStyle =
        titleStyle ?? AppTextStyles.interRegular18;
    final TextStyle effectivePriceTextStyle =
        priceStyle ?? AppTextStyles.interRegular18;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: effectiveTitleTextStyle),
        Text(price, style: effectivePriceTextStyle),
      ],
    );
  }
}
