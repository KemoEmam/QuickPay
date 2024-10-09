import 'package:flutter/material.dart';
import 'package:payment_flow/core/themes/styles/app_colors.dart';
import 'package:payment_flow/core/themes/styles/app_text_styles.dart';
import 'package:payment_flow/features/presentation/views/widgets/custom_button.dart';
import 'package:payment_flow/features/presentation/views/widgets/payment_options_section.dart';

class PaymentMehodsBottomSheet extends StatelessWidget {
  const PaymentMehodsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 20),
          const PaymentOptionsSection(),
          const SizedBox(height: 25),
          CustomButton(
            textStyle: AppTextStyles.interMedium22,
            textColor: Colors.black,
            text: 'Pay Now',
            onPressed: () {},
            buttonColor: AppColors.primaryColor,
          )
        ],
      ),
    );
  }
}
