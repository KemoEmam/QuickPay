import 'package:flutter/material.dart';
import 'package:payment_flow/core/themes/styles/app_colors.dart';
import 'package:payment_flow/core/themes/styles/app_text_styles.dart';
import 'package:payment_flow/features/checkout/presentation/views/widgets/custom_button.dart';

class PaymentButton extends StatelessWidget {
  const PaymentButton(
      {super.key, required this.formKey, required this.onPressed});
  final GlobalKey<FormState> formKey;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: CustomButton(
          textColor: Colors.black,
          text: 'Pay Now',
          onPressed: onPressed,
          buttonColor: AppColors.primaryColor,
          textStyle: AppTextStyles.interMedium22,
        ),
      ),
    );
  }
}
