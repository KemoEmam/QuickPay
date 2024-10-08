import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:payment_flow/core/themes/styles/app_images.dart';
import 'package:payment_flow/core/themes/styles/app_text_styles.dart';

class CreditCardInfo extends StatelessWidget {
  const CreditCardInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Row(
          children: [
            SvgPicture.asset(AppImages.imagesMastercardLogo),
            const SizedBox(width: 24),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Credit Card\n',
                    style: AppTextStyles.interRegular18.copyWith(fontSize: 16),
                  ),
                  TextSpan(
                    text: 'Mastercard **78 ',
                    style: AppTextStyles.interRegular18
                        .copyWith(color: Colors.black54, fontSize: 14),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
