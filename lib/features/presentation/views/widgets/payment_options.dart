import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:payment_flow/core/themes/styles/app_images.dart';

import 'payment_method_item.dart';

class PaymentOptionsSection extends StatelessWidget {
  const PaymentOptionsSection({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        PaymentMethodItem(
          cardType: Image.asset(
            AppImages.imagesVisaCard,
            fit: BoxFit.contain,
          ),
          width: screenWidth * 0.25,
        ),
        const SizedBox(width: 20),
        PaymentMethodItem(
          cardType: SvgPicture.asset(
            AppImages.imagesPaypal,
            fit: BoxFit.contain,
          ),
          width: screenWidth * 0.25,
        ),
        const SizedBox(width: 20),
        PaymentMethodItem(
          cardType: SvgPicture.asset(
            AppImages.imagesApplePay,
            fit: BoxFit.contain,
          ),
          width: screenWidth * 0.25,
        ),
      ],
    );
  }
}
