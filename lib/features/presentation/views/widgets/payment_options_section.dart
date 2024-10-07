import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:payment_flow/core/themes/styles/app_images.dart';

import 'payment_method_item.dart';

class PaymentOptionsSection extends StatefulWidget {
  const PaymentOptionsSection({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  State<PaymentOptionsSection> createState() => _PaymentOptionsSectionState();
}

class _PaymentOptionsSectionState extends State<PaymentOptionsSection> {
  int selectedCardIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              selectedCardIndex = 0;
            });
          },
          child: PaymentMethodItem(
            cardType: Image.asset(AppImages.imagesVisaCard),
            width: widget.screenWidth * 0.25,
            isActive: selectedCardIndex == 0,
          ),
        ),
        const SizedBox(width: 20),
        GestureDetector(
          onTap: () {
            setState(() {
              selectedCardIndex = 1;
            });
          },
          child: PaymentMethodItem(
            cardType: SvgPicture.asset(AppImages.imagesPaypal),
            width: widget.screenWidth * 0.25,
            isActive: selectedCardIndex == 1,
          ),
        ),
        const SizedBox(width: 20),
        GestureDetector(
          onTap: () {
            setState(() {
              selectedCardIndex = 2;
            });
          },
          child: PaymentMethodItem(
            cardType: SvgPicture.asset(
              AppImages.imagesApplePay,
              fit: BoxFit.scaleDown,
            ),
            width: widget.screenWidth * 0.25,
            isActive: selectedCardIndex == 2,
          ),
        ),
      ],
    );
  }
}
