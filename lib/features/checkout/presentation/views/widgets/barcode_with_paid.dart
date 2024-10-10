import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:payment_flow/core/themes/styles/app_images.dart';
import 'package:payment_flow/core/themes/styles/app_text_styles.dart';

class BarcodeWithPaid extends StatelessWidget {
  const BarcodeWithPaid({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SvgPicture.asset(AppImages.imagesBarcode),
        Container(
          width: 113,
          height: 58,
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: const BorderSide(width: 1.50, color: Color(0xFF34A853)),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          child: Center(
            child: Text(
              'PAID',
              style: AppTextStyles.interSemiBold24.copyWith(
                color: const Color(0xFF34A853),
              ),
            ),
          ),
        )
      ],
    );
  }
}
